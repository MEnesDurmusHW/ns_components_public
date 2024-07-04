part of '../ns_components.dart';

extension NSContextExtension on BuildContext {
  void updateState() {
    if (this is StatefulElement) (this as StatefulElement).markNeedsBuild();
  }

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  CupertinoTextThemeData get textTheme => CupertinoTheme.of(this).textTheme;
  TextStyle get textStyle => textTheme.textStyle;
  CupertinoThemeData get theme => CupertinoTheme.of(this);

  // AppLocalizations get localized => AppLocalizations.of(this)!;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension NSContextTextStyleExtensions on BuildContext {
  TextStyle get secondaryLabel => theme.textTheme.textStyle
      .merge(TextStyle(color: CupertinoColors.secondaryLabel.resolveFrom(this)));
  TextStyle get subtitle => textTheme.navTitleTextStyle;
}
