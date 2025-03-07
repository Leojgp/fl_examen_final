import 'package:fl_examen_final/services/auth_service.dart';
import 'package:fl_examen_final/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obsPassword = true;
  bool _isLoading = false;
  bool _navigated = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return StreamBuilder<User?>(
      stream: _authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData && !_navigated) {
          _navigated = true;
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (context.mounted) {
              await _checkUserOnboardingStatus(snapshot.data!);
            }
          });
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.logIn,
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      AppLocalizations.of(context)!.email,
                      style: theme.textTheme.labelMedium,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 48,
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      AppLocalizations.of(context)!.password,
                      style: theme.textTheme.labelMedium,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 48,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _obsPassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obsPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obsPassword = !_obsPassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PasswordScreen(),
                            ),
                          );
                        },
                        child: Text(AppLocalizations.of(context)!
                            .iDontRememberMyPassword),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _handleEmailPasswordSignIn,
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : Text(AppLocalizations.of(context)!.logIn),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      decoration: BoxDecoration(
                        color: theme.inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dontHaveAnAccountYet,
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegistroScreen(),
                                ),
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.createAnAccount,
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context)!.or,
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _handleGoogleSignIn,
                            child: Text(AppLocalizations.of(context)!.signInWithGoogle),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _checkUserOnboardingStatus(User firebaseUser) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      if (!context.mounted) return;

      final onboardingComplete = await isOnboard();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => onboardingComplete
              ? const HomeScreen()
              : const OnboardingScreen(),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    } finally {
      // Solo actualizar el estado si el widget sigue montado
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _handleGoogleSignIn() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await _authService.signInWithGoogle();
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

// También completa el método _handleEmailPasswordSignIn
  Future<void> _handleEmailPasswordSignIn() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              AppLocalizations.of(context)!.pleaseEnterBothEmailAndPassword),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Implementa la autenticación con email y contraseña
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // No necesitas hacer nada más aquí, el StreamBuilder detectará
      // el cambio en el estado de autenticación
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
