part of '../ns_components.dart';

abstract class BaseRepository<T extends BaseDatabaseItem> with NSListenable {
  String get table => T.toString();
  Database get db;

  Future<void> createDatabaseTable(Database db, int version);
  T? fromJson(dynamic json);

  Future<List<T>> getAll() async {
    try {
      final mapList = await db.query(table);
      if (mapList.isEmpty) return [];
      return mapList.map(fromJson).toSafeList();
    } catch (e) {
      throw RepositoryException('Error on getAll: $e');
    }
  }

  Future<T> getById(String? id) async {
    try {
      final all = await getAll();
      return all.whereById(id);
    } catch (e) {
      throw RepositoryException('Error on getById: $e');
    }
  }

  Future<void> insert(T item) async {
    return _insert(item).whenComplete(notifyListeners);
  }

  Future<void> _insert(T item) async {
    try {
      await db.insert(table, item.toJson());
    } catch (e) {
      throw RepositoryException('Error on insert: $e');
    }
  }

  Future<void> update(T item) async {
    return _update(item).whenComplete(notifyListeners);
  }

  Future<void> _update(T item) async {
    try {
      await db.update(
        table,
        item.toJson(),
        where: 'id = ?',
        whereArgs: [item.id],
      );
    } catch (e) {
      throw RepositoryException('Error on update: $e');
    }
  }

  Future<void> delete(T item) async {
    return _delete(item).whenComplete(notifyListeners);
  }

  Future<void> _delete(T item) async {
    try {
      await db.delete(
        table,
        where: 'id = ?',
        whereArgs: [item.id],
      );
    } catch (e) {
      throw RepositoryException('Error on delete: $e');
    }
  }
}

extension _RepositoryPatternExtension<T extends BaseDatabaseItem> on List<T> {
  T whereById(String? id) {
    final result = where((e) => e.id == id);
    if (result.isEmpty) throw RepositoryException('Result of this id could not find: $id');
    return result.first;
  }
}

class RepositoryException implements Exception {
  final String message;
  final String? code;

  RepositoryException(this.message, [this.code]);

  @override
  String toString() => message;
}

abstract class BaseDatabaseItem {
  final String id;

  BaseDatabaseItem(String? id) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson();
}

bool fromIntToBool(intValue) => [1, true].contains(intValue);
