import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:color_mixer/result.dart';

class InGame extends StatefulWidget {
  const InGame({super.key});

  @override
  State<InGame> createState() => _InGameState();
}

class _InGameState extends State<InGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Mixer')),
      body: InGamePage(totalValue: 255),
    );
  }
}

class InGamePage extends StatefulWidget {
  final double totalValue;

  const InGamePage({super.key, required this.totalValue});

  @override
  State<InGamePage> createState() => _InGamePageState();
}

class _InGamePageState extends State<InGamePage> {
  int value = 125, score = 0, numberOfGuesses = 1, totalTimePlayed = 0;
  String euclideanDistance = '', time = '';
  bool _isButtonDisabled = false, hintMultiplier = false;
  Color cone = Colors.white, ctwo = Colors.white;
  var coneHexRandomColor,
      ctwoHexGuessColor,
      redRandom,
      greenRandom,
      blueRandom,
      hint;

  final redController = TextEditingController();
  final greenController = TextEditingController();
  final blueController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _randomColor();
    // _startCountDown();
  }

  @override
  void dispose() {
    redController.dispose();
    greenController.dispose();
    blueController.dispose();
    super.dispose();
  }

  void _showHint() {
    setState(() {
      // hint = coneHexRandomColor;
      // _isButtonDisabled = true;
      // value = (value / 2).toInt();
      // time = _printDuration(Duration(seconds: value));
      // hintMultiplier = true;
    });
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void _guessColor() {
    // int red = int.parse(redController.text);
    // int green = int.parse(greenController.text);
    // int blue = int.parse(blueController.text);

    // //convert to Color from user guess
    // Color tempcol = Color.fromRGBO(red, green, blue, 1);

    // // jarak euclidean
    // int r = (int.parse(redRandom) - red) * (int.parse(redRandom) - red);
    // int g = (int.parse(greenRandom) - green) * (int.parse(greenRandom) - green);
    // int b = (int.parse(blueRandom) - blue) * (int.parse(blueRandom) - blue);
    // int mix = r + g + b;
    // double d = sqrt(mix);
    // String result = '';

    // if (d == 0) {
    //   result = 'You Amazinggg!';
    // } else if (d < 16) {
    //   result = 'Almost!';
    // } else if (d >= 16 && d <= 32) {
    //   result = 'Close enough…';
    // } else if (d >= 32 && d <= 64) {
    //   result = 'You got this!';
    // } else if (d >= 64 && d <= 128) {
    //   result = 'Too Far!';
    // } else if (d > 128) {
    //   result = 'Try again!';
    // }

    // setState(() {
    //   if (d == 0) {
    //     if (numberOfGuesses < 5) {
    //       score = (1 * 5 - numberOfGuesses) * value;
    //       print(score);
    //       print(value);
    //     } else {
    //       score = 1 * 1 - numberOfGuesses * value;
    //     }
    //     _playAgain();
    //   }

    //   ctwo = tempcol;
    //   ctwoHexGuessColor = '#${tempcol.value.toRadixString(16).substring(2)}';
    //   euclideanDistance = result;
    // });
  }

  void _randomColor() {
    Random random = Random();
    Color tempcol = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    // print('#${tempcol.value.toRadixString(16)}');

    // nilai rgb dari color random
    print(
        'red : ${tempcol.red} green : ${tempcol.green} blue: ${tempcol.blue}');

    setState(() {
      cone = tempcol;

      coneHexRandomColor = '#${tempcol.value.toRadixString(16).substring(2)}';

      //mendapatkan nilai rgb dan disimpan dalam variabel
      redRandom = '${tempcol.red}';
      greenRandom = '${tempcol.green}';
      blueRandom = '${tempcol.blue}';
      print(coneHexRandomColor);
    });
  }

  void _startCountDown() {
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   if (value > 0) {
    //     setState(() {
    //       value--;
    //       time = _printDuration(Duration(seconds: value));
    //     });
    //   } else {
    //     timer.cancel();

    //     showDialog<String>(
    //       context: context,
    //       builder: (BuildContext context) => AlertDialog(
    //         title: const Text('GAME OVER'),
    //         content: const Text('Good Game Great Eyes!'),
    //         actions: <Widget>[
    //           TextButton(
    //             onPressed: () => Navigator.pushReplacement(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) => ResultPage(
    //                           score: score,
    //                           totalTimePlayed: totalTimePlayed,
    //                         ))),
    //             child: const Text('SHOW RESULT'),
    //           ),
    //         ],
    //       ),
    //     );
    //   }
    // });
  }

  void _playAgain() {
    // _randomColor();

    // redController.clear();
    // greenController.clear();
    // blueController.clear();

    // setState(() {
    //   value = 255;
    //   time = _printDuration(Duration(seconds: value));
    //   numberOfGuesses++;
    // });
  }

  void dialogGameOver(BuildContext context) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('GAME OVER'),
        content: const Text('Good Game Great Eyes!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            score: score,
                            totalTimePlayed: totalTimePlayed,
                          )));
            },
            child: const Text('SHOW RESULT'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double ratio = value / widget.totalValue;

    return Container(
      child: Row(
        children: [
          Column(
            children: [
              // progress bar
              Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        // borderRadius: BorderRadius.circular(5),
                      )),
                  Material(
                    // borderRadius: BorderRadius.circular(5),
                    child: AnimatedContainer(
                      height: 30,
                      width: MediaQuery.of(context).size.width * ratio,
                      duration: Duration(milliseconds: 100),
                      decoration: BoxDecoration(color: cone
                          // borderRadius: BorderRadius.circular(5)
                          ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Center(
                        child: Text(
                      time != ''
                          ? time
                          : _printDuration(Duration(seconds: 255)),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //score
              SizedBox(
                width: 300,
                child: Text(
                  score.toString(),
                  textAlign: TextAlign.end,
                ),
              ),

              // box color
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        child: Text("Guess this color!"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150.0,
                        width: 150.0,
                        color: cone,
                        child: Container(
                            decoration: BoxDecoration(
                                color: cone, border: Border.all(width: 3))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(hint ?? ''),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        child: Text("Your Color"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150.0,
                        width: 150.0,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: ctwo, border: Border.all(width: 3))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(ctwoHexGuessColor ?? '#ffffff'),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Text(euclideanDistance),
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: redController,
                          decoration: const InputDecoration(
                            labelText: 'Red (0-255)',
                          ),
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: greenController,
                          decoration: const InputDecoration(
                            labelText: 'Green (0-255)',
                          ),
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: blueController,
                          decoration: const InputDecoration(
                            labelText: 'Blue (0-255)',
                          ),
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () => _guessColor(),
                      child: const Text(
                        'GUESS COLOR',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _isButtonDisabled
                              ? Colors.grey[300]
                              : Colors.blue),
                      onPressed: _isButtonDisabled ? null : () => _showHint(),
                      child: const Text(
                        'SHOW HINT',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () => dialogGameOver(context),
                    // Navigator.pop(context),
                    child: const Text(
                      'Surrender',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
