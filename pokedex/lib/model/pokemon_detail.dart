import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;
  PokemonDetail({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokemon App"),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              height: MediaQuery.of(context).size.height / (3 / 2),
              width: MediaQuery.of(context).size.width - 20,
              top: 40,
              left: 10,
              child: Card(
                  elevation: 6,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        this.pokemon.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Height " + this.pokemon.height,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Weight " + this.pokemon.weight,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Card(
                          color: Colors.blue.shade100,
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text("Specialities"),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: pokemon.type
                            .map((e) => Chip(
                                backgroundColor: Colors.green.shade200,
                                label: Text(e.toString().substring(5))))
                            .toList(),
                      ),
                      Card(
                          color: Colors.red.shade100,
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text("Weaknesses"),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: pokemon.weaknesses
                            .map((e) => Chip(
                                backgroundColor: Colors.green.shade200,
                                label: Text(e.toString().substring(5))))
                            .toList(),
                      )
                    ],
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                  tag: this.pokemon.img,
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.network(
                      pokemon.img,
                    ),
                  )),
            )
          ],
        ));
  }
}
