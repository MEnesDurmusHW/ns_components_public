part of ns_components;

typedef CreateDatabaseFunction = Future<void> Function(Database db, int version);
