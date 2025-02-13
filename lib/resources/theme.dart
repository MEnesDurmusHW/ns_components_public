part of '../ns_components.dart';

final nsTheme = CupertinoThemeData(
  brightness: nsbrightnessManager.value,
  primaryColor: CupertinoColors.systemBlue,
  scaffoldBackgroundColor: NSColors.background,
  barBackgroundColor: NSColors.partiallyTransparentBackground,
);
