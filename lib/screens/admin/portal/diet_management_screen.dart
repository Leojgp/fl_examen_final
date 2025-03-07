import 'package:fl_examen_final/models/diet.dart';
import 'package:fl_examen_final/models/meal.dart';
import 'package:fl_examen_final/services/diet_service.dart';
import 'package:fl_examen_final/services/meal_service.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:fl_examen_final/utils/extended_models.dart';
import 'package:flutter/material.dart';

class DietCreationScreen extends StatefulWidget {
  const DietCreationScreen({super.key});

  @override
  State<DietCreationScreen> createState() => _DietCreationScreenState();
}

class _DietCreationScreenState extends State<DietCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  List<MealWithIngredients> _availableMeals = [];
  List<MealWithIngredients> _selectedMeals = [];
  bool _isLoading = true;
  bool _isSubmitting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _loadMeals() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final mealsSnapshot = await mealRef.get();
      final mealIds = mealsSnapshot.docs.map((doc) => doc.id).toList();

      final List<MealWithIngredients> meals = [];
      for (final id in mealIds) {
        final mealWithIngredients = await getMealWithIngredients(id);
        if (mealWithIngredients != null) {
          meals.add(mealWithIngredients);
        }
      }

      setState(() {
        _availableMeals = meals;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _submitDiet() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedMeals.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one meal to the diet'),
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
      _error = null;
    });

    try {
      // Create diet object
      final diet = Diet(
        id: '', // This will be assigned by Firestore
        type: _nameController.text.trim(),
        mealsIDs: _selectedMeals.map((meal) => meal.meal.id).toList(),
      );

      // Create CompleteDiet object
      final completeDiet = CompleteDiet(
        diet: diet,
        meals: _selectedMeals,
      );

      // Save diet to Firestore
      await dietRef.add(diet);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Diet created successfully')),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to create diet: ${e.toString()}';
        _isSubmitting = false;
      });
    }
  }

  void _toggleMealSelection(MealWithIngredients meal) {
    setState(() {
      if (_selectedMeals.any((m) => m.meal.id == meal.meal.id)) {
        _selectedMeals.removeWhere((m) => m.meal.id == meal.meal.id);
      } else {
        _selectedMeals.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Diet'),
        actions: [
          _isSubmitting
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              : TextButton(
                  onPressed: _submitDiet,
                  child:
                      const Text('SAVE', style: TextStyle(color: Colors.white)),
                )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $_error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadMeals,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_availableMeals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No meals available. Please create meals first.'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Diet name field
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Diet Name',
                hintText: 'Enter diet name (e.g., Keto, Vegetarian)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a diet name';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Selected meals count
            Text(
              'Selected Meals (${_selectedMeals.length})',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Total calories
            if (_selectedMeals.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Total calories: ${_selectedMeals.fold<int>(0, (sum, meal) => sum + meal.totalKcal)} kcal',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.mediumGreen,
                  ),
                ),
              ),

            // Available meals list with selection
            Expanded(
              child: ListView.builder(
                itemCount: _availableMeals.length,
                itemBuilder: (context, index) {
                  final meal = _availableMeals[index];
                  final isSelected =
                      _selectedMeals.any((m) => m.meal.id == meal.meal.id);

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: isSelected
                            ? AppTheme.mediumGreen
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: InkWell(
                      onTap: () => _toggleMealSelection(meal),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            // Meal image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: meal.meal.image.toString().isNotEmpty
                                    ? Image.network(
                                        meal.meal.image.toString(),
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => Container(
                                          color: AppTheme.softGreen,
                                          child: const Icon(
                                              Icons.restaurant_menu,
                                              color: Colors.white,
                                              size: 30),
                                        ),
                                      )
                                    : Container(
                                        color: AppTheme.softGreen,
                                        child: const Icon(Icons.restaurant_menu,
                                            color: Colors.white, size: 30),
                                      ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Meal details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    meal.meal.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '${meal.ingredients.length} ingredients',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${meal.totalKcal} kcal',
                                    style: const TextStyle(
                                      color: AppTheme.mediumGreen,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Selection indicator
                            if (isSelected)
                              const Icon(
                                Icons.check_circle,
                                color: AppTheme.mediumGreen,
                                size: 28,
                              )
                            else
                              const Icon(
                                Icons.add_circle_outline,
                                color: Colors.grey,
                                size: 28,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
