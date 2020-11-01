import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/model/pokemon_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Pokedex pokedex;

  Future<Pokedex> data;
  Future<Pokedex> _getPokemons() async {
    final response = await http.get(url);
    var jsonData = json.decode(response.body);
    pokedex = Pokedex.fromJson(jsonData);
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = _getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokemon App"),
          elevation: 3,
        ),
        body: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<Pokedex> gelenPokedex) {
              if (gelenPokedex.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Hero(
                            tag: gelenPokedex.data.pokemon[index].img,
                            child: Card(
                              elevation: 5,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    height: 120,
                                    width: 130,
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/24.gif",
                                      image:
                                          gelenPokedex.data.pokemon[index].img,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(gelenPokedex.data.pokemon[index].name),
                                ],
                              ),
                            )),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PokemonDetail(
                                    pokemon: gelenPokedex.data.pokemon[index],
                                  )));
                        },
                      );
                    });
              }
            }));
  }
}
