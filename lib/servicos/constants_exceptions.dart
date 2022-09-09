const idColumn = 'id';
const favTextColumn = 'texto';
const favTypeColumn = 'tipo';
const avatarColumn = 'avatar';
const dbName = 'starwars.db';
const tabelaFavoritos = 'favoritos';
const tabelaAvatar = 'avatar';
const criarTabelaAvatar = '''CREATE TABLE IF NOT EXISTS "avatar" (
        "id" INTEGER NOT NULL,
        "avatar" TEXT NOT NULL UNIQUE,
        PRIMARY KEY("id" AUTOINCREMENT)
      ); ''';
const criarTabelaFavoritos = ''' CREATE TABLE IF NOT EXISTS "favoritos" (
         "id"	INTEGER NOT NULL,
         "texto"	TEXT NOT NULL,
         "tipo"	INTEGER NOT NULL DEFAULT 0,
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
