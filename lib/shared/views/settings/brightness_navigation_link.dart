part of ns_components;

class NSBrightnessListTile extends StatelessWidget implements NSWidget {
  const NSBrightnessListTile({super.key});

  @override
  EdgeInsets get padding => const EdgeInsets.all(15.0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: nsLocaleNotifier,
      builder: (_, __, ___) {
        return ValueListenableBuilder(
          valueListenable: nsbrightnessManager,
          builder: (_, __, ___) {
            return NSListTile.navigationLink(
              title: _Localization.i.theme,
              leading: NSFilledIcon.byIcon(
                CupertinoIcons.circle_lefthalf_fill,
                color: CupertinoColors.systemIndigo.resolveFrom(context),
              ),
              additionalInfo:
                  Text(NSBrightness.fromBrightness(nsbrightnessManager.value).localizedText),
              onTap: () => navigator.to(const NSBrightnessView()),
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
      valueListenable: nsbrightnessManager,
      builder: (_, brightness, ___) {
        return NSListTile(
          title: "${_Localization.i.themeDark} ${_Localization.i.theme}",
          leading: NSFilledIcon.byIcon(
            CupertinoIcons.circle_lefthalf_fill,
            color: CupertinoColors.systemIndigo.resolveFrom(context),
          ),
          trailing: CupertinoSwitch(
            value: (brightness ?? View.of(context).platformDispatcher.platformBrightness) ==
                Brightness.dark,
            onChanged: (value) => nsbrightnessManager.setBrighness(
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
      valueListenable: nsbrightnessManager,
      builder: (_, nsbrightness, ___) {
        return CupertinoSwitch(
          value: nsbrightness == Brightness.dark,
          onChanged: (value) => nsbrightnessManager.setBrighness(
            value ? NSBrightness.dark : NSBrightness.light,
          ),
        );
      },
    );
  }
}
