import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:fl_examen_final/utils/extended_models.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/screens/screens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatefulWidget {
  final MealWithIngredients mealWithIngredients;
  final FavoriteMealsState favoritesState;

  const MealDetailsScreen({
    super.key,
    required this.mealWithIngredients,
    required this.favoritesState,
  });

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    final scaffoldBackground =
        isDarkTheme ? AppTheme.darkBackground : AppTheme.white;
    final cardColor = Theme.of(context).cardTheme.color ??
        (isDarkTheme ? Colors.grey[870] : AppTheme.white);
    final avatarColor = cardColor!.withOpacity(0.8);
    final iconColor = Theme.of(context).appBarTheme.iconTheme?.color ??
        (isDarkTheme ? Colors.white : Colors.black);

    return Scaffold(
      backgroundColor: isDarkTheme ?  Colors.grey[400] : AppTheme.white, 
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                child: Image.network(
                  widget.mealWithIngredients.meal.image.toString(),
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Image.asset(
                      'assets/loading_icon.gif',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/loading_icon.gif',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: avatarColor,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: iconColor),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDarkTheme ? Colors.grey[400] : AppTheme.white, // Cambia el color aquí
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.mealWithIngredients.meal.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, 
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.favoritesState.toggleFavorite(
                                widget.mealWithIngredients.meal.name);
                            setState(() {});
                          },
                          child: Icon(
                            widget.favoritesState.isFavorite(
                                    widget.mealWithIngredients.meal.name)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.mealWithIngredients.meal.createdAt
                          .toDate()
                          .toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkTheme ? Colors.grey[300] : Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.mealWithIngredients.totalKcal.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.mediumGreen,
                    )
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!.ingredients,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkTheme ? Colors.grey[300] : Colors.grey[700], // Color gris
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          widget.mealWithIngredients.ingredients.length,
                      itemBuilder: (context, index) {
                        final ingredient =
                            widget.mealWithIngredients.ingredients[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  ingredient.ingredient.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isDarkTheme ? Colors.grey[300] : Colors.grey[700], // Color gris
                                  ),
                                ),
                              ),
                              Text(
                                '${ingredient.kcal.toStringAsFixed(1)} kcal',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppTheme.mediumGreen),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!.allergenes,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    /* ALERGENOS
                    Wrap(
                      spacing: 8,
                      children: widget.mealWithIngredients.allergens
                          .map(
                            (allergen) => Chip(
                              label: Text(
                                allergen,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown),
                              ),
                              backgroundColor: Colors.amber[100],
                            ),
                          )
                          .toList(),
                    ),
                    */
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}