import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_examen_final/models/menu_especial.dart';
import 'package:fl_examen_final/utils/errors.dart';

final menuEspecialRef = FirebaseFirestore.instance.collection('menu_especial').withConverter(
      fromFirestore: (snapshot, _) => MenuEspecial.fromFirestore(snapshot),
      toFirestore: (menu, _) => menu.toFirestore(),
    );

Future<MenuEspecial> getMenuEspecialById(String menuId) async {
  final menu = await menuEspecialRef.doc(menuId).get();
  if (!menu.exists || menu.data() == null) {
    print("No existe");
  }

  return menu.data()!;
}

Future<MenuEspecial> createMenuEspecial(MenuEspecial menu) async {
  final menuDoc = await menuEspecialRef.add(menu);
  final menuData = await menuDoc.get();
  if (!menuData.exists || menuData.data() == null) {
    print("No existe");
  }

  return menuData.data()!;
}

Future<void> updateMenuEspecial(MenuEspecial menu) async {
  if (menu.id == null) {
    throw ArgumentError('Menu id cannot be null');
  }
  
  await menuEspecialRef.doc(menu.id).update({
    'nombre': menu.nombre,
    'ingredientes': menu.ingredientes,
    'preparacion': menu.preparacion,
  });
}

Future<void> deleteMenuEspecial(String menuId) async {
  await menuEspecialRef.doc(menuId).delete();
}

Future<List<MenuEspecial>> getMenusEspeciales() async {
  final menus = await menuEspecialRef.get();
  return menus.docs.map((e) => e.data()).toList();
}