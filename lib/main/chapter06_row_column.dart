import 'package:flutter/material.dart';

class Chap06 extends StatelessWidget {
  const Chap06({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parks Application',
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
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        leading: const Icon(Icons.home),
        title: const Center(child: Text('Idr Corner')),
        actions: const <Widget>[
          Icon(Icons.search),
        ],
      ),
      body: const Column(
        children: <Widget>[
          Icon(
            Icons.local_pizza,
            size: 70.0,
            color: Colors.red,
          ),
            Row(
              children: <Widget>[
                Icon(Icons.donut_large, size: 70.0, color: Colors.red,),
                Icon(Icons.donut_large, size: 70.0, color: Colors.red,),
                Icon(Icons.donut_large, size: 70.0, color: Colors.red,),
              ],
            ),
          Icon(Icons.cake, size: 70.0, color: Colors.red,)
        ],
      ),
    );
  }
}
