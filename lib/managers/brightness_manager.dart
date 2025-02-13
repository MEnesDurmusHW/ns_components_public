part of ns_components;

final nsbrightnessManager = NSBrightnessManager._();

class NSBrightnessManager extends ValueNotifier<Brightness?> {
  static const String _key = 'theme_mode';
  NSBrightnessManager._() : super(null);

  Future<void> init() async {
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged = notifyListeners;
    final prefs = await SharedPreferences.getInstance();
    final mode = prefs.getString(_key);
    if (mode == NSBrightness.light.name) {
      value = Brightness.light;
    } else if (mode == NSBrightness.dark.name) {
      value = Brightness.dark;
    } else {
      value = null;
    }
  }

  Brightness getValueByContext(BuildContext context) {
    return value ?? View.of(context).platformDispatcher.platformBrightness;
  }

  Future<void> _saveTheme(String mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode);
  }

  @override
  set value(Brightness? value) {
    super.value = value;
    _saveTheme(value?.name ?? NSBrightness.auto.name);
  }

  Future<void> setBrighness(NSBrightness brightness) async {
    value = brightness.toBrightness;
  }
}
