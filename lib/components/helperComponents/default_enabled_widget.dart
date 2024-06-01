part of ns_components;

class NSDefaultEnabledWidget extends InheritedWidget {
  final bool isEnabled;
  const NSDefaultEnabledWidget({super.key, required this.isEnabled, required Widget child}) : super(child: child);

  static NSDefaultEnabledWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NSDefaultEnabledWidget>();
  }

  @override
  bool updateShouldNotify(NSDefaultEnabledWidget oldWidget) {
    return oldWidget.isEnabled != isEnabled;
  }
}
