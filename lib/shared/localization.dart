part of ns_components;

class _Localization {
  final String languageTitle;
  final String languageEnglish;
  final String languageTurkish;
  final String currentLanguageDisplay;
  final String darkMode;

  const _Localization(
    this.languageTitle,
    this.languageEnglish,
    this.languageTurkish,
    this.currentLanguageDisplay,
    this.darkMode,
  );

  static const _Localization _english = _Localization('Language', 'English', 'Turkish', 'English', 'Dark Mode');
  static const _Localization _turkish = _Localization('Dil', 'İngilizce', 'Türkçe', 'Türkçe', 'Karanlık Mod');

  static _Localization get i => localeNotifier.value.languageCode == 'en' ? _english : _turkish;
}
