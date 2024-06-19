part of ns_components;

enum NSBrightness {
  auto,
  light,
  dark;

  factory NSBrightness.fromBrightness(Brightness brightness) {
    return NSBrightness.values.firstWhere(
      (e) => e.name == brightness.name,
      orElse: () => NSBrightness.auto,
    );
  }
  factory NSBrightness.fromString(String brightnessName) {
    return NSBrightness.values.firstWhere(
      (e) => e.name == brightnessName,
      orElse: () => NSBrightness.auto,
    );
  }
  String get localizedText {
    switch (this) {
      case NSBrightness.auto:
        return _Localization.i.themeAuto;
      case NSBrightness.dark:
        return _Localization.i.themeDark;
      case NSBrightness.light:
        return _Localization.i.themeLight;
    }
  }

  Brightness? get toBrightness => Brightness.values.firstWhereOrNull((e) => e.name == name);
}
