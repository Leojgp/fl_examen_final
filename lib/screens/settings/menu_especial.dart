import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_examen_final/utils/errors.dart';
import 'package:fl_examen_final/services/ingredient_service.dart';
import 'package:fl_examen_final/models/ingredient.dart';

class MenuEspecial extends StatefulWidget {
  const MenuEspecial({super.key});

  @override
  State<MenuEspecial> createState() => _MenuEspecialState();
}

class _MenuEspecialState extends State<MenuEspecial> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _preparacionController = TextEditingController();
  
  List<Map<String, dynamic>> _menusSugeridos = [];
  List<Ingredient> _todosLosIngredientes = [];
  List<Ingredient> _ingredientesSeleccionados = [];
  
  bool _isLoading = true;
  bool _isLoadingIngredients = true;
  
  @override
  void initState() {
    super.initState();
    _cargarMenusEspeciales();
    _cargarIngredientes();
  }
  
  @override
  void dispose() {
    _nombreController.dispose();
    _preparacionController.dispose();
    super.dispose();
  }
  
  Future<void> _cargarIngredientes() async {
    setState(() {
      _isLoadingIngredients = true;
    });
    
    try {
      _todosLosIngredientes = await getIngredients();
      
      setState(() {
        _isLoadingIngredients = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingIngredients = false;
      });
      print('error');
    }
  }

    Future<void> _eliminarMenuEspecial(String id) async {
    try {
      await FirebaseFirestore.instance.collection('menu_especial').doc(id).delete();
      _cargarMenusEspeciales();
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Menú especial eliminado correctamente')),
      );
    } catch (e) {
      print('error');
    }
  }
  
  Future<void> _cargarMenusEspeciales() async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      final snapshot = await FirebaseFirestore.instance.collection('menu_especial').get();
      
      setState(() {
        _menusSugeridos = snapshot.docs.map((doc) {
          final data = doc.data();
          return {
            'id': doc.id,
            'nombre': data['nombre'] ?? '',
            'ingredientes': data['ingredientes'] ?? [],
            'preparacion': data['preparacion'] ?? '',
          };
        }).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('error');
    }
  }
  
  void _toggleIngredientSelection(Ingredient ingredient) {
    setState(() {
      if (_ingredientesSeleccionados.any((item) => item.id == ingredient.id)) {
        _ingredientesSeleccionados.removeWhere((item) => item.id == ingredient.id);
      } else {
        _ingredientesSeleccionados.add(ingredient);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Especial'),
      ),
      body: _isLoadingIngredients
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Crear Sugerencia de Menú Especial',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _nombreController,
                              decoration: const InputDecoration(
                                labelText: 'Nombre del menú',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, ingresa un nombre para el menú';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Selecciona los ingredientes:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              height: 200,
                              child: _todosLosIngredientes.isEmpty
                                  ? const Center(child: Text('No hay ingredientes disponibles'))
                                  : ListView.builder(
                                      itemCount: _todosLosIngredientes.length,
                                      itemBuilder: (context, index) {
                                        final ingredient = _todosLosIngredientes[index];
                                        final isSelected = _ingredientesSeleccionados
                                            .any((item) => item.id == ingredient.id);
                                        
                                        return CheckboxListTile(
                                          title: Text(ingredient.name),
                                          subtitle: Text('${ingredient.caloriesPer100} cal/100${ingredient.unit}'),
                                          secondary: ingredient.imageUrl.isNotEmpty
                                              ? CircleAvatar(
                                                  backgroundImage: NetworkImage(ingredient.imageUrl),
                                                )
                                              : const CircleAvatar(
                                                  child: Icon(Icons.food_bank),
                                                ),
                                          value: isSelected,
                                          onChanged: (_) => _toggleIngredientSelection(ingredient),
                                        );
                                      },
                                    ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _preparacionController,
                              decoration: const InputDecoration(
                                labelText: 'Preparación',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, ingresa las instrucciones de preparación';
                                }
                                return null;
                              },
                              maxLines: 5,
                            ),
                            const SizedBox(height: 16),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Guardar Menú Especial'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Menús Especiales Guardados',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _menusSugeridos.isEmpty
                          ? const Center(
                              child: Text('No hay menús especiales guardados'),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _menusSugeridos.length,
                              itemBuilder: (context, index) {
                                final menu = _menusSugeridos[index];
                                final List<dynamic> ingredientes = menu['ingredientes'] is List
                                    ? menu['ingredientes']
                                    : [];
                                
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ExpansionTile(
                                    title: Text(menu['nombre']),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Ingredientes:',
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            if (ingredientes.isNotEmpty)
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics: const NeverScrollableScrollPhysics(),
                                                itemCount: ingredientes.length,
                                                itemBuilder: (context, i) {
                                                  final ingrediente = ingredientes[i];
                                                  return ListTile(
                                                    dense: true,
                                                    leading: const Icon(Icons.check),
                                                    title: Text(ingrediente['name'] ?? 'Ingrediente sin nombre'),
                                                  );
                                                },
                                              )
                                            else
                                              const Text('No hay ingredientes registrados'),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Preparación:',
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text(menu['preparacion']),
                                            const SizedBox(height: 16),
                                            Center(
                                              child: ElevatedButton.icon(
                                                onPressed: () => _eliminarMenuEspecial(menu['id']),
                                                icon: const Icon(Icons.delete),
                                                label: const Text('Eliminar Menú'),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  foregroundColor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                ],
              ),
            ),
    );
  }
}