part of ns_components;

final brightnessManager = BrightnessManager._();

class BrightnessManager {
  BrightnessManager._();

  Future<void> init() async {
    final sp = await SharedPreferences.getInstance();
    final rawValue = sp.getString(nsInternalBrightnessNotifier.value.runtimeType.toString());
    listenBrightness();
    if (rawValue == null) return;
    return setBrighness(NSBrightness.fromString(rawValue));
  }

  Future<void> setBrighness(NSBrightness brightness) async {
    nsInternalBrightnessNotifier.value = brightness;
    if (brightness == NSBrightness.auto) {
      nsBrightnessNotifier.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      listenBrightness();
    } else {
      nsBrightnessNotifier.value = brightness.toBrightness!;
    }
    final sp = await SharedPreferences.getInstance();
    await sp.setString(brightness.runtimeType.toString(), nsInternalBrightnessNotifier.value.name);
  }

  void listenBrightness() {
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged = () {
      if (nsInternalBrightnessNotifier.value == NSBrightness.auto) {
        nsBrightnessNotifier.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      }
    };
  }
}
