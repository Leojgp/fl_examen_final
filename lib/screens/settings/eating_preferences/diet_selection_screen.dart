import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class DietSelectionScreen extends StatefulWidget {
  const DietSelectionScreen({super.key});

  @override
  State<DietSelectionScreen> createState() => _DietSelectionScreenState();
}

class _DietSelectionScreenState extends State<DietSelectionScreen> {
  List<String> diets = [];
  String? selectedDiet;
@override
  void didChangeDependencies() {
    super.didChangeDependencies();
  diets = [
      AppLocalizations.of(context)!.dietsOmnivore,
      AppLocalizations.of(context)!.dietsVegetarian,
      AppLocalizations.of(context)!.dietsVegan,
      AppLocalizations.of(context)!.dietsKeto,
      AppLocalizations.of(context)!.dietsPaleo,
    ];
  }

  void _saveDietSelection() {
    if (selectedDiet != null) {
      print("Diet selected: $selectedDiet");
      Navigator.pop(context, selectedDiet);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,  color: AppTheme.iconGrey,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.updateDiet,
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
            ...diets.map((diet) => _buildDietOption(diet)).toList(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveDietSelection,
              child: Text(
                AppLocalizations.of(context)!.saveSelection,
                style: TextStyle(color: AppTheme.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDietOption(String diet) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDiet = diet;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: selectedDiet == diet ? const Color(0xFFD4E8B2) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(diet, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            if (selectedDiet == diet)
              const Icon(Icons.check_circle, color: Color(0xFF8CC63F), size: 24),
          ],
        ),
      ),
    );
  }
}
