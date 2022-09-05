// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personagens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Personagem _$PersonagemFromJson(Map<String, dynamic> json) => Personagem(
      name: json['name'] as String,
      birth_year: json['birth_year'] as String,
    );

Map<String, dynamic> _$PersonagemToJson(Personagem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birth_year': instance.birth_year,
    };

PersonagemAPI _$PersonagemAPIFromJson(Map<String, dynamic> json) =>
    PersonagemAPI(
      results: (json['results'] as List<dynamic>)
          .map((e) => Personagem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonagemAPIToJson(PersonagemAPI instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
