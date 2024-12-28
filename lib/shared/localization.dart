part of ns_components;

class _Localization {
  final String languageTitle;
  final String languageEnglish;
  final String languageTurkish;
  final String languageGerman;
  final String languageSpanish;
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
    this.languageGerman,
    this.languageSpanish,
    this.currentLanguageDisplay,
    this.theme,
    this.themeAuto,
    this.themeLight,
    this.themeDark,
    this.feedback,
    this.rateUs,
  );

  static const _Localization _english = _Localization(
    'Language',
    'English',
    'Turkish',
    'German',
    'Spanish',
    'English',
    'Theme',
    'Automatic',
    'Light',
    'Dark',
    'Feedback',
    'Rate Us',
  );

  static const _Localization _turkish = _Localization(
    'Dil',
    'İngilizce',
    'Türkçe',
    'Almanca',
    'İspanyolca',
    'Türkçe',
    'Tema',
    'Otomatik',
    'Aydınlık',
    'Karanlık',
    'Bize Yazın',
    'Bizi Değerlendir',
  );

  static const _Localization _german = _Localization(
    'Sprache',
    'Englisch',
    'Türkisch',
    'Deutsch',
    'Spanisch',
    'Deutsch',
    'Thema',
    'Automatisch',
    'Hell',
    'Dunkel',
    'Feedback',
    'Bewerten Sie uns',
  );

  static const _Localization _spanish = _Localization(
    'Idioma',
    'Inglés',
    'Turco',
    'Alemán',
    'Español',
    'Español',
    'Tema',
    'Automático',
    'Claro',
    'Oscuro',
    'Comentarios',
    'Califícanos',
  );

  static _Localization get i {
    switch (nsLocaleNotifier.value.languageCode) {
      case 'tr':
        return _turkish;
      case 'de':
        return _german;
      case 'es':
        return _spanish;
      default:
        return _english;
    }
  }
}
