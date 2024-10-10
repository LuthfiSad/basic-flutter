import 'package:flutter/material.dart';

class Chap08 extends StatelessWidget {
  const Chap08({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Routes',
      home: _HomeState(),
      routes: <String, WidgetBuilder>{
        '/Home' : (BuildContext context) => _HomeState(),
        '/Home2nd' : (BuildContext context) => _Home2nd(),
      },
    );
  }
}

// class _Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<_Home> {
class _HomeState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music'),
      ),
      body: Center(
        child: IconButton(
            icon: const Icon(
              Icons.headset,
              size: 50.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Home2nd');
            },),
      ),
    );
  }
}

class _Home2nd extends StatefulWidget {
  @override
  _Home2ndState createState() => _Home2ndState();
}

class _Home2ndState extends State<_Home2nd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speaker'),
      ),
      body: Center(
        child: IconButton(
          icon: const Icon(
            Icons.speaker,
            size: 50.0,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/Home');
          },),
      ),
    );
  }
}

