import 'package:flutter/material.dart';

class Chap04 extends StatelessWidget {
  const Chap04({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text and icon Style',
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Container(
          color: Colors.blue[900],
          width: 200.0,
          height: 100.0,
          child: const Center(
              child: Icon(
                Icons.android,
                color: Colors.yellow,
                size: 70.0,
              )
          ),
        ),
      ),
    );
  }
}
