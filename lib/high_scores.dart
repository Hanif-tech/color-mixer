import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HighScorePage extends StatefulWidget {
  const HighScorePage({super.key});

  @override
  State<HighScorePage> createState() => _HighScorePageState();
}

class _HighScorePageState extends State<HighScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('High Scores')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              'High Scores',
              style: TextStyle(fontSize: 35),
            ),
          ),
          // card
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Card(
              color: Colors.grey[100],
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 40,
                        color: Color.fromARGB(255, 163, 163, 163),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Koa lala',
                              style: const TextStyle(
                                fontSize: 28.0,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '9999 Pts',
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
