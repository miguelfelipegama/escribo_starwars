const idColumn = 'id';
const emailColumn = 'email';
const userIdColumn = 'user_id';
const textColumn = 'text';
const isSyncedtoCloudColumn = 'is_synced_with_cloud';
const dbName = 'notes.db';
const noteTable = 'note';
const userTable = 'user';
const createUserTable = '''CREATE TABLE IF NOT EXISTS "user" (
        "id" INTEGER NOT NULL,
        "email" TEXT NOT NULL UNIQUE,
        PRIMARY KEY("id" AUTOINCREMENT)
      ); ''';
const createNoteTable = ''' CREATE TABLE IF NOT EXISTS "note" (
         "id"	INTEGER NOT NULL,
         "user_id"	INTEGER NOT NULL,
         "text"	TEXT,
         "is_synced_with_cloud"	INTEGER NOT NULL DEFAULT 0,
         FOREIGN KEY("user_id") REFERENCES "user"("id"),
         PRIMARY KEY("id" AUTOINCREMENT)
       ); ''';

class DatabaseAlreadyOpenException implements Exception {}

class DatabaseNotOpenException implements Exception {}

class UnableToGetDocumentsDirectoryException implements Exception {}

class CouldNotDeleteUser implements Exception {}

class CouldNotDeleteNote implements Exception {}

class CouldNotFindUser implements Exception {}

class CouldNotFindNote implements Exception {}

class CouldNotUpdateNote implements Exception {}

class UserAlreadyExists implements Exception {}

class UserShouldBeSet implements Exception {}
