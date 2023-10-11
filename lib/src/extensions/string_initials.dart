extension StringInitials on String {
  String get initials {
    List<String> nameParts = split(' ');
    if (nameParts.length < 2) {
      return nameParts.first.substring(0, 1);
    }
    return nameParts.first[0] + nameParts.last[0];
  }
}
