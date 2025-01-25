part of '../../ns_components.dart';

class NSEnabledFormTextStyle extends InheritedWidget {
  final TextStyle style;
  const NSEnabledFormTextStyle({
    super.key,
    required this.style,
    required Widget child,
  }) : super(child: child);

  factory NSEnabledFormTextStyle.formField({
    required BuildContext context,
    required Widget child,
  }) {
    return NSEnabledFormTextStyle(
      style: context.textStyle,
      child: child,
    );
  }

  factory NSEnabledFormTextStyle.infoField({
    required BuildContext context,
    required Widget child,
  }) {
    return NSEnabledFormTextStyle(
      style: context.textStyle.copyWith(
        color: context.primaryColor.resolveFrom(context),
      ),
      child: child,
    );
  }

  static TextStyle? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NSEnabledFormTextStyle>()?.style;
  }

  @override
  bool updateShouldNotify(NSEnabledFormTextStyle oldWidget) {
    return oldWidget.style != style;
  }
}
