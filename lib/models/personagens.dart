import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'personagens.g.dart';

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
class PersonagemAPI {
  PersonagemAPI({
    required this.results,
  });

  factory PersonagemAPI.fromJson(Map<String, dynamic> json) =>
      _$PersonagemAPIFromJson(json);
  Map<String, dynamic> toJson() => _$PersonagemAPIToJson(this);

  final List<Personagem> results;
}

Future<PersonagemAPI> getPersonagens() async {
  const targetURL = 'https://swapi.dev/api/people/';

  // Retrieve the locations of Google offices
  try {
    final response = await http.get(Uri.parse(targetURL));
    if (response.statusCode == 200) {
      return PersonagemAPI.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  return PersonagemAPI.fromJson(
    json.decode(
      await rootBundle.loadString('assets/people.json'),
    ) as Map<String, dynamic>,
  );
}
