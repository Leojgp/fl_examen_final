String getTodayDateFormatted() {
  DateTime now = DateTime.now();
  String day = now.day.toString().padLeft(2, '0');
  String month = now.month.toString().padLeft(2, '0');
  String year = now.year.toString();

  return '$day-$month-$year';
}

String formatDate(DateTime date) {
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString();

  return '$day-$month-$year';
}
