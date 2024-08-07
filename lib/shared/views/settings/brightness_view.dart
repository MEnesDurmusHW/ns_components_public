part of ns_components;

class BrightnessView extends StatelessWidget {
  final String? title;
  const BrightnessView({super.key, this.title});

  Widget? trailing(NSBrightness brightness) {
    return nsInternalBrightnessNotifier.value == brightness ? const NSCheckMark() : null;
  }

  void setBrightness(NSBrightness brightness) {
    brightnessManager.setBrighness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: nsLocaleNotifier,
      builder: (context, locale, _) {
        return ValueListenableBuilder(
          valueListenable: nsInternalBrightnessNotifier,
          builder: (context, brightness, _) {
            return NSScaffold(
              title: title ?? _Localization.i.theme,
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
