import 'package:flutter/material.dart';

import 'package:basic_flutter/chapter09/chap09_tab1.dart' as headset;
import 'package:basic_flutter/chapter09/chap09_tab2.dart' as computer;
import 'package:basic_flutter/chapter09/chap09_tab3.dart' as radio;
import 'package:basic_flutter/chapter09/chap09_tab4.dart' as smartphone;


class Chap09 extends StatelessWidget {
  const Chap09({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar',
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> with SingleTickerProviderStateMixin{

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar with TabBar'),
        backgroundColor: Colors.amber,
        bottom: TabBar(
            controller: controller,
            tabs: const <Widget>[
              Tab(icon: Icon(Icons.computer),text: 'Computer',),
              Tab(icon: Icon(Icons.headset),text: 'Headset',),
              Tab(icon: Icon(Icons.radio),text: 'Radio',),
              Tab(icon: Icon(Icons.smartphone),text: 'Smartphone',),
            ]
        ),
      ),
      body: TabBarView(
          controller: controller,
          children: const <Widget>[
            computer.Computer(),
            headset.Headset(),
            radio.Radio(),
            smartphone.SmartPhone(),
          ]
      ),
      bottomNavigationBar: Material(
        color: Colors.amber,
        child: TabBar(
            controller: controller,
            tabs: const <Widget>[
              Tab(icon: Icon(Icons.computer),),
              Tab(icon: Icon(Icons.headset),),
              Tab(icon: Icon(Icons.radio),),
              Tab(icon: Icon(Icons.smartphone),),
            ]
        ),
      ),
    );
  }
}
