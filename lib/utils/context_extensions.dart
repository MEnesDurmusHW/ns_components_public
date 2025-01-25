part of '../ns_components.dart';

extension NSContextExtension on BuildContext {
  void updateState() {
    if (this is StatefulElement) (this as StatefulElement).markNeedsBuild();
  }

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  CupertinoTextThemeData get textTheme => CupertinoTheme.of(this).textTheme;
  TextStyle get textStyle => textTheme.textStyle;
  CupertinoThemeData get theme => CupertinoTheme.of(this);
  CupertinoDynamicColor get primaryColor => theme.primaryColor as CupertinoDynamicColor;
  CupertinoDynamicColor get scaffoldBackgroundColor =>
      theme.scaffoldBackgroundColor as CupertinoDynamicColor;
  CupertinoDynamicColor get barBackgroundColor => theme.barBackgroundColor as CupertinoDynamicColor;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool get isDark =>
      (CupertinoTheme.maybeBrightnessOf(this) ?? Brightness.light) == Brightness.dark;
  bool get isEnable => NSDefaultEnabledWidget.ofWithFallback(this);
}

extension NSContextTextStyleExtensions on BuildContext {
  TextStyle get secondaryLabel => theme.textTheme.textStyle
      .merge(TextStyle(color: CupertinoColors.secondaryLabel.resolveFrom(this)));
  TextStyle get subtitle => textTheme.navTitleTextStyle;
  TextStyle get formTextStyle => NSEnabledFormTextStyle.maybeOf(this) ?? textStyle;
}
