import 'package:flutter/foundation.dart';
import 'package:fl_examen_final/models/diet.dart';
import 'package:fl_examen_final/services/diet_service.dart';
import 'package:fl_examen_final/utils/extended_models.dart';

class DietProvider extends ChangeNotifier {
  CompleteDiet? _todayDiet;
  CompleteDiet? get todayDiet => _todayDiet;

  List<CompleteDiet>? _userDiets;
  List<CompleteDiet>? get userDiets => _userDiets;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isInitialized = false;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  //sistema de cache
  final Map<String, List<CompleteDiet>> _dietsByDate = {};
  DateTime? _lastLoadedDate;

  Future<void> loadTodayDiet({bool forceRefresh = false}) async {
    if (_isInitialized && !forceRefresh) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _todayDiet = await getTodayDiet();
      _isInitialized = true;

      // Guardar en caché
      final today = DateTime.now();
      final dateKey = _getDateKey(today);
      if (_todayDiet != null) {
        _dietsByDate[dateKey] = [_todayDiet!];
      }
    } catch (e) {
      _errorMessage = "Error loading today's diet: ${e.toString()}";
      _todayDiet = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadAllUserDiets() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _userDiets = await getAllUserDiets();
    } catch (e) {
      _errorMessage = e.toString();
      _userDiets = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> assignDietToCurrentUser(
      String userid, CompleteDiet diet, DateTime date) async {
    _isLoading = true;
    notifyListeners();

    try {
      await assignDietToUser(userid, diet, date);
      await loadTodayDiet();
    } catch (e) {
      _errorMessage = "Error assigning diet: ${e.toString()}";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String _getDateKey(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  Future<List<CompleteDiet>> getDietsForDate(DateTime date) async {
    final dateKey = _getDateKey(date);

    // misma fecha y no hay datos, no recarga
    if (_lastLoadedDate != null &&
        _lastLoadedDate!.year == date.year &&
        _lastLoadedDate!.month == date.month &&
        _lastLoadedDate!.day == date.day &&
        _userDiets != null &&
        _userDiets!.isNotEmpty) {
      return _userDiets!;
    }

    // usar datos en cache
    if (_dietsByDate.containsKey(dateKey)) {
      _userDiets = _dietsByDate[dateKey];
      _lastLoadedDate = date;
      notifyListeners();
      return _userDiets!;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final diets = await getUserDietsForDate(date);

      // IMPORTANTE: Guardar los resultados en _userDiets
      _userDiets = diets;
      _lastLoadedDate = date;

      _dietsByDate[dateKey] = diets;

      _isLoading = false;
      notifyListeners();
      return diets;
    } catch (e) {
      _errorMessage = e.toString();
      _userDiets = [];
      _isLoading = false;
      notifyListeners();
      return [];
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
