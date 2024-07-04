part of ns_components;

class LocalizedText {
  final String tr;
  final String en;

  const LocalizedText({
    required this.tr,
    required this.en,
  });

  factory LocalizedText.fromJson(Map<String, dynamic> json) {
    return LocalizedText(
      tr: json['tr'],
      en: json['en'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tr': tr,
        'en': en,
      };

  String get text => localeNotifier.value.languageCode == 'en' ? en : tr;
}
