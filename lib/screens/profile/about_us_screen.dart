import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    return Scaffold(
      backgroundColor: isDarkTheme ? AppTheme.darkBackground: AppTheme.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: isDarkTheme ? AppTheme.darkBackground: AppTheme.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                isDarkTheme ? 'assets/logo-blanco.png' : 'assets/logo2f.png',
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Easy',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: isDarkTheme ? AppTheme.white: AppTheme.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Bite',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8CC63F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!.aboutUsScreen,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.knowUs,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      _buildTeamMember(
                        name: 'Félix Caba Martín',
                        role: AppLocalizations.of(context)!.roleFelix,
                        image:
                            'https://i.pinimg.com/736x/09/94/5f/09945fe83c94669cd0cfcddce4bae788.jpg',
                      ),
                      _buildTeamMember(
                        name: 'Leonardo José García Paulsen',
                        role: AppLocalizations.of(context)!.roleLeo,
                        image:
                            'https://i.pinimg.com/736x/09/94/5f/09945fe83c94669cd0cfcddce4bae788.jpg',
                      ),
                      _buildTeamMember(
                        name: 'Pablo Quesada Castellano',
                        role: AppLocalizations.of(context)!.rolePablo,
                        image:
                            'https://i.pinimg.com/736x/09/94/5f/09945fe83c94669cd0cfcddce4bae788.jpg',
                      ),
                      _buildTeamMember(
                        name: 'Hikari Tamura',
                        role: AppLocalizations.of(context)!.roleHikari,
                        image:
                            'https://i.pinimg.com/736x/09/94/5f/09945fe83c94669cd0cfcddce4bae788.jpg',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember({
    required String name,
    required String role,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                role,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
