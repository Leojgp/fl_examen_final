import 'package:fl_examen_final/providers/user_provider.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EditarPerfilScreen extends StatefulWidget {
  const EditarPerfilScreen({super.key});

  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  final user = FirebaseAuth.instance.currentUser;

  final TextEditingController _nombreController = TextEditingController(
      text: FirebaseAuth.instance.currentUser?.displayName ?? '');
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  bool _isValidNumber(String value) {
    return RegExp(r'^\d+$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    final theme = Theme.of(context);

    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      // Actualiza los controladores cada vez que el provider tiene datos nuevos
      if (userProvider.user != null) {
        // Actualiza solo si los campos están vacíos o si los valores son diferentes
        if (_weightController.text != userProvider.user!.weight?.toString()) {
          _weightController.text = userProvider.user!.weight?.toString() ?? '';
        }
        if (_heightController.text != userProvider.user!.height?.toString()) {
          _heightController.text = userProvider.user!.height?.toString() ?? '';
        }
      }

      return Scaffold(
        backgroundColor: isDarkTheme ? AppTheme.darkBackground : AppTheme.white,
        appBar: AppBar(
          backgroundColor: isDarkTheme ? AppTheme.darkBackground : AppTheme.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppTheme.deeperGreen),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.editProfile,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.name,
                    style: theme.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 47,
                    decoration: BoxDecoration(
                      color: isDarkTheme ? AppTheme.inputBackgroundDark : AppTheme.inputBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _nombreController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.yourWeightKg,
                    style: theme.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 47,
                    decoration: BoxDecoration(
                      color: isDarkTheme ? AppTheme.inputBackgroundDark : AppTheme.inputBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      cursorColor: AppTheme.mediumGreen,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.yourHeightCm,
                    style: theme.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 47,
                    decoration: BoxDecoration(
                      color: isDarkTheme ? AppTheme.inputBackgroundDark : AppTheme.inputBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      cursorColor: AppTheme.mediumGreen,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.resetPassword,
                    style: theme.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context)!
                        .weWillSendYouAnEmailToResetYourPassword,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.deleteAccount),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.deleteAccount,
                    style: theme.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context)!
                        .yourAccountDataWillBePermanentlyDeleted,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFE0E0),
                      foregroundColor: const Color(0xFFFF5F5F),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)!.deleteAccount),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () async {
                      if (_isValidNumber(_weightController.text) &&
                          _isValidNumber(_heightController.text)) {
                        final userProvider =
                            Provider.of<UserProvider>(context, listen: false);

                        try {
                          await userProvider.updateUserData(
                            weight: int.parse(_weightController.text),
                            height: int.parse(_heightController.text),
                          );

                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        } catch (error) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: $error'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text(AppLocalizations.of(context)!.validNumber),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.deeperGreen,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.save,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
