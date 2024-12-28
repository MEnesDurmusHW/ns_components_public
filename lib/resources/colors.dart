part of ns_components;

abstract final class NSColors {
  static const _transparencyRatioHex = 0x9F000000;
  static const background = CupertinoDynamicColor.withBrightness(
    color: Color(0xFFF3F3F9),
    darkColor: Color(0xFF000000),
  );
  static const backgroundSecondary = CupertinoDynamicColor.withBrightness(
    color: Color(0xFFFFFFFF),
    darkColor: Color(0xFF000000),
  );
  static const partiallyTransparentBackground = CupertinoDynamicColor.withBrightness(
    color: Color(0xF3F3F9 + _transparencyRatioHex),
    darkColor: Color(0x000000 + _transparencyRatioHex),
  );
  static const partiallyTransparentBackgroundSecondary = CupertinoDynamicColor.withBrightness(
    color: Color(0xFFFFFF + _transparencyRatioHex),
    darkColor: Color(0x000000 + _transparencyRatioHex),
  );
  static const actionColor = CupertinoDynamicColor.withBrightness(
    color: Color(0xFF000000),
    darkColor: Color(0xFFFFFFFF),
  );
  static const kHeaderFooterColor = CupertinoDynamicColor(
    color: Color.fromRGBO(108, 108, 108, 1.0),
    darkColor: Color.fromRGBO(142, 142, 146, 1.0),
    highContrastColor: Color.fromRGBO(74, 74, 77, 1.0),
    darkHighContrastColor: Color.fromRGBO(176, 176, 183, 1.0),
    elevatedColor: Color.fromRGBO(108, 108, 108, 1.0),
    darkElevatedColor: Color.fromRGBO(142, 142, 146, 1.0),
    highContrastElevatedColor: Color.fromRGBO(108, 108, 108, 1.0),
    darkHighContrastElevatedColor: Color.fromRGBO(142, 142, 146, 1.0),
  );
  static const transparent = CupertinoDynamicColor.withBrightness(
    color: Color(0x00000000),
    darkColor: Color(0x00000000),
  );

  static const primaryBlack = CupertinoDynamicColor(
    color: Color(0xFF121215),
    elevatedColor: Color(0xFF000000),
    darkElevatedColor: Color(0xFF000000),
    highContrastColor: Color(0xFF121215),
    darkHighContrastColor: Color(0xFF121215),
    darkHighContrastElevatedColor: Color(0xFF000000),
    highContrastElevatedColor: Color(0xFF000000),
    darkColor: Color(0xFF1A1A1D),
  );

  static const charcoalBlack = CupertinoDynamicColor.withBrightness(
    color: Color.fromARGB(255, 28, 28, 30),
    darkColor: Color.fromARGB(255, 242, 242, 247),
  );

  static const blackWhite = CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.black,
    darkColor: CupertinoColors.white,
  );

  static const whiteBlack = CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.white,
    darkColor: CupertinoColors.black,
  );
}

extension CupertinoDynamicColorExtension on CupertinoDynamicColor {
  CupertinoDynamicColor withDynamicOpacity(double opacity) => CupertinoDynamicColor(
        color: color.withOpacity(opacity),
        darkColor: darkColor.withOpacity(opacity),
        highContrastColor: highContrastColor.withOpacity(opacity),
        darkHighContrastColor: darkHighContrastColor.withOpacity(opacity),
        elevatedColor: elevatedColor.withOpacity(opacity),
        darkElevatedColor: darkElevatedColor.withOpacity(opacity),
        highContrastElevatedColor: highContrastElevatedColor.withOpacity(opacity),
        darkHighContrastElevatedColor: darkHighContrastElevatedColor.withOpacity(opacity),
      );
}

extension ColorExtension on Color {
  CupertinoDynamicColor toDynamicColor() {
    return CupertinoDynamicColor.withBrightness(
      color: this,
      darkColor: this,
    );
  }
}
