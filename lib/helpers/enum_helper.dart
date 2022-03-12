abstract class EnumHelpers {
  static String humanize<T>(T value) {
    final parts = value.toString().split('.').last;
    return parts[0].toUpperCase() + parts.substring(1, parts.length);
  }
}
