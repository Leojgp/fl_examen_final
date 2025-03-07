import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_examen_final/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  final TextEditingController _mealNameController = TextEditingController();

  String imageUrl = "";
  List<String> selectedIngredients = [];

  final List<String> ingredientOptions = [
    'Tomato', 'Lettuce', 'Chicken', 'Cheese', 'Rice', 'Egg'
  ];

  final Map<String, String> ingredientIdMap = {
    'Tomato': 'id_tomato',
    'Lettuce': 'id_lettuce',
    'Chicken': 'id_chicken',
    'Cheese': 'id_cheese',
    'Rice': 'id_rice',
    'Egg': 'id_egg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.addNewMeal)),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildImagePicker(),
              const SizedBox(height: 20),
              _buildNameField(),
              const SizedBox(height: 20),
              _buildIngredientChecklist(),
              const SizedBox(height: 20),
              _buildCreateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: () {
        // Aquí puedes implementar la lógica para seleccionar una imagen
      },
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: imageUrl.isNotEmpty
            ? Image.network(imageUrl, fit: BoxFit.cover)
            : const Center(
                child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
              ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextField(
      controller: _mealNameController,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.mealsName,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildIngredientChecklist() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.selectIngredients, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...ingredientOptions.map((ingredient) {
          return CheckboxListTile(
            title: Text(ingredient),
            value: selectedIngredients.contains(ingredientIdMap[ingredient]),
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  selectedIngredients.add(ingredientIdMap[ingredient]!);
                } else {
                  selectedIngredients.remove(ingredientIdMap[ingredient]!);
                }
              });
            },
          );
        }).toList(),
      ],
    );
  }

  Widget _buildCreateButton() {
    return ElevatedButton(
      onPressed: () {
        Meal newMeal = Meal(
          id: 'some_unique_id', 
          image: Uri.parse(imageUrl), 
          name: _mealNameController.text,
          createdAt: Timestamp.now(), 
          ingredientsIdsWithQuantity: selectedIngredients.map((id) => {1: id}).toList(), 
        );

        // Regresar a la pantalla anterior con el nuevo Meal
        Navigator.pop(context, newMeal);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        AppLocalizations.of(context)!.create, // Usar la clave de traducción
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}