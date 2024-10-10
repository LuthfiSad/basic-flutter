import 'package:flutter/material.dart';

class Computer extends StatelessWidget {
  const Computer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20.0),),
          Text("Computer", style: TextStyle(fontSize: 30.0),),
          Padding(padding: EdgeInsets.all(20.0),),
          Image(image: NetworkImage("http://www.ciokorea.com/sites/default/files/image/VPULSE.png"),width: 200.0,)
        ],
      ),
    );
  }
}
