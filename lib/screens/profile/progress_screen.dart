import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class UserDataWidget extends StatefulWidget {
  final List<Map<String, String>> meals;

  const UserDataWidget({
    super.key,
    this.meals = const [],
  });

  @override
  State<UserDataWidget> createState() => _UserDataWidgetState();
}

class _UserDataWidgetState extends State<UserDataWidget> {
  double sliderValue = 1127;
  final double calorieGoal = 2000;

  String get progressPercentage =>
      '${((sliderValue / calorieGoal) * 100).round()}% achieved';

  String get remainingCalories =>
      '${(calorieGoal - sliderValue).round()} kcal';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.todaysProgress, style: theme.textTheme.displaySmall),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCard(
                  theme,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderRow(AppLocalizations.of(context)!.remainingCalories, remainingCalories, AppTheme.mediumGreen),
                      Slider(
                        activeColor: AppTheme.mediumGreen,
                        inactiveColor: Colors.grey[300],
                        min: 0,
                        max: calorieGoal,
                        value: sliderValue,
                        onChanged: (value) => setState(() => sliderValue = value),
                      ),
                      _buildHeaderRow('Goal: ${calorieGoal.round()} kcal', progressPercentage, AppTheme.mediumGreen),
                    ],
                  ),
                ),
                _buildCard(
                  theme,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(AppLocalizations.of(context)!.macronutrients, theme),
                      const SizedBox(height: 16),
                      SizedBox(height: 130, child: const CustomChart()),
                      const SizedBox(height: 16),
                      _buildMacronutrientRow(theme),
                    ],
                  ),
                ),
                _buildCard(
                  theme,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(AppLocalizations.of(context)!.yourProfile, theme),
                      _buildProfileRow(theme),
                    ],
                  ),
                ),
                _buildCard(
                  theme,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(AppLocalizations.of(context)!.todaysMeals, theme),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 300),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.meals.length,
                          itemBuilder: (context, index) => _buildMealItem(widget.meals[index], theme),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
          ),
        ),
      ),
    )
    );
  }

  Widget _buildTitle(String text, ThemeData theme) => Text(
    text,
    style: theme.textTheme.displaySmall,
  );

  Widget _buildCard(ThemeData theme, {required Widget child}) {
    final BorderRadius borderRadius = theme.cardTheme.shape is RoundedRectangleBorder 
        ? (theme.cardTheme.shape as RoundedRectangleBorder).borderRadius as BorderRadius
        : BorderRadius.circular(16);

    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: theme.cardTheme.elevation ?? 4,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildHeaderRow(String leftText, String rightText, Color rightColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leftText, style: const TextStyle(fontSize: 16)),
        Text(
          rightText,
          style: TextStyle(fontSize: 16, color: rightColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMacronutrientRow(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildMacroColumn('Proteins', '30%', const Color.fromARGB(255, 129, 172, 192)),
        _buildMacroColumn('Carbs', '45%', AppTheme.softGreen),
        _buildMacroColumn('Fats', '25%', AppTheme.darkGreen),
      ],
    );
  }

  Widget _buildMacroColumn(String title, String value, Color color) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.bold)),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildProfileRow(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildProfileColumn(AppLocalizations.of(context)!.weight, '75 kg', theme),
        _buildProfileColumn(AppLocalizations.of(context)!.height, '175 cm', theme),
        _buildProfileColumn(AppLocalizations.of(context)!.age, '28', theme),
        _buildProfileColumn(AppLocalizations.of(context)!.gender, 'Male', theme),
      ],
    );
  }

  Widget _buildProfileColumn(String title, String value, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.bodySmall),
        Text(value, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildMealItem(Map<String, String> meal, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(76, 163, 177, 138),
                  child: Icon(Icons.fastfood, color: AppTheme.mediumGreen),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal['title'] ?? AppLocalizations.of(context)!.unknownMeal,
                        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        meal['calories'] ?? AppLocalizations.of(context)!.calories,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomChart extends StatelessWidget {
  final double proteins = 30;
  final double carbs = 45;
  final double fats = 25;

  const CustomChart({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;

    return Container(
      decoration: BoxDecoration(
        color: isDarkTheme ? AppTheme.darkBackground : AppTheme.lightBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 20,
          sections: [
                       PieChartSectionData(
              color: const Color.fromARGB(255, 129, 172, 192),
              value: proteins,
              title: '${proteins.round()}%',
              radius: 30,
              titleStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            PieChartSectionData(
              color: AppTheme.softGreen,
              value: carbs,
              title: '${carbs.round()}%',
              radius: 30,
              titleStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            PieChartSectionData(
              color: AppTheme.darkGreen,
              value: fats,
              title: '${fats.round()}%',
              radius: 30,
              titleStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
         