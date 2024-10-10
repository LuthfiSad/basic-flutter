import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final List<Map<String, dynamic>> list;
  final int index;

  const Detail({super.key, required this.index, required this.list});

  @override
  // ignore: library_private_types_in_public_api
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['item_name']}"),
      ),
      body: Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 30.0)),
                Text(
                  widget.list[widget.index]['item_name'],
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Code : ${widget.list[widget.index]['item_name']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Price : ${widget.list[widget.index]['price']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Stock : ${widget.list[widget.index]['stock']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const Padding(padding: EdgeInsets.only(top: 30.0)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        // Aksi untuk edit
                      },
                      child: const Text("EDIT"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        // Aksi untuk delete
                      },
                      child: const Text("DELETE"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
