import 'package:collection/collection.dart';

extension NSEnumExtension<T extends Enum> on Iterable<T> {
  T? byNameOrNull(String name) => firstWhereOrNull((value) => value.name == name);
}
