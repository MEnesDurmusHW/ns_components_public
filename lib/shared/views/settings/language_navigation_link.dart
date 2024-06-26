part of ns_components;

class LangaugeNavigationLink extends StatelessWidget {
  const LangaugeNavigationLink({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: localeNotifier,
        builder: (context, locale, _) {
          return NSListTile.navigationLink(
            title: _Localization.i.languageTitle,
            leading: const NSFilledIcon(
              CupertinoIcons.globe,
              color: CupertinoColors.activeBlue,
            ),
            additionalInfo: Text(_Localization.i.currentLanguageDisplay),
            onTap: () => navigator.to(const LanguageView()),
          );
        });
  }
}
