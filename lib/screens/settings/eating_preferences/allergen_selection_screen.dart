import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AllergenSelectionScreen extends StatefulWidget {
  const AllergenSelectionScreen({super.key});

  @override
  State<AllergenSelectionScreen> createState() =>
      _AllergenSelectionScreenState();
}

class _AllergenSelectionScreenState extends State<AllergenSelectionScreen> {
  List<String> allergens = [];
  List<String> selectedAllergens = [];
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
      AppLocalizations.of(context)!.allergenNone
    ];
  }

  void _toggleAllergen(String allergen) {
    setState(() {
      if (selectedAllergens.contains(allergen)) {
        selectedAllergens.remove(allergen);
      } else {
        selectedAllergens.add(allergen);
      }
    });
  }

  void _saveAllergenSelection() {
    print("Allergens selected: $selectedAllergens");
    Navigator.pop(context, selectedAllergens);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppTheme.iconGrey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.updateAllergenes,
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
            ...allergens
                .map((allergen) => _buildAllergenOption(allergen))
                .toList(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAllergenSelection,
              child: Text(
                AppLocalizations.of(context)!.saveSelection,
                style: TextStyle(color: isDarkTheme ? AppTheme.black : AppTheme.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllergenOption(String allergen) {
    bool isSelected = selectedAllergens.contains(allergen);
    return GestureDetector(
      onTap: () => _toggleAllergen(allergen),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD4E8B2) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(allergen,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            if (isSelected)
              const Icon(Icons.check_circle,
                  color: Color(0xFF8CC63F), size: 24),
          ],
        ),
      ),
    );
  }
}
