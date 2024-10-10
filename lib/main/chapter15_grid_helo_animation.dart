import 'package:flutter/material.dart';

class Chap15 extends StatelessWidget {
  const Chap15({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "GRID, HERO, ANIMATION",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<Container> superheroList = [];

  final List<Map<String, String>> characters = [
    {"name": "Satu", "image": "satu.png"},
    {"name": "Dua", "image": "dua.png"},
    {"name": "Tiga", "image": "tiga.png"},
    {"name": "Empat", "image": "empat.png"},
    {"name": "Lima", "image": "lima.png"},
    {"name": "Enam", "image": "enam.png"},
    {"name": "Tujuh", "image": "tujuh.png"},
    {"name": "Delapan", "image": "delapan.png"},
    {"name": "Sembilan", "image": "sembilan.png"},
    {"name": "Sepuluh", "image": "sepuluh.png"},
  ];

  void _buildList() {
    for (var character in characters) {
      final String image = character["image"]!;
      superheroList.add(
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: SingleChildScrollView(
              // Tambahkan scroll jika konten overflow
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: character["name"]!,
                    child: Material(
                      child: InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Detail(
                            name: character['name']!,
                            image: image,
                          ),
                        )),
                        child: Image.asset(
                          "img/$image",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text(
                    character["name"]!,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    _buildList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Superheroes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: superheroList,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 240.0,
            child: Hero(
              tag: name,
              child: Material(
                child: InkWell(
                  child: Image.asset(
                    "img/$image",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          NameSection(name: name),
          const IconSection(),
          const Description(),
        ],
      ),
    ));
  }
}

class NameSection extends StatelessWidget {
  const NameSection({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                const SizedBox(height: 0.0),
                Text(
                  "$name@gmail.com",
                  style: const TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
              ],
            ),
          ),
          // Menghapus Expanded di sini
          const Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 20.0,
                color: Colors.red,
              ),
              SizedBox(width: 10.0), // Tambahkan jarak antara ikon dan teks
              Text(
                "12",
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class IconSection extends StatelessWidget {
  const IconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: const Row(
        children: <Widget>[
          IconText(icon: Icons.call, text: "Call"),
          IconText(icon: Icons.message, text: "Message"),
          IconText(icon: Icons.photo, text: "Photo"),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 10.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: const Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
            "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
            "It has survived not only five centuries, but also the leap into electronic typesetting, "
            "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset "
            "sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like "
            "Aldus PageMaker including versions of Lorem Ipsum.",
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
