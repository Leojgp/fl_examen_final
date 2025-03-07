import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationService {
  static late BuildContext _context;

  static void initialize(BuildContext context) {
    _context = context;
  }

  static String getErrorMessage(ErrorType errorType) {
    switch (errorType) {
      case ErrorType.userNotLoggedIn:
        return AppLocalizations.of(_context)!.userNotLogged;
      case ErrorType.userDataNotFound:
        return AppLocalizations.of(_context)!.userNotFound;
      case ErrorType.dietNotFound:
        return AppLocalizations.of(_context)!.dietNotFound;
      case ErrorType.noDietDataForToday:
        return AppLocalizations.of(_context)!.noDietData;
      case ErrorType.invalidDietId:
        return AppLocalizations.of(_context)!.invalidDietId;
      case ErrorType.noDietForDate:
        return AppLocalizations.of(_context)!.noDietForDate;
      case ErrorType.mealDataNotFound:
        return AppLocalizations.of(_context)!.mealDataNotFound;
      case ErrorType.ingredientDataNotFound:
        return "Ingredient data not found";
      default:
        return "Unknown error";
    }
  }
}

enum ErrorType {
  userNotLoggedIn,
  userDataNotFound,
  dietNotFound,
  noDietDataForToday,
  invalidDietId,

  noDietForDate,
  mealDataNotFound,
  ingredientDataNotFound,
}

class UserNotLoggedInException implements Exception {
  final String message;
  UserNotLoggedInException()
      : message =
            LocalizationService.getErrorMessage(ErrorType.userNotLoggedIn);
}

class UserDataNotFoundException implements Exception {
  final String message;
  UserDataNotFoundException()
      : message =
            LocalizationService.getErrorMessage(ErrorType.userDataNotFound);
}

class DietNotFoundException implements Exception {
  final String message;
  DietNotFoundException()
      : message = LocalizationService.getErrorMessage(ErrorType.dietNotFound);
}

class NoDietDataForTodayException implements Exception {
  final String message;
  NoDietDataForTodayException()
      : message =
            LocalizationService.getErrorMessage(ErrorType.noDietDataForToday);
}

class DietDataNotFoundException implements Exception {
  final String message;
  DietDataNotFoundException()
      : message = LocalizationService.getErrorMessage(ErrorType.dietNotFound);
}

class InvalidDietIdException implements Exception {
  final String message;
  InvalidDietIdException()
      : message = LocalizationService.getErrorMessage(ErrorType.invalidDietId);
}

class NoDietForDateException implements Exception {
  final String message;
  NoDietForDateException()
      : message = LocalizationService.getErrorMessage(ErrorType.dietNotFound);
}

class MealDataNotFoundException implements Exception {
  final String message;
  MealDataNotFoundException()
      : message =
            LocalizationService.getErrorMessage(ErrorType.mealDataNotFound);
}

class IngredientDataNotFoundException implements Exception {
  final String message;
  IngredientDataNotFoundException()
      : message = LocalizationService.getErrorMessage(
            ErrorType.ingredientDataNotFound);
}
