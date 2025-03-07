import 'package:fl_examen_final/providers/user_provider.dart';
import 'package:fl_examen_final/services/user_service.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/screens/screens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String? _selectedDiet;
  final List<String> _selectedAllergens = [];
  List<String> allergens = [];
  List<String> diets = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    allergens = [
      AppLocalizations.of(context)!.allergenGluten,
      AppLocalizations.of(context)!.allergenDairy,
      AppLocalizations.of(context)!.allergenNuts,
      AppLocalizations.of(context)!.allergenSeafood,
      AppLocalizations.of(context)!.allergenEgg,
      AppLocalizations.of(context)!.allergenSoy,
      AppLocalizations.of(context)!.allergenNone,
    ];

    diets = [
      AppLocalizations.of(context)!.dietsOmnivore,
      AppLocalizations.of(context)!.dietsVegetarian,
      AppLocalizations.of(context)!.dietsVegan,
      AppLocalizations.of(context)!.dietsKeto,
      AppLocalizations.of(context)!.dietsPaleo,
    ];
  }

  void _nextPage() {
    if (!_isCurrentPageValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!
              .pleaseFillOutAllRequiredFieldsCorrectly),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _saveUserData();
    }
  }

  bool _isCurrentPageValid() {
    switch (_currentPage) {
      case 0:
        return _isValidNumber(_ageController.text) &&
            _isValidAge(int.parse(_ageController.text));
      case 1:
        return _isValidNumber(_weightController.text) &&
            _isValidNumber(_heightController.text);
      case 2:
        return _isValidNumber(_weightController.text) &&
            _isValidNumber(_heightController.text);
      case 3:
        return _selectedDiet != null && _selectedDiet!.isNotEmpty;
      case 4:
        return _selectedAllergens.isNotEmpty;
      default:
        return true;
    }
  }

  bool _isValidNumber(String value) {
    if (value.isEmpty) return false;
    return RegExp(r'^\d+$').hasMatch(value);
  }

  bool _isValidAge(int age) => age >= 16;

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  Future<void> _saveUserData() async {
    await updateUser(
      _ageController.text,
      _weightController.text,
      _heightController.text,
      _selectedDiet,
      _selectedAllergens,
      {},
    );

    if (mounted) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.refreshUser();
      _navigateToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Usamos el ThemeProvider para determinar el modo (claro u oscuro)
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    final scaffoldBg = isDarkTheme ? AppTheme.darkBackground : AppTheme.white;

    return PopScope(
      canPop: _currentPage > 0,
      child: Scaffold(
        backgroundColor: scaffoldBg,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    _buildAgePage(),
                    _buildWeightHeightPage(),
                    _buildDietPage(),
                    _buildAllergensPage(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _nextPage,
                  child: Text(
                    _currentPage < 4
                        ? AppLocalizations.of(context)!.onboardingNext
                        : AppLocalizations.of(context)!.onboardingFinish,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAgePage() {
    return _buildPage(
      title: AppLocalizations.of(context)!.onboardingWhatIsYourAge,
      child: TextField(
        controller: _ageController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.onboardingYourAge,
        ),
      ),
    );
  }

  Widget _buildWeightHeightPage() {
    return _buildPage(
      title: AppLocalizations.of(context)!.onboardingWhatIsYourWeightAndHeight,
      child: Column(
        children: [
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.onboardingYourWeightKg,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.onboardingYourHeightCm,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDietPage() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    return _buildPage(
      title: AppLocalizations.of(context)!.onboardingSelectYourDietType,
      child: DropdownButton<String>(
        value: _selectedDiet,
        isExpanded: true,
        hint: Text(
          AppLocalizations.of(context)!.onboardingSelectAnOption,
          style: TextStyle(
            color: isDarkTheme ? AppTheme.white : AppTheme.black,
          ),
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedDiet = newValue;
          });
        },
        dropdownColor:
            isDarkTheme ? AppTheme.darkBackground : AppTheme.lightBackground,
        items: diets.map((diet) {
          return DropdownMenuItem(
            value: diet,
            child: Text(
              diet,
              style: TextStyle(
                color: isDarkTheme ? AppTheme.white : AppTheme.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAllergensPage() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    return _buildPage(
      title: AppLocalizations.of(context)!.onboardingSelectYourAllergies,
      child: Column(
        children: allergens.map((allergen) {
          return CheckboxListTile(
            title: Text(
              allergen,
              style: TextStyle(
                color: isDarkTheme ? AppTheme.white : AppTheme.black,
              ),
            ),
            value: _selectedAllergens.contains(allergen),
            onChanged: (isChecked) {
              setState(() {
                if (isChecked!) {
                  _selectedAllergens.add(allergen);
                } else {
                  _selectedAllergens.remove(allergen);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPage({required String title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}
