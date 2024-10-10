import 'package:flutter/material.dart';

class Headset extends StatelessWidget {
  const Headset({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20.0),),
          Text("Head Set", style: TextStyle(fontSize: 30.0),),
          Padding(padding: EdgeInsets.all(20.0),),
          Image(image: NetworkImage("https://img.lovepik.com/element/40029/0243.png_860.png"),width: 200.0,)
        ],
      ),
    );
  }
}
