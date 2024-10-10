import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Chap12 extends StatelessWidget {
  const Chap12({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Jason',
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  late List dataJSON = [];

  Future<String> getData() async {
    var hasil = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    setState(() {
      // dataJSON = List.generate(300, (i) => {"title": "title $i", "body": "body $i"});
      dataJSON = jsonDecode(hasil.body);
    });

    return 'Data retrieved successfully';
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data From JSON"),
      ),
      body: ListView.builder(
        itemCount: dataJSON.isEmpty ? 0 : dataJSON.length,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      dataJSON[i]['title'],
                      style:
                          const TextStyle(fontSize: 20.0, color: Colors.blue),
                    ),
                    Text(dataJSON[i]['body'])
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
