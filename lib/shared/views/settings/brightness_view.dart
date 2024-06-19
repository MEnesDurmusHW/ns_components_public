part of ns_components;

class BrightnessView extends StatelessWidget {
  const BrightnessView({super.key});

  Widget? trailing(NSBrightness brightness) {
    return internalBrightnessNotifier.value == brightness ? const NSCheckMark() : null;
  }

  void setBrightness(NSBrightness brightness) {
    brightnessManager.setBrighness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: localeNotifier,
      builder: (context, locale, _) {
        return ValueListenableBuilder(
          valueListenable: internalBrightnessNotifier,
          builder: (context, brightness, _) {
            return NSScaffold(
              title: _Localization.i.theme,
              children: [
                NSListSection(
                  children: NSBrightness.values
                      .map(
                        (nsbrightness) => CupertinoListTile(
                          title: Text(nsbrightness.localizedText),
                          trailing: trailing(nsbrightness),
                          onTap: () => setBrightness(nsbrightness),
                        ),
                      )
                      .toList(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
