import 'package:fl_examen_final/providers/language_provider.dart';
import 'package:fl_examen_final/providers/user_provider.dart';
import 'package:fl_examen_final/screens/admin/portal/diet_management_portal.dart';
import 'package:fl_examen_final/screens/onboarding/components/language_selector.dart';
import 'package:fl_examen_final/screens/onboarding/components/theme_selector.dart';
import 'package:fl_examen_final/screens/settings/menu_especial.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    final theme = Theme.of(context);

    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      backgroundColor: isDarkTheme ? AppTheme.darkBackground : AppTheme.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LanguageSelector(
                      onLanguageSelected: (languageCode) {
                        Provider.of<LanguageProvider>(context, listen: false)
                            .changeLanguage(languageCode);
                      },
                    ),
                    ThemeSelector(),
                  ],
                ),
                const SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.hello,
                      style: theme.textTheme.bodyLarge,
                    ),
                Text(
                  user != null ? user.name : AppLocalizations.of(context)!.user,
                  style: theme.textTheme.displaySmall,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.mediumGreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.thankYouForSupportingUs,
                        style: theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        AppLocalizations.of(context)!.weAppreciateYourSupport,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildOptionItem(
                  context: context,
                  icon: Icons.person_outline,
                  title: AppLocalizations.of(context)!.editProfile,
                  onTap: () {
                    Navigator.push(
                      context,
                      _slideTransition(const EditarPerfilScreen()),
                    );
                  },
                ),
                _buildOptionItem(
                  context: context,
                  icon: Icons.restaurant_menu,
                  title: AppLocalizations.of(context)!.mealPreferences,
                  onTap: () {
                    Navigator.push(
                      context,
                      _slideTransition(const EatingPreferencesScreen()),
                    );
                  },
                ),
                _buildOptionItem(
                  context: context,
                  icon: Icons.info_outline,
                  title: AppLocalizations.of(context)!.aboutUs,
                  onTap: () {
                    Navigator.push(
                      context,
                      _slideTransition(const AboutUsScreen()),
                    );
                  },
                ),
                _buildOptionItem(
                  context: context,
                  icon: Icons.help_outline,
                  title: AppLocalizations.of(context)!.support,
                  onTap: () {
                    Navigator.push(
                      context,
                      _slideTransition(const SupportScreen()),
                    );
                  },
                ),
                _buildOptionItem(
                  context: context,
                  icon: Icons.share_outlined,
                  title: AppLocalizations.of(context)!.shareEasyBite,
                  onTap: () {
                    _showShareBottomSheet(context);
                  },
                ),
                _buildOptionItem(
                  context: context,
                  icon: Icons.star_border_outlined,
                  title: AppLocalizations.of(context)!.leaveAReview,
                  onTap: () {
                    Navigator.push(
                      context,
                      _slideTransition(const AdminDashboardScreen()),
                    );
                  },
                ),
                _buildOptionItem(
                  context: context,
                  icon: Icons.logout,
                  title: AppLocalizations.of(context)!.logOut,
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      _slideTransition(const InicioScreen()),
                      (route) => false,
                    );
                  },
                ),
                if (user != null && user.admin == true)
                  _buildOptionItem(
                    context: context,
                    icon: Icons.admin_panel_settings,
                    title: "Admin Dashboard",
                    onTap: () {
                      Navigator.push(
                        context,
                        _slideTransition(const AdminDashboardScreen()),
                      );
                    },
                  ),
                if (user != null && user.admin == true)
                  _buildOptionItem(
                    context: context,
                    icon: Icons.admin_panel_settings,
                    title: "User Details",
                    onTap: () {
                      Navigator.push(
                        context,
                        _slideTransition(const DietManagementPortal()),
                      );
                    },
                  ),
                  _buildOptionItem(
                  context: context,
                  icon: Icons.menu,
                  title: AppLocalizations.of(context)!.logOut,
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      _slideTransition(const MenuEspecial()),
                      (route) => false,
                    );
                  },
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 3),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:
                      isDarkTheme ? AppTheme.inputBackground : AppTheme.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  icon,
                  color: AppTheme.mediumGreen,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppTheme.darkGreen.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showShareBottomSheet(BuildContext context) {
    const String shareUrl = "https://www.google.com"; //

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final isDarkTheme = !themeProvider.isLightTheme;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.shareEasyBite,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black),
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: AppTheme.inputBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        shareUrl,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy, color: AppTheme.mediumGreen),
                      onPressed: () {
                        Clipboard.setData(const ClipboardData(text: shareUrl));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  AppLocalizations.of(context)!.linkCopied)),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildShareIcon(FontAwesomeIcons.whatsapp, "WhatsApp"),
                  _buildShareIcon(FontAwesomeIcons.facebook, "Facebook"),
                  _buildShareIcon(FontAwesomeIcons.instagram, "Instagram"),
                  _buildShareIcon(FontAwesomeIcons.twitter, "Twitter"),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppTheme.softGreen,
          child: FaIcon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

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