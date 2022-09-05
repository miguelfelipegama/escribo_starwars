// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/personagens.dart';
import '../models/favorites.dart';

class TelaPersonagens extends StatelessWidget {
  static String routeName = '/home';

  const TelaPersonagens({super.key, required this.personagens});
  final List<Personagem> personagens;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: personagens.length,
      cacheExtent: 20.0,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) => ItemTile(personagens[index].name),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<Favorites>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          itemNo,
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: favoritesList.items.contains(itemNo)
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            !favoritesList.items.contains(itemNo)
                ? favoritesList.add(itemNo)
                : favoritesList.remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(favoritesList.items.contains(itemNo)
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
