part of '../ns_components.dart';

mixin NSPaddings {
  static const insetPadding = EdgeInsets.symmetric(horizontal: NSPaddingTypes.m);
  static const groupedPadding = EdgeInsets.symmetric(vertical: NSPaddingTypes.s);
  static const insetGroupedPadding = EdgeInsets.all(NSPaddingTypes.m);
  static const insetGroupedItemPadding = EdgeInsets.fromLTRB(
    NSPaddingTypes.m,
    0,
    NSPaddingTypes.m,
    NSPaddingTypes.m,
  );
  static const itemInsidePadding = EdgeInsets.symmetric(
    horizontal: NSPaddingTypes.m,
    vertical: NSPaddingTypes.s,
  );
  static const listTile = EdgeInsets.symmetric(horizontal: 15.0);
}

mixin NSPaddingTypes {
  static const xs = 5.0;
  static const s = 10.0;
  static const m = 20.0;
  static const l = 30.0;
  static const xl = 40.0;
}
