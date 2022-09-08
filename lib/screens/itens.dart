import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorites.dart';

class TelaItens extends StatelessWidget {
  static String routeName = '/home';

  const TelaItens({super.key, required this.itens, required this.origem});
  final List<String> itens;
  final bool origem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itens.length,
      cacheExtent: 20.0,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) =>
          ItemTile(Favorite(texto: itens[index], origem: origem)),
    );
  }
}

class ItemTile extends StatelessWidget {
  final Favorite itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<Favorites>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          itemNo.texto,
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
