import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationUtils on AppLocalizations {
  String? getLocalizedValue(String key) {
    final localizedValues = {
      "weekDaysMon": weekDaysMon,
      "weekDaysTue": weekDaysTue,
      "weekDaysWed": weekDaysWed,
      "weekDaysThu": weekDaysThu,
      "weekDaysFri": weekDaysFri,
      "weekDaysSat": weekDaysSat,
      "weekDaysSun": weekDaysSun,
    };

    return localizedValues[key];
  }
}
