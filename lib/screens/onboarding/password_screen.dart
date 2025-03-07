import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart'; 

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: isDarkTheme ? AppTheme.darkBackground : AppTheme.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, 
            color: isDarkTheme ? AppTheme.white : AppTheme.black
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.forgottenPassword, 
                style: isDarkTheme 
                    ? theme.textTheme.displaySmall 
                    : theme.textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.weWillSendYouAnEmailToResetYourPassword, 
                style: isDarkTheme 
                    ? theme.textTheme.bodyMedium 
                    : theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.email, 
                style: isDarkTheme 
                    ? theme.textTheme.labelMedium 
                    : theme.textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: isDarkTheme 
                        ? AppTheme.darkInputBackground 
                        : AppTheme.inputBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    hintText: 'EasyBite@email.com',
                    hintStyle: TextStyle(
                      color: isDarkTheme ? Colors.white60 : Colors.grey[600],
                    ),
                  ),
                  style: TextStyle(
                    color: isDarkTheme ? AppTheme.white : AppTheme.black,
                  ),
                ),
              ),
              const Spacer(flex: 1),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para restablecer la contraseña
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.mediumGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.resetPassword, 
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}