part of '../ns_components.dart';

final nsTheme = CupertinoThemeData(
  brightness: nsBrightnessNotifier.value,
  primaryColor: CupertinoColors.systemBlue,
  scaffoldBackgroundColor: NSColors.background,
  barBackgroundColor: NSColors.partiallyTransparentBackground,
);
