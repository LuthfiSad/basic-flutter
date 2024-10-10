import 'package:flutter/material.dart';

class Chap17 extends StatelessWidget {
  const Chap17({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form",
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  List<String> agama = [
    "Islam",
    "Kristen Katolik",
    "Kristen Protestan",
    "Hindu",
    "Budha"
  ];
  String _agama = "Islam";
  String _jk = "";

  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerMoto = TextEditingController();

  void _handleJkOption(String value) {
    setState(() {
      _jk = value;
    });
  }

  void _handleAgamaSelect(String? value) {
    setState(() {
      _agama = value!;
    });
  }

  void _sendData() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // content: SizedBox(
          // height: 200.0,
          // child: Column(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Nama Lengkap : ${controllerNama.text}"),
              Text("Password : ${controllerPass.text}"),
              Text("Moto : ${controllerMoto.text}"),
              Text("Jenis Kelamin : $_jk"),
              Text("Agama : $_agama"),
              ElevatedButton(
                child: const Text("OK"),
                onPressed: () {
                  // Menggunakan context dari dialog untuk menutup alert
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        // ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
        title: const Text("Formulir"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Column(
            children: <Widget>[
              TextField(
                controller: controllerNama,
                decoration: InputDecoration(
                  hintText: "Nama Lengkap",
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: controllerPass,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: controllerMoto,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Moto Hidup",
                  labelText: "Moto Hidup",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              RadioListTile(
                value: "Laki-Laki",
                title: const Text("Laki-Laki"),
                groupValue: _jk,
                onChanged: (String? value) {
                  _handleJkOption(value!);
                },
                activeColor: Colors.red,
                subtitle: const Text("Pilih ini jika Anda Laki-Laki"),
              ),
              RadioListTile(
                value: "Perempuan",
                title: const Text("Perempuan"),
                groupValue: _jk,
                onChanged: (String? value) {
                  _handleJkOption(value!);
                },
                activeColor: Colors.red,
                subtitle: const Text("Pilih ini jika Anda Perempuan"),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  const Text(
                    "Agama ",
                    style: TextStyle(fontSize: 15.0, color: Colors.blue),
                  ),
                  const SizedBox(width: 20.0),
                  DropdownButton<String>(
                    onChanged: _handleAgamaSelect,
                    value: _agama,
                    items: agama.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: _sendData,
                child: const Text("OK"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
