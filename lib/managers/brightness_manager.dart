part of ns_components;

final brightnessManager = BrightnessManager._();

class BrightnessManager {
  BrightnessManager._();

  Future<void> init() async {
    final sp = await SharedPreferences.getInstance();
    final rawValue = sp.getString(internalBrightnessNotifier.value.runtimeType.toString());
    if (rawValue == null) return listenBrightness();
    return setBrighness(NSBrightness.fromString(rawValue));
  }

  void setBrighness(NSBrightness brightness) {
    internalBrightnessNotifier.value = brightness;
    if (brightness == NSBrightness.auto) {
      brightnessNotifier.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      listenBrightness();
    } else {
      brightnessNotifier.value = brightness.toBrightness!;
    }
    SharedPreferences.getInstance()
        .then((sp) => sp.setString(brightness.runtimeType.toString(), internalBrightnessNotifier.value.name));
  }

  void listenBrightness() {
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged = () {
      brightnessNotifier.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    };
  }
}
