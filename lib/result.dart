import 'package:color_mixer/high_scores.dart';
import 'package:color_mixer/home.dart';
import 'package:color_mixer/in-game.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultPage extends StatefulWidget {
  final int score, totalTimePlayed;

  const ResultPage({super.key, this.score = 0, this.totalTimePlayed = 0});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Final Score : 999999',
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Total time played: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Color mixed: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Average guesses: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Hint used: ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                width: 150,
                height: 35,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => InGame())),
                  child: const Text("PLAY AGAIN"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                width: 150,
                height: 35,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HighScorePage())),
                  child: const Text("HIGH SCORE"),
                ),
              ),
              Container(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage())),
                  child: const Text("MENU"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
