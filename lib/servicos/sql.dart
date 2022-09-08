import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory, MissingPlatformDirectoryException;
import 'package:path/path.dart' show join;
import 'package:testing_app/models/favorites.dart';
import 'constants_exceptions.dart';

class FavoritestesService {
  Database? _db;

  List<Favorite> _favorites = [];

  String _avatarString = "";

  late final StreamController<List<Favorite>> _favoritesStreamController;

  static final FavoritestesService _shared =
      FavoritestesService._sharedIsntance();

  factory FavoritestesService() => _shared;

  FavoritestesService._sharedIsntance() {
    _favoritesStreamController = StreamController<List<Favorite>>.broadcast(
      onListen: () {
        _favoritesStreamController.sink.add(_favorites);
      },
    );
  }

  Stream<List<Favorite>> get todosFavoritos =>
      _favoritesStreamController.stream;

  Future<void> _cacheNotes() async {
    final favorites = await getAllFavorites();
    _favorites = favorites.toList();
    _favoritesStreamController.add(_favorites);
  }

  Future<Iterable<Favorite>> getAllFavorites() async {
    final db = _getDatabaseOrThrow();
    await _ensureDbIsOpen();
    final favorites = await db.query(tabelaFavoritos);
    return favorites.map((favoriteRow) => Favorite.fromRow(favoriteRow));
  }

  Future<void> deleteFavorite({required String texto}) async {
    final db = _getDatabaseOrThrow();
    await _ensureDbIsOpen();
    final deletedCount = await db.delete(
      tabelaFavoritos,
      where: 'texto = ?',
      whereArgs: [texto],
    );
    if (deletedCount != 1) {
      throw CouldNotDeleteNote();
    } else {
      _favorites.removeWhere((note) => note.texto == texto);
      _favoritesStreamController.add(_favorites);
    }
  }

  Future<Favorite> createFavorite({required Favorite favorito}) async {
    final db = _getDatabaseOrThrow();
    await _ensureDbIsOpen();
    const text = '';

    final favoriteId = await db.insert(tabelaFavoritos, {
      favTypeColumn: favorito.origem ? 1 : 0,
      favTextColumn: favorito.texto,
    });
    _favorites.add(favorito);
    _favoritesStreamController.add(_favorites);
    return favorito;
  }

  Future<void> _ensureDbIsOpen() async {
    try {
      await open();
    } on DatabaseAlreadyOpenException {
      return;
    }
  }

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenException();
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;

      await db.execute(criarTabelaAvatar);
      await db.execute(criarTabelaFavoritos);

      await _cacheNotes();
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectoryException();
    }
  }

  Future<void> close() async {
    final db = _db;

    if (db == null) {
      throw DatabaseNotOpenException();
    } else {
      await db.close();
      _db = null;
    }
  }

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseNotOpenException();
    } else {
      return db;
    }
  }
}
