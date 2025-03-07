import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_examen_final/utils/errors.dart';

class MenuEspecial extends StatefulWidget {
  const MenuEspecial({super.key});

  @override
  State<MenuEspecial> createState() => _MenuEspecialState();
}

class _MenuEspecialState extends State<MenuEspecial> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _ingredientesController = TextEditingController();
  final TextEditingController _preparacionController = TextEditingController();
  
  List<Map<String, dynamic>> _menusSugeridos = [];
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    _cargarMenusEspeciales();
  }
  
  @override
  void dispose() {
    _nombreController.dispose();
    _ingredientesController.dispose();
    _preparacionController.dispose();
    super.dispose();
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
            'ingredientes': data['ingredientes'] ?? '',
            'preparacion': data['preparacion'] ?? '',
          };
        }).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _mostrarError('Error al cargar menús: $e');
    }
  }
  
  Future<void> _guardarMenuEspecial() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('menu_especial').add({
          'nombre': _nombreController.text,
          'ingredientes': _ingredientesController.text,
          'preparacion': _preparacionController.text,
          'createdAt': FieldValue.serverTimestamp(),
        });
        
        _limpiarFormulario();
        _cargarMenusEspeciales();
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Menú especial guardado correctamente')),
        );
      } catch (e) {
        _mostrarError('Error al guardar menú: $e');
      }
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
      _mostrarError('Error al eliminar menú: $e');
    }
  }
  
  void _limpiarFormulario() {
    _nombreController.clear();
    _ingredientesController.clear();
    _preparacionController.clear();
  }
  
  void _mostrarError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Especial'),
      ),
      body: SingleChildScrollView(
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
                      TextFormField(
                        controller: _ingredientesController,
                        decoration: const InputDecoration(
                          labelText: 'Ingredientes (separados por comas)',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa los ingredientes';
                          }
                          return null;
                        },
                        maxLines: 3,
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
                          onPressed: _guardarMenuEspecial,
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
                                      Text(menu['ingredientes']),
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