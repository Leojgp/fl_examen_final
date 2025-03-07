import 'package:flutter/material.dart';
import 'package:fl_examen_final/theme/theme.dart';
import 'package:fl_examen_final/screens/screens.dart';

class DietManagementPortal extends StatelessWidget {
  const DietManagementPortal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tiles = [
      _MenuTile(
        title: 'Manage Ingredients',
        icon: Icons.food_bank,
        color: AppTheme.softGreen,
        description: 'Create, edit or delete ingredients',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const IngredientManagementScreen()),
        ),
      ),
      _MenuTile(
        title: 'Manage Meals',
        icon: Icons.restaurant_menu,
        color: AppTheme.softGreen,
        description: 'Create meals with ingredients and portions',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MealManagementScreen()),
        ),
      ),
      _MenuTile(
        title: 'Manage Diets',
        icon: Icons.calendar_today,
        color: AppTheme.softGreen,
        description: 'Create diets with meals and schedules',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const DietCreationScreen()),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Management',
            style: Theme.of(context).textTheme.displaySmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diet Management System',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Create and manage ingredients, meals and diets',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: tiles.length,
                itemBuilder: (context, index) => tiles[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final VoidCallback onTap;

  const _MenuTile({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  size: 16, color: AppTheme.iconGrey),
            ],
          ),
        ),
      ),
    );
  }
}
