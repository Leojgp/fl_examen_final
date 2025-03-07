import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_examen_final/models/ingredient.dart';
import 'package:fl_examen_final/models/meal.dart';
import 'package:fl_examen_final/services/diet_service.dart';
import 'package:fl_examen_final/services/ingredient_service.dart';
import 'package:fl_examen_final/services/meal_service.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:fl_examen_final/utils/extended_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MealManagementScreen extends StatefulWidget {
  const MealManagementScreen({super.key});

  @override
  State<MealManagementScreen> createState() => _MealManagementScreenState();
}

class _MealManagementScreenState extends State<MealManagementScreen> {
  List<MealWithIngredients> _meals = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadMeals();
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
        meals.add(mealWithIngredients);
      }

      setState(() {
        _meals = meals;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Management'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddMealDialog,
        backgroundColor: AppTheme.mediumGreen,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
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

    if (_meals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No meals found'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showAddMealDialog,
              child: const Text('Add Meal'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _meals.length,
      itemBuilder: (context, index) {
        final meal = _meals[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Meal header with image
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: meal.meal.image.toString().isNotEmpty
                    ? Image.network(
                        meal.meal.image.toString(),
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 120,
                          width: double.infinity,
                          color: AppTheme.softGreen,
                          child: const Icon(Icons.restaurant_menu,
                              size: 50, color: Colors.white),
                        ),
                      )
                    : Container(
                        height: 120,
                        width: double.infinity,
                        color: AppTheme.softGreen,
                        child: const Icon(Icons.restaurant_menu,
                            size: 50, color: Colors.white),
                      ),
              ),

              // Meal details
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.meal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ingredients:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // List of ingredients
                    ...meal.ingredients.map((ingredient) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                    '${ingredient.ingredient.name} (${ingredient.quantity} ${ingredient.ingredient.unit})'),
                              ),
                              Text('${ingredient.kcal} kcal',
                                  style: const TextStyle(
                                      color: AppTheme.mediumGreen)),
                            ],
                          ),
                        )),
                    const SizedBox(height: 8),
                    // Total calories
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total calories: ${meal.ingredients.fold<int>(0, (sum, item) => sum + item.kcal)} kcal',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.mediumGreen,
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
      },
    );
  }

  void _showAddMealDialog() {
    showDialog(
      context: context,
      builder: (context) => const AddMealDialog(),
    ).then((wasAdded) {
      if (wasAdded == true) {
        _loadMeals();
      }
    });
  }
}

class AddMealDialog extends StatefulWidget {
  const AddMealDialog({super.key});

  @override
  State<AddMealDialog> createState() => _AddMealDialogState();
}

class _AddMealDialogState extends State<AddMealDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _imageUrlController = TextEditingController();
  List<Ingredient> _availableIngredients = [];
  final List<IngredientWithQuantity> _selectedIngredients = [];
  bool _isLoading = true;
  bool _isSubmitting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadIngredients();
  }

  Future<void> _loadIngredients() async {
    try {
      final ingredients = await getIngredients();
      setState(() {
        _availableIngredients = ingredients;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load ingredients: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: const Text('Add New Meal'),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              actions: [
                _isSubmitting
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    : TextButton(
                        onPressed: _submitForm,
                        child: const Text('SAVE',
                            style: TextStyle(color: Colors.white)),
                      )
              ],
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  _error!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            if (_isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      // Meal name
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Meal Name',
                          hintText: 'Enter meal name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Image URL
                      TextFormField(
                        controller: _imageUrlController,
                        decoration: const InputDecoration(
                          labelText: 'Image URL',
                          hintText: 'Enter URL for meal image',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Image preview if URL is entered
                      if (_imageUrlController.text.isNotEmpty)
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Center(
                                child: Text('Invalid image URL'),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 24),

                      // Ingredients section
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Check if there are ingredients to select
                      if (_availableIngredients.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'No ingredients available. Please add ingredients first.',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Selected ingredients list
                            ..._selectedIngredients.map(
                                (item) => _buildSelectedIngredientItem(item)),

                            // Add ingredient button
                            TextButton.icon(
                              onPressed: _showAddIngredientDialog,
                              icon: const Icon(Icons.add_circle_outline),
                              label: const Text('Add Ingredient'),
                            ),

                            // Validation message for ingredients
                            if (_selectedIngredients.isEmpty)
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'Please add at least one ingredient',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedIngredientItem(IngredientWithQuantity item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Ingredient image
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                width: 40,
                height: 40,
                child: item.ingredient.imageUrl.isNotEmpty
                    ? Image.network(
                        item.ingredient.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppTheme.softGreen,
                          child: const Icon(Icons.restaurant,
                              color: Colors.white, size: 20),
                        ),
                      )
                    : Container(
                        color: AppTheme.softGreen,
                        child: const Icon(Icons.restaurant,
                            color: Colors.white, size: 20),
                      ),
              ),
            ),
            const SizedBox(width: 16),

            // Ingredient name and quantity
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.ingredient.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${item.quantity} ${item.ingredient.unit} (${calculateCalories(item.ingredient, item.quantity)} kcal)',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // Remove button
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  _selectedIngredients.remove(item);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAddIngredientDialog() {
    // Filter out already selected ingredients
    final availableIngredients = _availableIngredients
        .where((ingredient) => !_selectedIngredients
            .any((selected) => selected.ingredient.id == ingredient.id))
        .toList();

    if (availableIngredients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All ingredients have been added already.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => SelectIngredientDialog(
        ingredients: availableIngredients,
        onSelect: (ingredient, quantity) {
          setState(() {
            _selectedIngredients.add(
              IngredientWithQuantity(
                ingredient: ingredient,
                quantity: quantity,
              ),
            );
          });
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedIngredients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one ingredient'),
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
      _error = null;
    });

    try {
      final List<Map<int, String>> ingredientsIdsWithQuantity =
          _selectedIngredients
              .map((item) => {item.quantity: item.ingredient.id})
              .toList();

      final meal = Meal(
        id: '',
        name: _nameController.text.trim(),
        image: Uri.parse(_imageUrlController.text.trim()),
        createdAt: Timestamp.now(),
        ingredientsIdsWithQuantity: ingredientsIdsWithQuantity,
      );

      // Save to Firestore
      await mealRef.add(meal);

      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to create meal: ${e.toString()}';
        _isSubmitting = false;
      });
    }
  }
}

class SelectIngredientDialog extends StatefulWidget {
  final List<Ingredient> ingredients;
  final void Function(Ingredient ingredient, int quantity) onSelect;

  const SelectIngredientDialog({
    Key? key,
    required this.ingredients,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<SelectIngredientDialog> createState() => _SelectIngredientDialogState();
}

class _SelectIngredientDialogState extends State<SelectIngredientDialog> {
  final _quantityController = TextEditingController(text: '100');
  Ingredient? _selectedIngredient;

  @override
  void initState() {
    super.initState();
    _selectedIngredient = widget.ingredients.first;
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Ingredient'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ingredient dropdown
          DropdownButtonFormField<Ingredient>(
            value: _selectedIngredient,
            decoration: const InputDecoration(
              labelText: 'Ingredient',
              border: OutlineInputBorder(),
            ),
            items: widget.ingredients.map((ingredient) {
              return DropdownMenuItem<Ingredient>(
                value: ingredient,
                child: Text(ingredient.name),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedIngredient = value;
              });
            },
          ),
          const SizedBox(height: 16),

          // Quantity input
          TextFormField(
            controller: _quantityController,
            decoration: InputDecoration(
              labelText: 'Quantity',
              hintText: 'Enter quantity',
              border: const OutlineInputBorder(),
              suffixText: _selectedIngredient?.unit ?? '',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          if (_selectedIngredient != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Estimated calories: ${_getEstimatedCalories()} kcal',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: AppTheme.mediumGreen,
                ),
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_selectedIngredient == null) return;

            final quantity = int.tryParse(_quantityController.text);
            if (quantity == null || quantity <= 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter a valid quantity')),
              );
              return;
            }

            widget.onSelect(_selectedIngredient!, quantity);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  String _getEstimatedCalories() {
    if (_selectedIngredient == null) return '0';

    final quantity = int.tryParse(_quantityController.text) ?? 0;
    final calories = calculateCalories(_selectedIngredient!, quantity);
    return calories.toString();
  }
}

class IngredientWithQuantity {
  final Ingredient ingredient;
  final int quantity;

  IngredientWithQuantity({
    required this.ingredient,
    required this.quantity,
  });
}
