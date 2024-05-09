/// get type list from dynamic data
/// an example of how to use it:
/// ```dart
/// final nearbyPharmacies = getTypeList<NearbyPharmacies>(
///       response.data,
///       NearbyPharmacies.fromJson,
///     );
/// ```
/// @param data dynamic data that came from the server or any source
/// @param fromJson function to convert json to object
/// @return list of objects of type T
/// @see getTypeList
List<T> getTypeList<T>(
  dynamic data,
  T Function(Map<String, dynamic>) fromJson,
) {
  final convertedList = (data as List<dynamic>)
      .map<T>((item) => fromJson(item as Map<String, dynamic>))
      .toList();

  return convertedList;
}
