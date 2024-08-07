part of ns_components;

final localizationManager = LocalizationManager._();

class LocalizationManager {
  LocalizationManager._();
  final _key = 'nsLocaleNotifier';

  Future<void> init({String defaultLanguageCode = 'en'}) async {
    final sp = await SharedPreferences.getInstance();
    final languageCode = sp.getString(_key);
    return setLocale(languageCode ?? defaultLanguageCode);
  }

  Future<void> setLocale(String languageCode) async {
    nsLocaleNotifier.value = Locale(languageCode);

    final sp = await SharedPreferences.getInstance();
    await sp.setString(_key, nsLocaleNotifier.value.languageCode);
  }
}
