import 'dart:math';
import 'package:flutter/material.dart';
import 'package:guess_number/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  var game = Game();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('GUESS THE NUMBER')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                border: Border.all(width: 5.0, color: Colors.blue),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(2.0, 5.0),
                      blurRadius: 5.0,
                      spreadRadius: 2.0)
                ]),
            //alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      left: 120,
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                          ),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 100,
                              ),
                              child: Text(
                                'GUESS',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 80.0, color: Color(0xFF0A44BA)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.only(
                          top: 0,
                        ),
                        child: Image.asset(
                          'assets/images/guess_logo.png',
                          width: 170.0,
                          height: 170.0,
                        ),
                      )),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              bottom: 100,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 0,
                              ),
                              child: Text(
                                'THE NUMBER',
                                style: TextStyle(
                                    fontSize: 30.0, color: Color(0xFF5AD70D)),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 250,
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(),
                          hintText: 'ทายเลขตั้งแต่ 1 ถึง 100',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                    ),
                    child: Center(
                      child: ElevatedButton(
                        child: Text('GUESS'),
                        onPressed: () {

                            var input = _controller.text;
                            var guess = int.tryParse(input);

                            if (guess == null) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('RESULT'),
                                      content: Text(
                                          "กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น"),
                                      actions: [
                                        TextButton(onPressed: () {
                                          Navigator.of(context).pop();
                                        }, child: Text('OK'))
                                      ],
                                    );
                                  });
                            }
                            if (guess != null) {
                              var result = game.DoGuess(guess);
                              var Counting = game.DoCount(guess);
                              if (result == 0) {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('RESULT'),
                                        content: Text(
                                            "$guess ถูกต้องแล้วคร้าบบบ คุณทายไปทั้งหมด $Counting ครั้ง"),
                                        actions: [
                                          TextButton(onPressed: () {
                                            Navigator.of(context).pop();
                                          }, child: Text('OK'))
                                        ],
                                      );
                                    });
                                //count++;
                              }
                              else if (guess != 0) {
                                if (result == -1) {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('RESULT'),
                                          content: Text(
                                              "$guess น้อยเกินไป ได้โปรดทายอีกครั้ง"),
                                          actions: [
                                            TextButton(onPressed: () {
                                              Navigator.of(context).pop();
                                            }, child: Text('OK'))
                                          ],
                                        );
                                      });
                                }
                                else if (result == 1) {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('RESULT'),
                                          content: Text(
                                              "$guess มากเกินไป ได้โปรดทายอีกครั้ง"),
                                          actions: [
                                            TextButton(onPressed: () {
                                              Navigator.of(context).pop();
                                            }, child: Text('OK'))
                                          ],
                                        );
                                      });
                                }

                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
