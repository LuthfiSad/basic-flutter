// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Chap18 extends StatelessWidget {
  const Chap18({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Google Login | Firebase",
      home: _Login(),
    );
  }
}

class _Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<_Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String nama = "";
  String gambar = "";

  Future<User?> _signIn() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount == null) return null;

    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: gSA.idToken,
      accessToken: gSA.accessToken,
    );

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    User? user = userCredential.user;

    setState(() {
      if (user != null) {
        nama = user.displayName ?? '';
        gambar = user.photoURL ?? '';
      }
    });

    _alertDialog();

    print("Nama User : ${user?.displayName}");
    return user;
  }

  void _alertDialog() {
    // AlertDialog alertDialog =
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        // content: SizedBox(
        // height: 200.0,
        // child: SingleChildScrollView(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              "Sudah Login",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipOval(child: Image.network(gambar)),
            ),
            Text("Anda Login Sebagai $nama"),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button background color
              ),
              child: const Text("OK"),
            )
          ],
        ),
        // ),
        // ),
      ),
    );
  }

  void _signOut() {
    print(googleSignIn.currentUser);
    googleSignIn.signOut();
    print("Sudah Sign Out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Login | Firebase"),
        backgroundColor: Colors.red[700],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _signIn(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700], // Button background color
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.developer_board),
                    Text(
                      "Google Login",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _signOut(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700], // Button background color
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.cancel),
                    Text(
                      "Sign Out",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
