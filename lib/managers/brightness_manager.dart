part of ns_components;

final brightnessManager = BrightnessManager._();

class BrightnessManager {
  BrightnessManager._();

  Future<void> init() async {
    final sp = await SharedPreferences.getInstance();
    final rawValue = sp.getString(nsInternalBrightnessNotifier.value.runtimeType.toString());
    if (rawValue == null) return listenBrightness();
    return setBrighness(NSBrightness.fromString(rawValue));
  }

  void setBrighness(NSBrightness brightness) {
    nsInternalBrightnessNotifier.value = brightness;
    if (brightness == NSBrightness.auto) {
      nsBrightnessNotifier.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      listenBrightness();
    } else {
      nsBrightnessNotifier.value = brightness.toBrightness!;
    }
    SharedPreferences.getInstance()
        .then((sp) => sp.setString(brightness.runtimeType.toString(), nsInternalBrightnessNotifier.value.name));
  }

  void listenBrightness() {
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged = () {
      nsBrightnessNotifier.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    };
  }
}
