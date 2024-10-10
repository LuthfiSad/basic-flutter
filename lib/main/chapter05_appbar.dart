import 'package:flutter/material.dart';

class Chap05 extends StatelessWidget {
  const Chap05({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Bar',
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
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        leading: const Icon(Icons.home),
        title: const Center(
            child: Text('Muhamaad Luthfi Sadli Center Text')
        ),
        actions: const <Widget>[
          Icon(Icons.search),
        ],
      ),
    );
  }
}
