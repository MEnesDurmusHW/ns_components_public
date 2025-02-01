part of ns_components;

class NSUtils {
  String getCallerMethodName() {
    if (kIsWeb && kReleaseMode) return "not supported on web";
    final methodName = _getMethodNameFromStackLine(StackTrace.current.toString().split('\n')[2]);
    return methodName;
  }

  String _getMethodNameFromStackLine(String stackLine) {
    final afterDotPart = stackLine.substring(2).trimLeft();
    final spaceIndex = afterDotPart.indexOf(' ');
    return afterDotPart.substring(0, spaceIndex);
  }

  T? tryGetValue<T>(T? Function() fn) {
    try {
      return fn();
    } catch (_) {}
    return null;
  }
}
