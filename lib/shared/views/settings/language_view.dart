part of ns_components;



class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  bool isChecked(String languageCode) {
    return localeNotifier.value.languageCode == languageCode;
  }

  void setLanguage(String languageCode) {
    localeNotifier.value = Locale(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: localeNotifier,
        builder: (context, locale, _) {
          return NSScaffold(
            title: _Localization.i.languageTitle,
            children: [
              NSListSection(
                children: [
                  NSListTile(
                    title: 'English',
                    subtitle: _Localization.i.languageEnglish,
                    trailing: isChecked('en') ? const NSCheckMark() : null,
                    onTap: () => setLanguage('en'),
                  ),
                  NSListTile(
                    title: 'Türkçe',
                    subtitle: _Localization.i.languageTurkish,
                    trailing: isChecked('tr') ? const Icon(CupertinoIcons.check_mark) : null,
                    onTap: () => setLanguage('tr'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}


