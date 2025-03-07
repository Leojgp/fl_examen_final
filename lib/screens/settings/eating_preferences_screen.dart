import 'package:fl_examen_final/screens/screens.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EatingPreferencesScreen extends StatelessWidget {
  const EatingPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.deeperGreen),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.eatingPreferences,
          style: theme.textTheme.displaySmall,
        ),
        backgroundColor: isDarkTheme ? AppTheme.darkBackground : AppTheme.white,
        elevation: 0,
      ),
      backgroundColor: isDarkTheme ? AppTheme.darkBackground : AppTheme.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            _buildPreferenceItem(
              title: AppLocalizations.of(context)!.diet,
              icon: Icons.restaurant_menu,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DietSelectionScreen()),
                );
              },
            ),
            const Divider(),
            _buildPreferenceItem(
              title: AppLocalizations.of(context)!.allergenes,
              icon: Icons.error_outline,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllergenSelectionScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPreferenceItem(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppTheme.lightBackground,
              radius: 22,
              child: Icon(icon, color: AppTheme.mediumGreen, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.deeperGreen,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppTheme.iconGrey,
            ),
          ],
        ),
      ),
    );
  }
}
