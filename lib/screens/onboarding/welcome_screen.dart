import 'package:fl_examen_final/providers/user_provider.dart';
import 'package:fl_examen_final/screens/onboarding/components/theme_selector.dart';
import 'package:fl_examen_final/screens/settings/menu_especial.dart';
import 'package:fl_examen_final/services/user_service.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fl_examen_final/providers/language_provider.dart';
import 'package:fl_examen_final/screens/screens.dart';
import 'package:fl_examen_final/screens/onboarding/components/language_selector.dart';
import 'package:provider/provider.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final LocalAuthentication _auth = LocalAuthentication();
  bool _isAuthenticated = false;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeUser();
    });
  }

  Future<void> _initializeUser() async {
    if (user == null) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.refreshUser();

      if (!await isOnboard() && userProvider.user != null) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          _slideTransition(const OnboardingScreen()),
        );
      } else {
        await _authenticateWithBiometrics();
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Método separado para autenticación biométrica
  Future<void> _authenticateWithBiometrics() async {
    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;

    if (!canAuthenticateWithBiometrics) {
      // Si no se puede usar biometría, considerar autenticado directamente
      // o mostrar otra opción de autenticación
      setState(() {
        _isAuthenticated = true; // O podrías manejarlo de otra manera
      });
      return;
    }

    try {
      final bool didAuthenticate = await _auth.authenticate(
        localizedReason: AppLocalizations.of(context)!.biometricText,
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (mounted) {
        setState(() {
          _isAuthenticated = didAuthenticate;
        });
      }
    } on PlatformException catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    // Usuario ya está logueado
    if (user != null) {
      // Usuario autenticado, ir a la pantalla principal
      if (_isAuthenticated) {
        // Usa Navigator.pushReplacement directamente en lugar de un post-frame callback
        // para evitar renderizar el indicador de progreso innecesariamente
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              _slideTransition(const HomeScreen()),
            );
          }
        });

        // Mostrar pantalla de carga mientras se prepara la transición
        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      }

      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isLoading) const CircularProgressIndicator(),
              const SizedBox(height: 20),

              // Mostrar mensaje de error si existe
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),

              if (!_isLoading && _errorMessage != null)
                ElevatedButton(
                  onPressed: _initializeUser,
                  child: const Text("Intenta de nuevo"),
                ),
            ],
          ),
        ),
      );
    }

    //
    return Scaffold(
      appBar: AppBar(
        actions: [
          LanguageSelector(
            onLanguageSelected: (languageCode) {
              Provider.of<LanguageProvider>(context, listen: false)
                  .changeLanguage(languageCode);
            },
          ),
          ThemeSelector(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                isDarkTheme ? 'assets/logo-blanco.png' : 'assets/logo2f.png',
                height: 150,
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Easy',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextSpan(
                      text: 'Bite',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        _slideTransition(const RegistroScreen()),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.startNow),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        _slideTransition(const MenuEspecial()),
                      );
                    },
                    child: Text('Menu Especial'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.alreadyAMember),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        _slideTransition(const LoginScreen()),
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.logIn,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  /// Transición de deslizamiento
  PageRouteBuilder _slideTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
