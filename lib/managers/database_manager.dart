part of ns_components;

final databaseManager = DatabaseManager._();

class DatabaseManager {
  DatabaseManager._();

  late Database database;

  Future<String> getDatabasePath(String name) async => path.join(await getDatabasesPath(), '$name.db');

  Future<void> init(
    Set<CreateDatabaseFunction> repositoryCreaters, [
    int version = 1,
    String name = 'ns',
  ]) async {
    try {
      database = await openDatabase(
        await getDatabasePath(name),
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
        if (e.toString().contains('already exists')) continue;
        logger.log(e);
      }
    }
  }
}
