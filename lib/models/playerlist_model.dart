import 'package:json_annotation/json_annotation.dart';
import 'player_model.dart';

part 'playerlist_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PlayerList {
  PlayerList (
      this.players
      );

  List<Player> players;

  factory PlayerList.fromJson (Map<String, dynamic> json) => _$PlayerListFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerListToJson(this);

}