part of ns_components;

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  bool isChecked(String languageCode) {
    return nsLocaleNotifier.value.languageCode == languageCode;
  }

  void setLanguage(String languageCode) {
    nsLocaleNotifier.value = Locale(languageCode);
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
                CupertinoListTile(
                  title: const Text('English'),
                  subtitle: Text(_Localization.i.languageEnglish),
                  trailing: isChecked('en') ? const NSCheckMark() : null,
                  onTap: () => setLanguage('en'),
                ),
                CupertinoListTile(
                  title: const Text('Türkçe'),
                  subtitle: Text(_Localization.i.languageTurkish),
                  trailing: isChecked('tr') ? const NSCheckMark() : null,
                  onTap: () => setLanguage('tr'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
