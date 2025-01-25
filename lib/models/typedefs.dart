part of ns_components;

typedef CreateDatabaseFunction = Future<void> Function(Database db, int version);
typedef Json = Map<String, dynamic>;
typedef OnChooseCallback<T> = void Function([T? result]);
