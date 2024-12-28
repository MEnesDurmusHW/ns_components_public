part of ns_components;

enum NSLanguage {
  en,
  tr,
  es,
  de;
  factory NSLanguage.fromLanguageCode(String langaugeCode) {
    return NSLanguage.values.firstWhere((e) => e.name == langaugeCode);
  }
  factory NSLanguage.fromLocale(Locale locale) {
    return NSLanguage.fromLanguageCode(locale.languageCode);
  }
  factory NSLanguage.fromContext(BuildContext context) {
    return NSLanguage.fromLocale(Localizations.localeOf(context));
  }
}