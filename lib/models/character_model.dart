import 'package:json_annotation/json_annotation.dart';
part 'character_model.g.dart';

@JsonSerializable()
class Characters {
  Characters(this.char1, this.char2);

  @JsonKey(name: 'char1')
  String char1;

  @JsonKey(name: 'char2')
  String char2;

  factory Characters.fromJson (Map<String, dynamic> json) => _$CharactersFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersToJson(this);

}

String characterToJson (Characters characters) {
  String playerCharacters = '{"char1": "${characters.char1}",'
      '"char2": "${characters.char2}"},';

  return playerCharacters;
}