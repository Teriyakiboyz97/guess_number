import 'dart:math';
import 'package:flutter/material.dart';

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
  const HomePage({Key? key}) : super(key: key);

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
                        padding: const EdgeInsets.all(0),
                        child: Padding(
                          padding: const EdgeInsets.only(

                          ),
                          child: Container(
                            child: Text('GUESS',textAlign: TextAlign.center,style: TextStyle(fontSize: 40.0,color: Color(
                                0xFF0A44BA)),),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(child: Image.asset('assets/images/guess_logo.png',width: 120.0,height: 120.0,)),
                      Padding(
                        padding: const EdgeInsets.only(

                        ),
                        child: Container(
                          padding: const EdgeInsets.only(

                            bottom: 80,
                          ),
                          child: Text('THE NUMBER',style: TextStyle(fontSize: 30.0, color: Color(
                              0xFF5AD70D)),),
                        )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 20,
                    ),
                    child: TextField(

                    ),
                  ),

                  Center(
                    child: ElevatedButton(
                      child: Text('GUESS'),
                      onPressed: () {
                        //press to work
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
