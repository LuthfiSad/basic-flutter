import 'package:flutter/material.dart';

class Chap13 extends StatelessWidget {
  const Chap13({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Input Text , Alert & SnackBar",
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  String value1 = "";

  final TextEditingController _controllerInput = TextEditingController();
  final TextEditingController _controllerAlert = TextEditingController();
  final TextEditingController _controllerSnacbar = TextEditingController();
  // final TextEditingController _controller = TextEditingController();

  void _alertDialog(String str) {
    if (str.isEmpty) return;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text("Input Text"),
          content: Text(
            str,
            style: const TextStyle(fontSize: 20.0),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _snacbar(String str) {
    if (str.isEmpty) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          str,
          style: const TextStyle(fontSize: 20.0),
        ),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Text, Alert Dialog & Snack Bar"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controllerInput,
            // controller: _controller,
            decoration: const InputDecoration(
              hintText: "Input Text",
            ),
            onSubmitted: (String str) {
              setState(() {
                value1 = "$str\n$value1";
                _controllerInput.clear();
              });
            },
            // onChanged: (String str) {
            //   setState(() {
            //     value1 = str;
            //   });
            // },
          ),
          Text(
            value1,
            style: const TextStyle(fontSize: 20.0),
          ),
          TextField(
            controller: _controllerAlert,
            // controller: _controller,
            decoration: const InputDecoration(
              hintText: "Input to Alert",
            ),
            onSubmitted: (String str) {
              _alertDialog(str);
              _controllerAlert.clear();
            },
          ),
          TextField(
            controller: _controllerSnacbar,
            // controller: _controller,
            decoration: const InputDecoration(
              hintText: "Input to SnackBar",
            ),
            onSubmitted: (String str) {
              _snacbar(str);
              _controllerSnacbar.clear();
            },
          ),
        ],
      ),
    );
  }
}
