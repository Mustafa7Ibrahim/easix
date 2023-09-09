/// Sorted notifications.
class SortedDateList<T> {
  /// Default constructor.
  const SortedDateList({this.data});

  /// date.
  final List<SortedDateModel<T>>? data;
}

/// Sorted notifications.
class SortedDateModel<T> {
  /// Default constructor.
  SortedDateModel({required this.date, required this.list});

  /// notifications.
  final List<T> list;

  /// date.
  final String date;
}
