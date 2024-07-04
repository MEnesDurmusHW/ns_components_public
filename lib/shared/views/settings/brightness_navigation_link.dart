part of ns_components;

class BrightnessToggle extends StatelessWidget implements NSWidget {
  const BrightnessToggle({super.key});

  @override
  EdgeInsets get padding => const EdgeInsets.all(15.0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: localeNotifier,
      builder: (_, __, ___) {
        return ValueListenableBuilder(
          valueListenable: internalBrightnessNotifier,
          builder: (_, __, ___) {
            return NSListTile.navigationLink(
              title: _Localization.i.theme,
              leading: NSFilledIcon.byIcon(
                CupertinoIcons.circle_lefthalf_fill,
                color: CupertinoColors.systemIndigo.resolveFrom(context),
              ),
              additionalInfo: Text(internalBrightnessNotifier.value.localizedText),
              onTap: () => navigator.to(const BrightnessView()),
            );
          },
        );
      },
    );
  }
}
