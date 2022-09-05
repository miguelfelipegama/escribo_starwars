// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filmes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filmes _$FilmesFromJson(Map<String, dynamic> json) => Filmes(
      title: json['title'] as String,
      release_date: json['release_date'] as String,
    );

Map<String, dynamic> _$FilmesToJson(Filmes instance) => <String, dynamic>{
      'title': instance.title,
      'release_date': instance.release_date,
    };

FilmesAPI _$FilmesAPIFromJson(Map<String, dynamic> json) => FilmesAPI(
      results: (json['results'] as List<dynamic>)
          .map((e) => Filmes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilmesAPIToJson(FilmesAPI instance) => <String, dynamic>{
      'results': instance.results,
    };
