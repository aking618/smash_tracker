import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:smash_tracker/models/character_model.dart';
import 'package:smash_tracker/models/player_model.dart';
import 'package:smash_tracker/models/playerlist_model.dart';
import 'package:smash_tracker/services/json_storage_services.dart';
import 'package:smash_tracker/services/playerlist_services.dart';
import 'dart:convert';

class AddPlayer extends StatefulWidget {
  @override
  _AddPlayerState createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {

  String _myChar1;
  String _myChar1Result;
  String _myChar2;
  String _myChar2Result;
  String playerName;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey1 =  GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 =  GlobalKey<FormState>();

  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _myChar1 = '';
    _myChar1Result = '';
    _myChar2 = '';
    _myChar2Result = '';
  }

  void _saveForm() async {
      setState(() {
        _myChar1Result = _myChar1;
        _myChar2Result = _myChar2;
      });

      Player newPlayer = new Player("$playerName", "0 - 0",
          new Characters(_myChar1Result, _myChar2Result), "");
      playerList.players.add(newPlayer);

      if (playerList.players[0].playerId == "Filler Character") {
        playerList.players.removeAt(0);
      }

      await writePlayerData(playerList);
      playerList = await readPlayerData();

      Navigator.popAndPushNamed(context, '/home', arguments: playerList);
  }

  @override
  Widget build(BuildContext context) {

    PlayerList playerList = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Add Player'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'RandomSmasher47', labelText: 'Player Tag'),
                controller: textController,
                keyboardType: TextInputType.text,
                validator: (value) =>
                  value.isEmpty ? "Please enter a Player Tag" : null,
                onSaved: (String value) {
                  playerName = value;
                },
                onChanged: (String value) {
                  playerName = value;
                },
              ),
            ),
            Form(
              key: formKey1,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: DropDownFormField(
                  titleText: 'First Character',
                  hintText: 'Choose One',
                  value: _myChar1,
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Please Select a Character';
//                    }
//                  },
                  onSaved: (value) {
                    setState(() {
                      _myChar1 = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myChar1 = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Banjo & Kazooie",
                      "value": "banjo_and_kazooie",
                    },
                    {
                      "display": "Bayonetta",
                      "value": "bayonetta",
                    },
                    {
                      "display": "Bowser",
                      "value": "bowser",
                    },
                    {
                      "display": "Bowser Jr.",
                      "value": "bowser_jr",
                    },
                    {
                      "display": "Byleth",
                      "value": "byleth",
                    },
                    {
                      "display": "Captain Falcon",
                      "value": "captain_falcon",
                    },
                    {
                      "display": "Chrom",
                      "value": "chrom",
                    },
                    {
                      "display": "Cloud",
                      "value": "cloud",
                    },
                    {
                      "display": "Corrin",
                      "value": "corrin",
                    },
                    {
                      "display": "Daisy",
                      "value": "daisy",
                    },
                    {
                      "display": "Dark Pit",
                      "value": "dark_pit",
                    },
                    {
                      "display": "Dark Samus",
                      "value": "dark_samus",
                    },
                    {
                      "display": "Diddy Kong",
                      "value": "diddy_kong",
                    },
                    {
                      "display": "Donkey Kong",
                      "value": "donkey_kong",
                    },
                    {
                      "display": "Dr. Mario",
                      "value": "dr_mario",
                    },
                    {
                      "display": "Duck Hunt",
                      "value": "duck_hunt",
                    },
                    {
                      "display": "Falco",
                      "value": "falco",
                    },
                    {
                      "display": "Fox",
                      "value": "fox",
                    },
                    {
                      "display": "Ganondorf",
                      "value": "ganondorf",
                    },
                    {
                      "display": "Greninja",
                      "value": "greninja",
                    },
                    {
                      "display": "Hero",
                      "value": "hero",
                    },
                    {
                      "display": "Ice Climbers",
                      "value": "ice_climbers",
                    },
                    {
                      "display": "Ike",
                      "value": "ike",
                    },
                    {
                      "display": "Incineroar",
                      "value": "incineroar",
                    },
                    {
                      "display": "Inkling",
                      "value": "inkling",
                    },
                    {
                      "display": "Isabelle",
                      "value": "isabelle",
                    },
                    {
                      "display": "Jigglypuff",
                      "value": "jigglypuff",
                    },
                    {
                      "display": "Joker",
                      "value": "joker",
                    },
                    {
                      "display": "Ken",
                      "value": "ken",
                    },
                    {
                      "display": "King Dedede",
                      "value": "king_dedede",
                    },
                    {
                      "display": "King K. Rool",
                      "value": "king_k_rool",
                    },
                    {
                      "display": "Kirby",
                      "value": "kirby",
                    },
                    {
                      "display": "Link",
                      "value": "link",
                    },
                    {
                      "display": "Little Mac",
                      "value": "little_mac",
                    },
                    {
                      "display": "Lucario",
                      "value": "ludcario",
                    },
                    {
                      "display": "Lucas",
                      "value": "lucas",
                    },
                    {
                      "display": "Lucina",
                      "value": "lucina",
                    },
                    {
                      "display": "Luigi",
                      "value": "luigi",
                    },
                    {
                      "display": "Mario",
                      "value": "mario",
                    },
                    {
                      "display": "Marth",
                      "value": "marth",
                    },
                    {
                      "display": "Mega Man",
                      "value": "mega_man",
                    },
                    {
                      "display": "Meta Knight",
                      "value": "meta_knight",
                    },
                    {
                      "display": "Mewtwo",
                      "value": "mewtwo",
                    },
                    {
                      "display": "Mii Brawler",
                      "value": "mii_brawler",
                    },
                    {
                      "display": "Mii Gunner",
                      "value": "mii_gunner",
                    },
                    {
                      "display": "Mii Swordfighter",
                      "value": "mii_swordfighter",
                    },
                    {
                      "display": "Min Min",
                      "value": "min_min",
                    },
                    {
                      "display": "Mr. Game & Watch",
                      "value": "mr_game_and_watch",
                    },
                    {
                      "display": "Ness",
                      "value": "ness",
                    },
                    {
                      "display": "Olimar",
                      "value": "olimar",
                    },
                    {
                      "display": "Pac-Man",
                      "value": "pac_man",
                    },
                    {
                      "display": "Palutena",
                      "value": "Palutena",
                    },
                    {
                      "display": "Peach",
                      "value": "peach",
                    },
                    {
                      "display": "Pichu",
                      "value": "pichu",
                    },
                    {
                      "display": "Pikachu",
                      "value": "pikachu",
                    },
                    {
                      "display": "Piranha Plant",
                      "value": "piranha_plant",
                    },
                    {
                      "display": "Pit",
                      "value": "pit",
                    },
                    {
                      "display": "Pokemon Trainer",
                      "value": "pokemon_trainer",
                    },
                    {
                      "display": "Richter",
                      "value": "richter",
                    },
                    {
                      "display": "Ridley",
                      "value": "ridley",
                    },
                    {
                      "display": "R.O.B.",
                      "value": "rob",
                    },
                    {
                      "display": "Robin",
                      "value": "robin",
                    },
                    {
                      "display": "Rosalina & Luma",
                      "value": "rosalina_and_luma",
                    },
                    {
                      "display": "Roy",
                      "value": "roy",
                    },
                    {
                      "display": "Ryu",
                      "value": "ryu",
                    },
                    {
                      "display": "Samus",
                      "value": "samus",
                    },
                    {
                      "display": "Sheik",
                      "value": "sheik",
                    },
                    {
                      "display": "Shulk",
                      "value": "shulk",
                    },
                    {
                      "display": "Simon",
                      "value": "simon",
                    },
                    {
                      "display": "Snake",
                      "value": "snake",
                    },
                    {
                      "display": "Sonic",
                      "value": "sonic",
                    },
                    {
                      "display": "Terry",
                      "value": "terry",
                    },
                    {
                      "display": "Toon Link",
                      "value": "toon_link",
                    },
                    {
                      "display": "Villager",
                      "value": "villager",
                    },
                    {
                      "display": "Wario",
                      "value": "wario",
                    },
                    {
                      "display": "Wii Fit Trainer",
                      "value": "wii_fit_trainer",
                    },
                    {
                      "display": "Wolf",
                      "value": "wolf",
                    },
                    {
                      "display": "Yoshi",
                      "value": "yoshi",
                    },
                    {
                      "display": "Young Link",
                      "value": "young_link",
                    },
                    {
                      "display": "Zelda",
                      "value": "zelda",
                    },
                    {
                      "display": "Zero Suit Samus",
                      "value": "zero_suit_samus",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
            ),
            Form(
              child: Container(
                key: formKey2,
                padding: EdgeInsets.all(16.0),
                child: DropDownFormField(
                  textField: 'display',titleText: 'Second Character',
                  hintText: 'Choose One',
                  value: _myChar2,
                  onSaved: (value) {
                    setState(() {
                      _myChar2 = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myChar2 = value;
                    });
                  },
                  dataSource: [
                    {
                      "display":"None",
                      "value": "",
                    },
                    {
                      "display": "Banjo & Kazooie",
                      "value": "banjo_and_kazooie",
                    },
                    {
                      "display": "Bayonetta",
                      "value": "bayonetta",
                    },
                    {
                      "display": "Bowser",
                      "value": "bowser",
                    },
                    {
                      "display": "Bowser Jr.",
                      "value": "bowser_jr",
                    },
                    {
                      "display": "Byleth",
                      "value": "byleth",
                    },
                    {
                      "display": "Captain Falcon",
                      "value": "captain_falcon",
                    },
                    {
                      "display": "Chrom",
                      "value": "chrom",
                    },
                    {
                      "display": "Cloud",
                      "value": "cloud",
                    },
                    {
                      "display": "Corrin",
                      "value": "corrin",
                    },
                    {
                      "display": "Daisy",
                      "value": "daisy",
                    },
                    {
                      "display": "Dark Pit",
                      "value": "dark_pit",
                    },
                    {
                      "display": "Dark Samus",
                      "value": "dark_samus",
                    },
                    {
                      "display": "Diddy Kong",
                      "value": "diddy_kong",
                    },
                    {
                      "display": "Donkey Kong",
                      "value": "donkey_kong",
                    },
                    {
                      "display": "Dr. Mario",
                      "value": "dr_mario",
                    },
                    {
                      "display": "Duck Hunt",
                      "value": "duck_hunt",
                    },
                    {
                      "display": "Falco",
                      "value": "falco",
                    },
                    {
                      "display": "Fox",
                      "value": "fox",
                    },
                    {
                      "display": "Ganondorf",
                      "value": "ganondorf",
                    },
                    {
                      "display": "Greninja",
                      "value": "greninja",
                    },
                    {
                      "display": "Hero",
                      "value": "hero",
                    },
                    {
                      "display": "Ice Climbers",
                      "value": "ice_climbers",
                    },
                    {
                      "display": "Ike",
                      "value": "ike",
                    },
                    {
                      "display": "Incineroar",
                      "value": "incineroar",
                    },
                    {
                      "display": "Inkling",
                      "value": "inkling",
                    },
                    {
                      "display": "Isabelle",
                      "value": "isabelle",
                    },
                    {
                      "display": "Jigglypuff",
                      "value": "jigglypuff",
                    },
                    {
                      "display": "Joker",
                      "value": "joker",
                    },
                    {
                      "display": "Ken",
                      "value": "ken",

                    },
                    {
                      "display": "King Dedede",
                      "value": "king_dedede",
                    },
                    {
                      "display": "King K. Rool",
                      "value": "king_k_rool",
                    },
                    {
                      "display": "Kirby",
                      "value": "kirby",
                    },
                    {
                      "display": "Link",
                      "value": "link",
                    },
                    {
                      "display": "Little Mac",
                      "value": "little_mac",
                    },
                    {
                      "display": "Lucario",
                      "value": "ludcario",
                    },
                    {
                      "display": "Lucas",
                      "value": "lucas",
                    },
                    {
                      "display": "Lucina",
                      "value": "lucina",
                    },
                    {
                      "display": "Luigi",
                      "value": "luigi",
                    },
                    {
                      "display": "Mario",
                      "value": "mario",
                    },
                    {
                      "display": "Marth",
                      "value": "marth",
                    },
                    {
                      "display": "Mega Man",
                      "value": "mega_man",
                    },
                    {
                      "display": "Meta Knight",
                      "value": "meta_knight",
                    },
                    {
                      "display": "Mewtwo",
                      "value": "mewtwo",
                    },
                    {
                      "display": "Mii Brawler",
                      "value": "mii_brawler",
                    },
                    {
                      "display": "Mii Gunner",
                      "value": "mii_gunner",
                    },
                    {
                      "display": "Mii Swordfighter",
                      "value": "mii_swordfighter",
                    },
                    {
                      "display": "Min Min",
                      "value": "min_min",
                    },
                    {
                      "display": "Mr. Game & Watch",
                      "value": "mr_game_and_watch",
                    },
                    {
                      "display": "Ness",
                      "value": "ness",
                    },
                    {
                      "display": "Olimar",
                      "value": "olimar",
                    },
                    {
                      "display": "Pac-Man",
                      "value": "pac_man",
                    },
                    {
                      "display": "Palutena",
                      "value": "Palutena",
                    },
                    {
                      "display": "Peach",
                      "value": "peach",
                    },
                    {
                      "display": "Pichu",
                      "value": "pichu",
                    },
                    {
                      "display": "Pikachu",
                      "value": "pikachu",
                    },
                    {
                      "display": "Piranha Plant",
                      "value": "piranha_plant",
                    },
                    {
                      "display": "Pit",
                      "value": "pit",
                    },
                    {
                      "display": "Pokemon Trainer",
                      "value": "pokemon_trainer",
                    },
                    {
                      "display": "Richter",
                      "value": "richter",
                    },
                    {
                      "display": "Ridley",
                      "value": "ridley",
                    },
                    {
                      "display": "R.O.B.",
                      "value": "rob",
                    },
                    {
                      "display": "Robin",
                      "value": "robin",
                    },
                    {
                      "display": "Rosalina & Luma",
                      "value": "rosalina_and_luma",
                    },
                    {
                      "display": "Roy",
                      "value": "roy",
                    },
                    {
                      "display": "Ryu",
                      "value": "ryu",
                    },
                    {
                      "display": "Samus",
                      "value": "samus",
                    },
                    {
                      "display": "Sheik",
                      "value": "sheik",
                    },
                    {
                      "display": "Shulk",
                      "value": "shulk",
                    },
                    {
                      "display": "Simon",
                      "value": "simon",
                    },
                    {
                      "display": "Snake",
                      "value": "snake",
                    },
                    {
                      "display": "Sonic",
                      "value": "sonic",
                    },
                    {
                      "display": "Terry",
                      "value": "terry",
                    },
                    {
                      "display": "Toon Link",
                      "value": "toon_link",
                    },
                    {
                      "display": "Villager",
                      "value": "villager",
                    },
                    {
                      "display": "Wario",
                      "value": "wario",
                    },
                    {
                      "display": "Wii Fit Trainer",
                      "value": "wii_fit_trainer",
                    },
                    {
                      "display": "Wolf",
                      "value": "wolf",
                    },
                    {
                      "display": "Yoshi",
                      "value": "yoshi",
                    },
                    {
                      "display": "Young Link",
                      "value": "young_link",
                    },
                    {
                      "display": "Zelda",
                      "value": "zelda",
                    },
                    {
                      "display": "Zero Suit Samus",
                      "value": "zero_suit_samus",
                    },
                  ],
                  valueField: 'value',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                child: Text('Save'),
                onPressed: _saveForm,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text('$_myChar1Result $_myChar2Result'),
            ),
            FloatingActionButton(
              onPressed: () {
                print('tag: $playerName myChar1: $_myChar1Result, myChar2: $_myChar2Result');
              },
            )
          ],
        ),
      ),
    );
  }


}

