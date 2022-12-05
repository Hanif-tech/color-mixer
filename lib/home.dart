// ignore_for_file: prefer_const_constructors

import 'package:color_mixer/high_scores.dart';
import 'package:flutter/material.dart';
import 'package:color_mixer/in-game.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String name, pass;

  const HomePage({super.key, this.name = '', this.pass = ''});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  play() async {
    final localStorage = await SharedPreferences.getInstance();

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => InGame()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Color Mixer"),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 5),
                  child: SizedBox(
                    child: Text(
                      "Welcome, ${widget.name}!",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    child: Text(
                      "The goal of this game is to produce the exact color as shown within a time limit. Provide the red, green, and blue values (0 to 255), then press the Guess Color button to answer. Your score is determined by the remaining time. When the time is up, then it's game over! See if you can reach top 5!",
                      style: TextStyle(fontSize: 20, height: 2),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                  ),
                  onPressed: () => play(),
                  child: Text('Play Game'),
                )
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(
                  child: Text(
                    "${widget.name}",
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  alignment: Alignment.bottomLeft,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('High Score'),
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HighScorePage())),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log out'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
