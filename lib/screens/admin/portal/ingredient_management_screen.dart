import 'package:fl_examen_final/models/ingredient.dart';
import 'package:fl_examen_final/services/ingredient_service.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IngredientManagementScreen extends StatefulWidget {
  const IngredientManagementScreen({super.key});

  @override
  State<IngredientManagementScreen> createState() =>
      _IngredientManagementScreenState();
}

class _IngredientManagementScreenState
    extends State<IngredientManagementScreen> {
  List<Ingredient> _ingredients = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadIngredients();
  }

  Future<void> _loadIngredients() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final ingredients = await getIngredients();
      setState(() {
        _ingredients = ingredients;
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
        title: const Text('Ingredient Management'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddIngredientDialog,
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
              onPressed: _loadIngredients,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_ingredients.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No ingredients found'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showAddIngredientDialog,
              child: const Text('Add Ingredient'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = _ingredients[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 60,
                height: 60,
                child: ingredient.imageUrl.isNotEmpty
                    ? Image.network(
                        ingredient.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppTheme.softGreen,
                          child:
                              const Icon(Icons.restaurant, color: Colors.white),
                        ),
                      )
                    : Container(
                        color: AppTheme.softGreen,
                        child:
                            const Icon(Icons.restaurant, color: Colors.white),
                      ),
              ),
            ),
            title: Text(
              ingredient.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text('Unit: ${ingredient.unit}'),
                const SizedBox(height: 2),
                Text('Calories per 100: ${ingredient.caloriesPer100} kcal'),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddIngredientDialog() {
    showDialog(
      context: context,
      builder: (context) => const AddIngredientDialog(),
    ).then((wasAdded) {
      if (wasAdded == true) {
        _loadIngredients();
      }
    });
  }
}

class AddIngredientDialog extends StatefulWidget {
  const AddIngredientDialog({super.key});

  @override
  State<AddIngredientDialog> createState() => _AddIngredientDialogState();
}

class _AddIngredientDialogState extends State<AddIngredientDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _unitController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _imageUrlController = TextEditingController();

  bool _isSubmitting = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    _unitController.dispose();
    _caloriesController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Ingredient'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    _error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter ingredient name',
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
              TextFormField(
                controller: _unitController,
                decoration: const InputDecoration(
                  labelText: 'Unit',
                  hintText: 'e.g. g, ml, piece',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a unit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _caloriesController,
                decoration: const InputDecoration(
                  labelText: 'Calories per 100',
                  hintText: 'e.g. 250',
                  border: OutlineInputBorder(),
                  suffixText: 'kcal',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter calories';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'Image URL',
                  hintText: 'Enter URL for ingredient image',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              if (_imageUrlController.text.isNotEmpty)
                Container(
                  height: 100,
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
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed:
              _isSubmitting ? null : () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isSubmitting ? null : _submitForm,
          child: _isSubmitting
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Add'),
        ),
      ],
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
      _error = null;
    });

    try {
      final ingredient = Ingredient(
        id: '', // ID will be assigned by Firestore
        name: _nameController.text.trim(),
        unit: _unitController.text.trim(),
        caloriesPer100: double.parse(_caloriesController.text.trim()),
        imageUrl: _imageUrlController.text.trim(),
      );

      await createIngredient(ingredient);
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to add ingredient: ${e.toString()}';
        _isSubmitting = false;
      });
    }
  }
}
