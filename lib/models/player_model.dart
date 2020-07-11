class Player {
  String playerId;
  String playerSetCount;
  List<String> playerChars;
  String playerNotes;

  Player ({
    this.playerId,
    this.playerSetCount,
    this.playerChars,
    this.playerNotes
  });

  factory Player.fromJson(Map<String, dynamic> parsedJson) {
    var charsFromPlayer = parsedJson['characters'];
    List<String> charsList = charsFromPlayer.cast<String>();
    return Player (
        playerId: parsedJson['id'],
        playerSetCount: parsedJson['setCount'],
        playerChars: charsList,
        playerNotes: parsedJson['notes']
    );
  }

}