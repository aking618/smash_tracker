// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerList _$PlayerListFromJson(Map<String, dynamic> json) {
  return PlayerList(
    (json['players'] as List)
        ?.map((e) =>
            e == null ? null : Player.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PlayerListToJson(PlayerList instance) =>
    <String, dynamic>{
      'players': instance.players?.map((e) => e?.toJson())?.toList(),
    };
