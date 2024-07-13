part of ns_components;

class LangaugeNavigationLink extends StatelessWidget {
  const LangaugeNavigationLink({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: nsLocaleNotifier,
        builder: (context, locale, _) {
          return NSListTile.navigationLink(
            title: _Localization.i.languageTitle,
            leading: NSFilledIcon.byIcon(
              CupertinoIcons.globe,
              color: CupertinoColors.activeBlue.resolveFrom(context),
            ),
            additionalInfo: Text(_Localization.i.currentLanguageDisplay),
            onTap: () => navigator.to(const LanguageView()),
          );
        });
  }
}
