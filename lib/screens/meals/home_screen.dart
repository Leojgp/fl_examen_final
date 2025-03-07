import 'package:fl_examen_final/providers/diet_provider.dart';
import 'package:fl_examen_final/providers/user_provider.dart';
import 'package:fl_examen_final/services/diet_tester.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/screens/screens.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _seleccion = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DietProvider>(context, listen: false).loadTodayDiet();
    });
  }

  void _itemSeleccionado(int index) {
    setState(() {
      _seleccion = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Consumer<DietProvider>(
      builder: (context, dietProvider, _) {
        // Estado de carga
        if (dietProvider.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Estado de error
        if (dietProvider.errorMessage != null) {
          return _buildScaffoldWithError(
              context, localizations, dietProvider.errorMessage);
        }

        // Estado con datos
        final todayDiet = dietProvider.todayDiet;

        final List<Widget> opciones = <Widget>[
          PlanificadorScreen(todayDiet: todayDiet),
          MealsWidget(todayDiet: todayDiet),
          const SettingsScreens()
        ];

        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return AnimatedBuilder(
                animation: animation,
                child: child,
                builder: (context, child) {
                  final double scale = animation.value;
                  final double rotation = math.sin(animation.value * math.pi * 4) * 0.1;
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scale(scale)
                      ..rotateZ(rotation),
                    child: Opacity(
                      opacity: animation.value,
                      child: child,
                    ),
                  );
                },
              );
            },
            child: Container(
              key: ValueKey<int>(_seleccion),
              child: opciones.elementAt(_seleccion),
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context, localizations),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(
      BuildContext context, AppLocalizations localizations) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    return Theme(
      data: Theme.of(context).copyWith(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: BottomNavigationBar(
        backgroundColor:
            isDarkTheme ? AppTheme.darkDeeperGreen : AppTheme.lightBackground,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today),
            label: localizations.planner,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.restaurant_menu),
            label: localizations.meals,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: localizations.settings,
          ),
        ],
        currentIndex: _seleccion,
        selectedItemColor: AppTheme.mediumGreen,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 20,
        onTap: _itemSeleccionado,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }

  Widget _buildScaffoldWithError(
      BuildContext context, AppLocalizations localizations, String? error) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            Text(
              error ?? "Unknown error",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Intenta cargar la dieta nuevamente
                Provider.of<DietProvider>(context, listen: false)
                    .loadTodayDiet();
              },
              child: Text("Retry"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final diet = DietTestUtility.createTestCompleteDiet();
                final dietProvider =
                    Provider.of<DietProvider>(context, listen: false);
                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);

                await dietProvider.assignDietToCurrentUser(
                    userProvider.user!.uid, diet, DateTime.now());
              },
              child: Text("Assign test diet"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, localizations),
    );
  }
}
