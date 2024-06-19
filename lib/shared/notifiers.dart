part of ns_components;

final localeNotifier = ValueNotifier(const Locale('en'));
final brightnessNotifier = ValueNotifier(Brightness.light);
final internalBrightnessNotifier = ValueNotifier(NSBrightness.auto);
