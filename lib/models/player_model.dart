import 'package:json_annotation/json_annotation.dart';
import 'character_model.dart';

part 'player_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Player {
  Player (
      this.playerId,
      this.playerSetCount,
      this.playerChars,
      this.playerNotes
      );

  @JsonKey(name: 'id')
  String playerId;

  @JsonKey(name: 'setCount')
  String playerSetCount;

  @JsonKey(name: 'characters')
  Characters playerChars;

  @JsonKey(name: 'notes')
  String playerNotes;

  factory Player.fromJson (Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

}