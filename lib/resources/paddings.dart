part of '../ns_components.dart';

abstract final class NSPaddings {
  static const insetPadding = EdgeInsets.symmetric(horizontal: NSPaddingTypes.horizontal);
  static const groupedPadding = EdgeInsets.only(
    top: NSPaddingTypes.top,
    bottom: NSPaddingTypes.bottom,
  );
  static const insetGroupedPadding = EdgeInsets.fromLTRB(
    NSPaddingTypes.horizontal,
    NSPaddingTypes.top,
    NSPaddingTypes.horizontal,
    NSPaddingTypes.bottom,
  );
  static const insetGroupedItemPadding = EdgeInsets.fromLTRB(
    NSPaddingTypes.horizontal,
    0,
    NSPaddingTypes.horizontal,
    NSPaddingTypes.bottom,
  );
  static const itemInsidePadding = EdgeInsets.symmetric(
    horizontal: NSPaddingTypes.horizontal,
    vertical: NSPaddingTypes.vertical,
  );
  static const listTile = EdgeInsets.symmetric(horizontal: NSPaddingTypes.horizontal);

  static const headLinePadding = EdgeInsets.fromLTRB(
    NSPaddingTypes.horizontal,
    NSPaddingTypes.s,
    NSPaddingTypes.horizontal,
    NSPaddingTypes.top,
  );
}

abstract final class NSPaddingTypes {
  static const xs = 4.0;
  static const s = 8.0;
  static const m = 16.0;
  static const l = 24.0;
  static const xl = 32.0;

  static const horizontal = 20.0;
  static const vertical = 16.0;

  static const top = 10.0;
  static const bottom = 20.0;
}
