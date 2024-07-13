part of ns_components;

class _Localization {
  final String languageTitle;
  final String languageEnglish;
  final String languageTurkish;
  final String currentLanguageDisplay;
  final String theme;
  final String themeAuto;
  final String themeLight;
  final String themeDark;
  final String feedback;
  final String rateUs;

  const _Localization(
    this.languageTitle,
    this.languageEnglish,
    this.languageTurkish,
    this.currentLanguageDisplay,
    this.theme,
    this.themeAuto,
    this.themeLight,
    this.themeDark,
    this.feedback,
    this.rateUs,
  );

  static const _Localization _english = _Localization(
      'Language', 'English', 'Turkish', 'English', 'Theme', 'Automatic', 'Light', 'Dark', 'Feedback', 'Rate Us');
  static const _Localization _turkish = _Localization('Dil', 'İngilizce', 'Türkçe', 'Türkçe', 'Tema', 'Otomatik',
      'Aydınlık', 'Karanlık', 'Bize Yazın', 'Bizi Değerlendir');

  static _Localization get i => nsLocaleNotifier.value.languageCode == 'en' ? _english : _turkish;
}
