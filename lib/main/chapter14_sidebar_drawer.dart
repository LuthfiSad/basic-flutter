import 'package:basic_flutter/chapter14/chap14_detail.dart';
import 'package:flutter/material.dart';

class Chap14 extends StatelessWidget {
  const Chap14({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sidebar",
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  String userImage =
      "https://accountingsoftware.co.in/wp-content/uploads/2017/01/user1.png";
  String otherUserImage =
      "https://icons.veryicon.com/png/o/internet--web/moris-icon-library/user1-1.png";

  String imageBackground =
      "https://img.freepik.com/free-vector/pride-gradient-1_78370-282.jpg";
  late String backup;

  String name1 = "Indra Armaula";
  String name2 = "Jack Sparrow";
  late String backupname;

  void changeUser() {
    setState(() {
      backup = userImage;
      userImage = otherUserImage;
      otherUserImage = backup;

      backupname = name1;
      name1 = name2;
      name2 = backupname;
    });
  }

  void showSettingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Settings"),
          content: const Text("This is the settings dialog."),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Demo Sidebar (DRAWER)",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(name1),
              accountEmail: const Text("admin@gmail.com"),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Detail(nama: name1, gambar: userImage)));
                },
                // onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         Detail(nama: name1, gambar: userImage))),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userImage),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageBackground), fit: BoxFit.cover),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                    onTap: () => changeUser(),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(otherUserImage)))
              ],
            ),
            ListTile(
              title: const Text("Setting"),
              trailing: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop(); // Menutup drawer
                showSettingDialog(); // Menampilkan dialog pengaturan
              },
            ),
            ListTile(
              title: const Text("Close"),
              trailing: const Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop(); // Menutup drawer
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Image.network(
          "https://portofolio-react-ts.vercel.app/assets/logo-BCtAiVum.png",
          width: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
