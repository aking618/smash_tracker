class Player {
  String playerId;
  String playerSetCount;
  Characters playerChars;
  String playerNotes;

  Player ({
    this.playerId,
    this.playerSetCount,
    this.playerChars,
    this.playerNotes
  });

  factory Player.fromJson(Map<String, dynamic> parsedJson) {
    return Player (
        playerId: parsedJson['id'],
        playerSetCount: parsedJson['setCount'],
        playerChars: Characters.fromJson(parsedJson['characters']),
        playerNotes: parsedJson['notes']
    );
  }

}

class Characters {
  String char1;
  String char2;

  Characters({this.char1, this.char2});

  factory Characters.fromJson(Map<String, dynamic> parsedJson) {
    return new Characters(
      char1: parsedJson['char1'],
      char2: parsedJson['char2']
    );
  }
}