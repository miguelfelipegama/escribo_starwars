// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorites.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Favorites>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.items.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => FavoriteItemTile(value.items[index]),
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final Favorite itemNo;

  const FavoriteItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: itemNo.origem
            ? Colors.green.withAlpha(50)
            : Colors.red.withAlpha(50),
        title: Text(
          itemNo.texto,
          key: Key('favorites_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$itemNo'),
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<Favorites>(context, listen: false).remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed from favorites.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
