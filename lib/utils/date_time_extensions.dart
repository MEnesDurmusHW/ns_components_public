part of ns_components;

extension DateTimeExtensions on DateTime {
  String format({required String pattern}) {
    final DateFormat formatter = DateFormat(pattern);
    return formatter.format(this);
  }

  String formatDate() {
    return format(pattern: 'dd MMM yyyy');
  }

  // 24-hour format
  String formatTime() {
    return format(pattern: 'HH:mm:ss');
  }
}
