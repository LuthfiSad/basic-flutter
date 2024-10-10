import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Chap16 extends StatelessWidget {
  const Chap16({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gradient, PageView, Circle Hero",
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  final List<String> images = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0; // Slow down animations for better visualization
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topRight,
            end: FractionalOffset.bottomLeft,
            colors: [
              Colors.red,
              Colors.yellow,
              Colors.green,
            ],
          ),
        ),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 20.0,
                      spreadRadius: 5.0,
                      offset: const Offset(10.0, 10.0),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Hero(
                        tag: images[index],
                        child: Material(
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => _DetailPage(image: images[index]),
                              ),
                            ),
                            child: Image.asset(
                              "img/${images[index]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DetailPage extends StatefulWidget {
  const _DetailPage({required this.image});
  final String image;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<_DetailPage> {
  Color selectedColor = Colors.grey;

  void _onSelectOption(Option option) {
    setState(() {
      selectedColor = option.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DOTA HERO"),
        backgroundColor: Colors.grey,
        actions: <Widget>[
          PopupMenuButton<Option>(
            onSelected: _onSelectOption,
            itemBuilder: (BuildContext context) {
              return options.map((Option option) {
                return PopupMenuItem<Option>(
                  value: option,
                  child: Text(option.text),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                colors: [
                  Colors.blue,
                  selectedColor,
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: widget.image,
              child: ClipOval(
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Image.asset(
                        "img/${widget.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Option {
  const Option({required this.text, required this.color});
  final String text;
  final Color color;
}

const List<Option> options = <Option>[
  Option(text: "Strength", color: Colors.red),
  Option(text: "Agility", color: Colors.green),
  Option(text: "Intelligence", color: Colors.blue),
];
