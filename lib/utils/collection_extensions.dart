part of '../ns_components.dart';

extension CollectionExtension<T> on Iterable<T?> {
  List<T> toSafeList() => where((e) => e != null).map((e) => e!).toList();
}
