import 'package:json_annotation/json_annotation.dart';
import 'package:smash_tracker/models/character_model.dart';
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

String playerToJson(List<Player> players) {
  String playerString = "";

  for(int i = 0; i < players.length; i++) {
    playerString += '{"id": "${players[i].playerId}",'
        '"setCount": "${players[i].playerSetCount}",'
        '"characters": ${characterToJson(players[i].playerChars)}'
        '"notes": "${players[i].playerNotes.split('\n').join('\\n')}"}';

    if (!(i == players.length - 1)) {
      playerString += ',';
    }
  }

  return playerString;
}