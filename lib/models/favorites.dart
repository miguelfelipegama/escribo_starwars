// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.
class Favorites extends ChangeNotifier {
  final List<Favorite> _favoriteItems = [];

  List<Favorite> get items => _favoriteItems;

  void add(Favorite itemNo) {
    _favoriteItems.add(itemNo);
    notifyListeners();
  }

  void remove(Favorite itemNo) {
    _favoriteItems.remove(itemNo);
    notifyListeners();
  }
}

class Favorite {
  final String texto;
  final bool origem;

  Favorite({required this.texto, required this.origem});
}
