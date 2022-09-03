// Copyright 2020 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/favorites.dart';
import 'screens/favorites.dart';
import 'screens/home.dart';

void main() {
  runApp(const StarWarsApp());
}

class StarWarsApp extends StatelessWidget {
  const StarWarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Star Wars Escribo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          FavoritesPage.routeName: (context) => const FavoritesPage(),
        },
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
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
              title: const Text('Tabs Demo'),
            ),
            body: const TabBarView(
              children: [
                HomePage(),
                Icon(Icons.directions_bike),
                FavoritesPage(),
              ],
            ),
          ),
        ),
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
