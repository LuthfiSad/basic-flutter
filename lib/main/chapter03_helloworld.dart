import 'package:flutter/material.dart';

class Chap03 extends StatelessWidget {
  const Chap03({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: _Home(), // Tambahkan const jika widget tidak berubah
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
    return const Scaffold(
      body: Center(
        child: Text('Muhamad Luthfi Sadli'), // Tambahkan const
      ),
    );
  }
}
