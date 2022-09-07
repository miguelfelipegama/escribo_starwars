// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/filmes.dart';
import 'package:testing_app/models/personagens.dart';
import 'package:testing_app/screens/editor_fluttermoji.dart';
import 'package:testing_app/screens/itens.dart';
import 'package:testing_app/screens/webview.dart';
import 'models/favorites.dart';
import 'screens/favorites.dart';

void main() async {
  final filmes = await getFilmes().then((value) => value.results);
  final List<String> filmesString = [];
  for (var element in filmes) {
    filmesString.add(element.title);
  }
  final personagens = await getPersonagens().then((value) => value.results);
  final List<String> presonagensString = [];
  for (var element in personagens) {
    presonagensString.add(element.name);
  }
  runApp(StarWarsApp(filmes: filmesString, personagens: presonagensString));
}

class StarWarsApp extends StatelessWidget {
  const StarWarsApp(
      {super.key, required this.filmes, required this.personagens});

  final List<String> filmes;
  final List<String> personagens;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Star Wars Escribo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        routes: {
          TelaItens.routeName: (context) => TelaItens(
                itens: filmes,
                origem: true,
              ),
          FavoritesPage.routeName: (context) => const FavoritesPage(),
        },
        home: Builder(builder: (context) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    icon: FluttermojiCircleAvatar(),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const EmojiEditor()));
                    },
                  )
                ],
                leading: IconButton(
                  icon: const Icon(Icons.web),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const WebViewApp()));
                  },
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.movie_filter_rounded), text: 'Filmes'),
                    Tab(
                      icon: Icon(Icons.person),
                      text: 'Personagens',
                    ),
                    Tab(
                      icon: Icon(Icons.favorite_rounded),
                      text: 'Favoritos',
                    ),
                  ],
                ),
                title: const Text('Lista Star Wars'),
              ),
              body: TabBarView(
                children: [
                  TelaItens(itens: filmes, origem: false),
                  TelaItens(itens: personagens, origem: true),
                  const FavoritesPage(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
