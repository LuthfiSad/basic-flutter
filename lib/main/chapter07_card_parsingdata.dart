import 'package:flutter/material.dart';

class Chap07 extends StatelessWidget {
  const Chap07({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Parsing Data',
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
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('aplikasi Name'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CardStyle(
            icon: Icons.home,
            iconColor: Colors.brown,
            text: "Home",
          ),
          CardStyle(
            icon: Icons.favorite,
            iconColor: Colors.pink,
            text: "Favorite",
          ),
          CardStyle(
            icon: Icons.place,
            iconColor: Colors.blue,
            text: "Place",
          ),
          CardStyle(
            icon: Icons.settings,
            iconColor: Colors.black45,
            text: "Home",
          ),
          Card(
            child: Column(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}

class CardStyle extends StatelessWidget {
  const CardStyle(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 50.0,
              color: iconColor,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
