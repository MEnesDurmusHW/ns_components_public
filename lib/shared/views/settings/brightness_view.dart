part of ns_components;

class NSBrightnessView extends StatelessWidget {
  final String? title;
  const NSBrightnessView({super.key, this.title});

  Widget? trailing(NSBrightness brightness) {
    return nsbrightnessManager.value == brightness.toBrightness ? const NSCheckMark() : null;
  }

  void setBrightness(NSBrightness brightness) {
    nsbrightnessManager.setBrighness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: nsLocaleNotifier,
      builder: (context, locale, _) {
        return ValueListenableBuilder(
          valueListenable: nsbrightnessManager,
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
