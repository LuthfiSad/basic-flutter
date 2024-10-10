import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:basic_flutter/main/chapter03_helloworld.dart';
// import 'package:basic_flutter/main/chapter04_texticon_style.dart';
// import 'package:basic_flutter/main/chapter05_appbar.dart';
// import 'package:basic_flutter/main/chapter06_row_column.dart';
// import 'package:basic_flutter/main/chapter07_card_parsingdata.dart';
// import 'package:basic_flutter/main/chapter08_navigation_routes.dart';
// import 'package:basic_flutter/main/chapter09_tabbar.dart';
// import 'package:basic_flutter/main/chapter11_listview.dart';
// import 'package:basic_flutter/main/chapter12_listviewjason.dart';
// import 'package:basic_flutter/main/chapter13_inputtext_alertdialog_snackbar.dart';
// import 'package:basic_flutter/main/chapter14_sidebar_drawer.dart';
// import 'package:basic_flutter/main/chapter15_grid_helo_animation.dart';
// import 'package:basic_flutter/main/chapter16_gradient_pageview_circlehero.dart';
// import 'package:basic_flutter/main/chapter17_form.dart';
import 'package:basic_flutter/main/chapter18_google_login.dart';
// import 'package:basic_flutter/main/chapter19_read.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan widget binding diinisialisasi
  await Firebase.initializeApp();  // Inisialisasi Firebase
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override

  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // body: Center(
        //   child: Text('Hello World!'),
        // ),
        // body: Chap03(),
        // body: Chap04(),
        // body: Chap05(),
        // body: Chap06(),
        // body: Chap07(),
        // body: Chap08(),
        // body: Chap09(),
        // body: Chap11(),
        // body: Chap12(),
        // body: Chap13(),
        // body: Chap14(),
        // body: Chap15(),
        // body: Chap16(),
        // body: Chap17(),
        body: Chap18(),
      ),
    );
  }
}
