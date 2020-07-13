// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
    json['id'] as String,
    json['setCount'] as String,
    json['characters'] == null
        ? null
        : Characters.fromJson(json['characters'] as Map<String, dynamic>),
    json['notes'] as String,
  );
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.playerId,
      'setCount': instance.playerSetCount,
      'characters': instance.playerChars?.toJson(),
      'notes': instance.playerNotes,
    };
