part of '../ns_components.dart';

mixin NSDecorations {
  static const borderRadius = BorderRadius.all(Radius.circular(10));
  static BorderRadius? getBorderRadiusBySize(double? size) => size == null ? null : BorderRadius.all(Radius.circular(size * 2 / 9));
}
