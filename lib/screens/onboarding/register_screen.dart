import 'package:flutter/material.dart';
import 'package:fl_examen_final/screens/screens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  bool _obsPassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  AppLocalizations.of(context)!.createAnAccount, 
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 25),
                Text(
                  AppLocalizations.of(context)!.user, 
                  style: theme.textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                const SizedBox(
                  height: 48,
                  child: TextField(),
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.email, 
                  style: theme.textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                const SizedBox(
                  height: 48,
                  child: TextField(),
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
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.createAnAccount), 
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: theme.textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.termsAndConditions, 
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.termsOfUse,
                          style: theme.textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.underline,
                            color: theme.primaryColor,
                          ),
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}