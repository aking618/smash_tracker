import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class AddPlayer extends StatefulWidget {
  @override
  _AddPlayerState createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {

  String _myActivity;
  String _myActivityResult;
  final formkey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formkey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Player'),
      ),
      body: Center(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: DropDownFormField(
                titleText: 'Character One',
                hintText: 'Choose One',
                value: _myActivity,
                onSaved: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _myActivity = value;
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
            Container(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                child: Text('Save'),
                onPressed: _saveForm,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(_myActivityResult),
            )
          ],
        ),
      ),
    );
  }
}

