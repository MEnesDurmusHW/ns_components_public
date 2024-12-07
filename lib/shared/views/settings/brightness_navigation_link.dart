part of ns_components;

class ThemeListTile extends StatelessWidget implements NSWidget {
  const ThemeListTile({super.key});

  @override
  EdgeInsets get padding => const EdgeInsets.all(15.0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: nsLocaleNotifier,
      builder: (_, __, ___) {
        return ValueListenableBuilder(
          valueListenable: nsInternalBrightnessNotifier,
          builder: (_, __, ___) {
            return NSListTile.navigationLink(
              title: _Localization.i.theme,
              leading: NSFilledIcon.byIcon(
                CupertinoIcons.circle_lefthalf_fill,
                color: CupertinoColors.systemIndigo.resolveFrom(context),
              ),
              additionalInfo: Text(nsInternalBrightnessNotifier.value.localizedText),
              onTap: () => navigator.to(const BrightnessView()),
            );
          },
        );
      },
    );
  }
}

class NSBrightnessToggleTile extends StatelessWidget {
  const NSBrightnessToggleTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: nsInternalBrightnessNotifier,
      builder: (_, nsbrightness, ___) {
        return NSListTile(
          title: _Localization.i.theme,
          leading: NSFilledIcon.byIcon(
            CupertinoIcons.circle_lefthalf_fill,
            color: CupertinoColors.systemIndigo.resolveFrom(context),
          ),
          trailing: CupertinoSwitch(
            value: nsbrightness.toBrightness == Brightness.dark,
            onChanged: (value) => brightnessManager.setBrighness(
              value ? NSBrightness.dark : NSBrightness.light,
            ),
          ),
        );
      },
    );
  }
}

class NSBrightnessToggle extends StatelessWidget {
  const NSBrightnessToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: nsInternalBrightnessNotifier,
      builder: (_, nsbrightness, ___) {
        return CupertinoSwitch(
          value: nsbrightness.toBrightness == Brightness.dark,
          onChanged: (value) => brightnessManager.setBrighness(
            value ? NSBrightness.dark : NSBrightness.light,
          ),
        );
      },
    );
  }
}
