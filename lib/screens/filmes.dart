// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/filmes.dart';
import '../models/favorites.dart';
import 'favorites.dart';

class TelaFilmes extends StatelessWidget {
  static String routeName = '/home';

  const TelaFilmes({super.key, required this.filmes});
  final List<Filmes> filmes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filmes.length,
      cacheExtent: 20.0,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) => ItemTile(filmes[index]),
    );
  }
}

class ItemTile extends StatelessWidget {
  final Filmes item;

  const ItemTile(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<Favorites>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          item.title,
          key: Key('text_$item.release_date'),
        ),
        trailing: IconButton(
          key: Key('icon_$item.release_date'),
          icon: favoritesList.items.contains(item.title)
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            !favoritesList.items.contains(item.title)
                ? favoritesList.add(item.title)
                : favoritesList.remove(item.title);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(favoritesList.items.contains(item.title)
                    ? 'Added to favorites.'
                    : 'Removed from favorites.'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
