part of ns_components;

class BrightnessToggle extends StatelessWidget implements NSWidget {
  const BrightnessToggle({super.key});

  bool get isDarkMode => brightnessNotifier.value == Brightness.dark;

  void onDarkModeChanged(bool value) {
    brightnessNotifier.value = value ? Brightness.dark : Brightness.light;
  }

  @override
  EdgeInsets get padding => const EdgeInsets.all(15.0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: localeNotifier,
        builder: (context, locale, _) {
          return ValueListenableBuilder(
              valueListenable: brightnessNotifier,
              builder: (context, brightness, _) {
                return NSListTile(
                  title: _Localization.i.darkMode,
                  leading: const NSFilledIcon(
                    CupertinoIcons.moon_fill,
                    color: CupertinoColors.systemIndigo,
                  ),
                  trailing: CupertinoSwitch(
                    value: isDarkMode,
                    onChanged: onDarkModeChanged,
                  ),
                );
              });
        });
  }
}
