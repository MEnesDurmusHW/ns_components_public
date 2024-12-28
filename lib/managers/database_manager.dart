part of ns_components;

final databaseManager = DatabaseManager._();

class DatabaseManager {
  DatabaseManager._();

  late Database database;

  Future<String> get databasePath async => path.join(await getDatabasesPath(), 'goal_module_database.db');

  Future<void> init(Set<CreateDatabaseFunction> repositoryCreaters, [int version = 0]) async {
    try {
      database = await openDatabase(
        await databasePath,
        version: version,
      );
      await createTables(
        database,
        version,
        repositoryCreaters,
      );
    } catch (e) {
      logger.log(e);
    }
  }

  Future<void> createTables(Database db, int version, Set<CreateDatabaseFunction> repositoryCreaters) async {
    for (CreateDatabaseFunction fn in repositoryCreaters) {
      try {
        await fn(db, version);
      } catch (e) {
        if (e.toString().contains('already exists')) return;
        logger.log(e);
      }
    }
  }
}
