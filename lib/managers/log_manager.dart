part of ns_components;

final logger = Logger._();

class Logger with ChangeNotifier {
  Logger._();

  final List<String> logs = [];

  void log(Object? obj) {
    if (obj == null) return;

    final text = '${NSUtils().getCallerMethodName()}\n${obj.toString()}';
    if (text.toLowerCase().contains('bearer')) return;
    if (kDebugMode) print(text);
    logs.add(text);
    notifyListeners();
  }

  void cleanLogs() {
    logs.clear();
    notifyListeners();
  }
}
