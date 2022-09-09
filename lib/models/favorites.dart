// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:testing_app/servicos/constants_exceptions.dart';
import 'package:testing_app/servicos/sql.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.
class Favorites extends ChangeNotifier {
  Favorites({required List<Favorite> itens}) : _favoriteItems = itens;

  final List<Favorite> _favoriteItems;

  List<Favorite> get items => _favoriteItems;

  void add(Favorite itemNo) {
    _favoriteItems.add(itemNo);
    FavoritesService().createFavorite(favorito: itemNo);
    notifyListeners();
  }

  void remove(Favorite itemNo) {
    _favoriteItems.remove(itemNo);
    FavoritesService().deleteFavorite(texto: itemNo.texto);
    notifyListeners();
  }
}

class Favorite {
  final String texto;
  final bool origem;
  Favorite.fromRow(Map<String, Object?> map)
      : texto = map[favTextColumn] as String,
        origem = (map[favTypeColumn] as int) == 1 ? true : false;
  Favorite({required this.texto, required this.origem});
  @override
  bool operator ==(covariant Favorite other) => texto == other.texto;
  @override
  int get hashCode => texto.hashCode;
}
