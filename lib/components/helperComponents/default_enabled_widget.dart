part of ns_components;

class NSDefaultEnabledWidget extends InheritedWidget {
  final bool isEnabled;
  const NSDefaultEnabledWidget({super.key, required this.isEnabled, required Widget child})
      : super(child: child);

  static bool? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NSDefaultEnabledWidget>()?.isEnabled;
  }

  static bool ofWithFallback(BuildContext context, [bool fallback = true]) {
    return context.dependOnInheritedWidgetOfExactType<NSDefaultEnabledWidget>()?.isEnabled ??
        fallback;
  }

  @override
  bool updateShouldNotify(NSDefaultEnabledWidget oldWidget) {
    return oldWidget.isEnabled != isEnabled;
  }
}
