import 'package:easix/src/sort_list_by_date/sort_date_list.dart';

/// Convert to sorted notifications.
SortedDateList<T> convertToSortedDateList<T>(
  SortedDateList<T> existingList,
  List<T> newList,
  String Function(T) getDate,
) {
  final updatedData = List<SortedDateModel<T>>.from(
    existingList.data,
  ); // Create a copy of the existing data

  for (final item in newList) {
    final date = getDate(item);
    final existingModel = updatedData.firstWhere(
      (model) => model.date == date,
      orElse: () => SortedDateModel<T>(date: date, list: <T>[]),
    );

    if (existingModel.list.isNotEmpty) {
      existingModel.list.add(item);
    } else {
      updatedData.add(SortedDateModel<T>(list: [item], date: date));
    }
  }

  return SortedDateList<T>(
    data: updatedData,
  ); // Return a new SortedDateList with the updated data
}
