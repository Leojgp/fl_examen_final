import 'package:fl_examen_final/providers/diet_provider.dart';
import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';
import 'package:fl_examen_final/utils/extended_models.dart';
import 'package:flutter/material.dart';
import 'package:fl_examen_final/screens/screens.dart';
import 'package:animations/animations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class PlanificadorScreen extends StatefulWidget {
  final CompleteDiet? todayDiet;
  const PlanificadorScreen({super.key, this.todayDiet});

  @override
  State<PlanificadorScreen> createState() => _PlanificadorScreenState();
}

class _PlanificadorScreenState extends State<PlanificadorScreen> {
  late DateTime selectedDate;
  final FavoriteMealsState favoritesState = FavoriteMealsState();
  List<String> mealCategories = [];
  late DateTime _weekStart;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    _focusedDay = selectedDate;
    _updateWeekDates();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDietsForDate(selectedDate);
    });
  }

  void _updateWeekDates() {
    _weekStart =
        selectedDate.subtract(Duration(days: selectedDate.weekday - 1));
  }

  String _getFormattedDateForWeekday(int weekday) {
    final dayDate = _weekStart.add(Duration(days: weekday - 1));
    final DateFormat formatter = DateFormat('d');
    return formatter.format(dayDate);
  }

  String _getWeekdayName(DateTime date) {
    final weekday = date.weekday;
    return ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][weekday - 1];
  }

  DateTime _getDateForWeekday(int weekday) {
    final now = DateTime.now();
    final diff = weekday - now.weekday;
    return now.add(Duration(days: diff));
  }

  void _loadDietsForDate(DateTime date) {
    setState(() {
      selectedDate = date;
      _updateWeekDates();
    });

    Provider.of<DietProvider>(context, listen: false).getDietsForDate(date);
  }

  Future<void> _showWeekPicker(BuildContext context) async {
    await showDialog<DateTime>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final isDarkTheme = !themeProvider.isLightTheme;
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight * 0.60,
              padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Seleccionar semana',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 18, color: isDarkTheme ? AppTheme.black: AppTheme.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () => Navigator.pop(context),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.close, size: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TableCalendar(
                          firstDay: DateTime.utc(2020, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          focusedDay: _focusedDay,
                          calendarFormat: CalendarFormat.month,
                          availableCalendarFormats: const {
                            CalendarFormat.month: 'Month',
                          },
                          headerStyle: HeaderStyle(
                            titleCentered: true,
                            formatButtonVisible: false,
                            titleTextFormatter: (date, locale) =>
                                DateFormat.MMMM(locale).format(date),
                            headerPadding:
                                const EdgeInsets.symmetric(vertical: 8.0),
                            leftChevronIcon: const Icon(Icons.chevron_left,
                                size: 18, color: AppTheme.mediumGreen),
                            rightChevronIcon: const Icon(Icons.chevron_right,
                                size: 18, color: AppTheme.mediumGreen),
                            leftChevronMargin: EdgeInsets.zero,
                            rightChevronMargin: EdgeInsets.zero,
                            leftChevronPadding: const EdgeInsets.all(2.0),
                            rightChevronPadding: const EdgeInsets.all(2.0),
                          ),
                          daysOfWeekHeight: 20,
                          rowHeight: 36,
                          daysOfWeekStyle: const DaysOfWeekStyle(
                            weekdayStyle:
                                TextStyle(color: Colors.black87, fontSize: 11),
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                          ),
                          selectedDayPredicate: (day) {
                            return isSameDay(selectedDate, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              selectedDate = selectedDay;
                              _focusedDay = focusedDay;
                              _updateWeekDates();
                            });
                            Navigator.pop(context);
                          },
                          calendarStyle: const CalendarStyle(
                            cellMargin: EdgeInsets.all(0),
                            cellPadding: EdgeInsets.all(0),
                            defaultTextStyle: TextStyle(fontSize: 12),
                            weekendTextStyle: TextStyle(fontSize: 12),
                            selectedTextStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                            todayTextStyle: TextStyle(
                                fontSize: 12, color: AppTheme.mediumGreen),
                            selectedDecoration: BoxDecoration(
                              color: AppTheme.mediumGreen,
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            outsideDaysVisible: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 12.0, right: 12.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.mediumGreen,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 36),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Confirmar',
                            style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
    List<String> days = [
      AppLocalizations.of(context)!.weekDaysMon,
      AppLocalizations.of(context)!.weekDaysTue,
      AppLocalizations.of(context)!.weekDaysWed,
      AppLocalizations.of(context)!.weekDaysThu,
      AppLocalizations.of(context)!.weekDaysFri,
      AppLocalizations.of(context)!.weekDaysSat,
      AppLocalizations.of(context)!.weekDaysSun
    ];

    mealCategories = [
      AppLocalizations.of(context)!.mealCategoriesBreakfast,
      AppLocalizations.of(context)!.mealCategoriesBrunch,
      AppLocalizations.of(context)!.mealCategoriesLunch,
      AppLocalizations.of(context)!.mealCategoriesSnack,
      AppLocalizations.of(context)!.mealCategoriesDinner
    ];

    return Scaffold(
      backgroundColor: isDarkTheme ? AppTheme.darkBackground : AppTheme.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/comida1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.mealPlanner,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      AppLocalizations.of(context)!.planWeeklyMeals,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserDataWidget(),
                      ),
                    );
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: AppTheme.plannerStyles.profileButtonStyle,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 4),
                  child: GestureDetector(
                    onTap: () => _showWeekPicker(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: AppTheme.mediumGreen,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(7, (index) {
                        final dayIndex = index + 1;
                        final date = _getDateForWeekday(dayIndex);
                        final dayName = days[index];
                        final dayNumber = _getFormattedDateForWeekday(dayIndex);
                        return _diaBotonConFecha(dayName, dayNumber, date);
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<DietProvider>(
              builder: (context, dietProvider, _) {
                // Estado de carga
                if (dietProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Estado de error
                if (dietProvider.errorMessage != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Error: ${dietProvider.errorMessage}'),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => _loadDietsForDate(selectedDate),
                          child: const Text('Reintentar'),
                        ),
                      ],
                    ),
                  );
                }

                // Verificar si hay datos
                final diets = dietProvider.userDiets;
                if (diets == null || diets.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("No hay dietas para esta fecha"),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => _loadDietsForDate(selectedDate),
                          child: const Text('Crear dieta'),
                        ),
                      ],
                    ),
                  );
                }

                // Mostrar datos
                final completeDiet = diets.first;
                final meals = completeDiet.meals;

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    final mealWithIngredients = meals[index];
                    final category =
                        mealCategories[index % mealCategories.length];

                    return OpenContainer(
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: const Duration(milliseconds: 625),
                      closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      closedElevation: 0,
                      openBuilder: (context, _) => MealDetailsScreen(
                        mealWithIngredients: mealWithIngredients,
                        favoritesState: favoritesState,
                      ),
                      closedBuilder: (context, openContainer) =>
                          GestureDetector(
                        onTap: openContainer,
                        child: _buildMealCard(
                          category: category,
                          title: mealWithIngredients.meal.name,
                          calories:
                              '${mealWithIngredients.totalKcal} calories',
                          createdAt:
                              '${selectedDate.day}/${selectedDate.month}',
                          imageUrl: mealWithIngredients.meal.image.toString(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.mediumGreen,
        onPressed: () => _loadDietsForDate(selectedDate),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _diaBotonConFecha(String day, String dayNumber, DateTime date) {
    bool isSelected = selectedDate.year == date.year &&
        selectedDate.month == date.month &&
        selectedDate.day == date.day;

    return GestureDetector(
      onTap: () {
        _loadDietsForDate(date);
      },
      child: Container(
        width: 70,
        height: 32,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: isSelected
            ? AppTheme.plannerStyles.dayButtonSelected
            : AppTheme.plannerStyles.dayButtonUnselected,
        child: Center(
          child: Text(
            "$day $dayNumber",
            style: TextStyle(
              fontSize: isSelected ? 12 : 11,
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMealCard({
  required String category,
  required String title,
  required String calories,
  required String createdAt,
  required String imageUrl,
}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = !themeProvider.isLightTheme;
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Material(
      color: Colors.transparent,
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Image.asset(
                      'assets/loading_icon.gif',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/loading_icon.gif',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category,
                          style: TextStyle(
                            color: isDarkTheme ? Colors.black : null,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          createdAt,
                          style: const TextStyle(
                            color: AppTheme.iconGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Flexible(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDarkTheme ? Colors.black : null,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          calories,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green[700],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            favoritesState.toggleFavorite(title);
                            setState(() {});
                          },
                          child: Icon(
                            favoritesState.isFavorite(title)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}