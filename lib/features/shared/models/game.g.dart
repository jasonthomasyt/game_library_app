// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Game _$$_GameFromJson(Map<String, dynamic> json) => _$_Game(
      id: json['id'] as int?,
      title: json['name'] as String?,
      thumbnail: json['background_image'] as String?,
      description: json['description'] as String?,
      metacriticScore: json['metacritic'] as int?,
    );

Map<String, dynamic> _$$_GameToJson(_$_Game instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'background_image': instance.thumbnail,
      'description': instance.description,
      'metacritic': instance.metacriticScore,
    };
