part of ns_components;

class LanguageView extends StatelessWidget {
  final Set<NSLanguage> langauges;
  const LanguageView({super.key, this.langauges = const {NSLanguage.en, NSLanguage.tr}});

  bool isChecked(String languageCode) {
    return nsLocaleNotifier.value.languageCode == languageCode;
  }

  void setLanguage(String languageCode) {
    localizationManager.setLocale(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: nsLocaleNotifier,
      builder: (context, locale, _) {
        return NSScaffold(
          title: _Localization.i.languageTitle,
          children: [
            NSListSection(
              children: [
                if (langauges.contains(NSLanguage.en))
                  CupertinoListTile(
                    title: const Text('English'),
                    subtitle: Text(_Localization.i.languageEnglish),
                    trailing: isChecked('en') ? const NSCheckMark() : null,
                    onTap: () => setLanguage('en'),
                  ),
                if (langauges.contains(NSLanguage.tr))
                  CupertinoListTile(
                    title: const Text('Türkçe'),
                    subtitle: Text(_Localization.i.languageTurkish),
                    trailing: isChecked('tr') ? const NSCheckMark() : null,
                    onTap: () => setLanguage('tr'),
                  ),
                if (langauges.contains(NSLanguage.de))
                  CupertinoListTile(
                    title: const Text('Deutsch'),
                    subtitle: Text(_Localization.i.languageGerman),
                    trailing: isChecked('de') ? const NSCheckMark() : null,
                    onTap: () => setLanguage('de'),
                  ),
                if (langauges.contains(NSLanguage.es))
                  CupertinoListTile(
                    title: const Text('Español'),
                    subtitle: Text(_Localization.i.languageSpanish),
                    trailing: isChecked('es') ? const NSCheckMark() : null,
                    onTap: () => setLanguage('es'),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
