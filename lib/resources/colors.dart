part of ns_components;

mixin NSColors {
  static const background = CupertinoDynamicColor.withBrightness(
    color: Color(0xFFF3F3F9),
    darkColor: Color(0xFF000000),
  );
  static const backgroundSecondary = CupertinoDynamicColor.withBrightness(
    color: Color(0xFFFFFFFF),
    darkColor: Color(0xFF000000),
  );
  static const partiallyTransparentBackground = CupertinoDynamicColor.withBrightness(
    color: Color(0xEAF3F3F9),
    darkColor: Color(0xAF000000),
  );
  static const actionColor = CupertinoDynamicColor.withBrightness(
    color: Color(0xFF000000),
    darkColor: Color(0xFFFFFFFF),
  );
  static const Color kHeaderFooterColor = CupertinoDynamicColor(
    color: Color.fromRGBO(108, 108, 108, 1.0),
    darkColor: Color.fromRGBO(142, 142, 146, 1.0),
    highContrastColor: Color.fromRGBO(74, 74, 77, 1.0),
    darkHighContrastColor: Color.fromRGBO(176, 176, 183, 1.0),
    elevatedColor: Color.fromRGBO(108, 108, 108, 1.0),
    darkElevatedColor: Color.fromRGBO(142, 142, 146, 1.0),
    highContrastElevatedColor: Color.fromRGBO(108, 108, 108, 1.0),
    darkHighContrastElevatedColor: Color.fromRGBO(142, 142, 146, 1.0),
  );
}
