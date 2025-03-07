import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:fl_examen_final/utils/extended_models.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/screens/screens.dart';
import 'package:animations/animations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MealsWidget extends StatefulWidget {
  final CompleteDiet? todayDiet;

  const MealsWidget({super.key, this.todayDiet});

  @override
  State<MealsWidget> createState() => _MealsWidgetState();
}

class _MealsWidgetState extends State<MealsWidget> {
  final FavoriteMealsState favoritesState = FavoriteMealsState();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    return Scaffold(
      backgroundColor: isDarkTheme ? AppTheme.darkBackground : AppTheme.white,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.exploreMeals,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildMealsContent(),
      ),
    );
  }

  Widget _buildMealsContent() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    if (widget.todayDiet == null) {
      return Center(
        child: Text(
          AppLocalizations.of(context)!.noAvailableDiets,
          style: TextStyle(
            color: isDarkTheme
                ? AppTheme.white
                : AppTheme.black, // Cambia el color aquí
          ),
        ),
      );
    }

    if (widget.todayDiet!.meals.isEmpty) {
      return Center(
        child: Text(AppLocalizations.of(context)!.noMeals),
      );
    }

    final meals = widget.todayDiet!.meals;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final mealWithIngredients = meals[index];

        return OpenContainer(
          transitionType: ContainerTransitionType.fade,
          transitionDuration: const Duration(milliseconds: 625),
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          openBuilder: (context, _) => MealDetailsScreen(
            mealWithIngredients: mealWithIngredients,
            favoritesState: favoritesState,
          ),
          closedElevation: 0,
          closedBuilder: (context, openContainer) => GestureDetector(
            onTap: openContainer,
            child: _buildMealCard(
              title: mealWithIngredients.meal.name,
              calories: '${mealWithIngredients.totalKcal} calories',
              imageUrl: mealWithIngredients.meal.image.toString(),
              isFavorite:
                  favoritesState.isFavorite(mealWithIngredients.meal.name),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMealCard({
  required String title,
  required String calories,
  required String imageUrl,
  required bool isFavorite,
}) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  final isDarkTheme = !themeProvider.isLightTheme;

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 3,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Image.network(
            imageUrl,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Image.asset(
                'assets/loading_icon.gif',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/loading_icon.gif',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkTheme ? Colors.black : AppTheme.black, 
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    calories,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkTheme ? Colors.black : Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      favoritesState.toggleFavorite(title);
                      setState(() {});
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}