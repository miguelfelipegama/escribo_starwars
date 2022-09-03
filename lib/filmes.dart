/*
 * Copyright 2019 Google LLC
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     https://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'filmes.g.dart';

@JsonSerializable()
class Filmes {
  Filmes({
    required this.title,
    required this.release_date,
  });

  factory Filmes.fromJson(Map<String, dynamic> json) => _$FilmesFromJson(json);
  Map<String, dynamic> toJson() => _$FilmesToJson(this);
  String title;
  String release_date;
}

@JsonSerializable()
class Personagem {
  Personagem({
    required this.name,
    required this.birth_year,
  });

  factory Personagem.fromJson(Map<String, dynamic> json) =>
      _$PersonagemFromJson(json);
  Map<String, dynamic> toJson() => _$PersonagemToJson(this);
  String name;
  String birth_year;
}

@JsonSerializable()
class FilmesAPI {
  FilmesAPI({
    required this.results,
  });

  factory FilmesAPI.fromJson(Map<String, dynamic> json) =>
      _$FilmesAPIFromJson(json);
  Map<String, dynamic> toJson() => _$FilmesAPIToJson(this);

  final List<Filmes> results;
}

Future<FilmesAPI> getFilmes() async {
  const googleLocationsURL = 'https://swapi.dev/api/films/';

  // Retrieve the locations of Google offices
  try {
    final response = await http.get(Uri.parse(googleLocationsURL));
    if (response.statusCode == 200) {
      return FilmesAPI.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
