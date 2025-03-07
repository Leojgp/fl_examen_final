class MealsData {
  List<String> meals = [];

  void addMeal(String meal) {
    meals.add(meal);
  }

  void removeMeal(String meal) {
    meals.remove(meal);
  }

  List<String> getMeals() {
    return meals;
  }

  bool isMealExists(String meal) {
    return meals.contains(meal);
  }
}
