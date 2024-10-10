import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key, required this.nama, required this.gambar});
  final String nama;
  final String gambar;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail $nama", style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
          child: Image(
        image: NetworkImage(gambar),
      )),
    );
  }
}