import 'package:flutter/material.dart';

class Chap11 extends StatelessWidget {
  const Chap11({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List View Test",
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Text("List view"),
      ),
      body: ListView(
        children: const <Widget>[
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/64px-HTML5_logo_and_wordmark.png", subtitle: "HTML"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/CSS3_logo_and_wordmark.svg/64px-CSS3_logo_and_wordmark.png", subtitle: "CSS"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Sass_Logo_Color.svg/64px-Sass_Logo_Color.png", subtitle: "Sass"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Bootstrap_logo.svg/64px-Bootstrap_logo.png", subtitle: "Bootstrap"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tailwind_CSS_Logo.svg/64px-Tailwind_CSS_Logo.png", subtitle: "Tailwind CSS"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/64px-React-icon.png", subtitle: "React"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Vue.js_Logo_2.svg/64px-Vue.js_Logo_2.png", subtitle: "Vue.js"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/JavaScript-logo.png/64px-JavaScript-logo.png", subtitle: "JavaScript"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Typescript.svg/64px-Typescript.png", subtitle: "TypeScript"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Node.js_logo.svg/64px-Node.js_logo.png", subtitle: "Node.js"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Expressjs.png/64px-Expressjs.png", subtitle: "Express.js"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/64px-PHP-logo.png", subtitle: "PHP"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Laravel.svg/64px-Laravel.png", subtitle: "Laravel"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/64px-Postgresql_elephant.png", subtitle: "PostgreSQL"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/MySQL_textlogo.svg/64px-MySQL_textlogo.png", subtitle: "MySQL"),
          ListTutor(subicon: "https://img.icons8.com/color/64/000000/mongodb.png", subtitle: "MongoDB"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Figma-logo.svg/64px-Figma-logo.png", subtitle: "Figma"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Git-logo.svg/64px-Git-logo.png", subtitle: "Git"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/64px-Visual_Studio_Code_1.35_icon.png", subtitle: "VS Code"),
          ListTutor(subicon: "https://vitejs.dev/logo-with-shadow.png", subtitle: "Vite"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Google-flutter-logo.png/64px-Google-flutter-logo.png", subtitle: "Flutter"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Go_Logo_Blue.svg/64px-Go_Logo_Blue.png", subtitle: "Golang"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Spring_Framework_Logo_2018.svg/64px-Spring_Framework_Logo_2018.png", subtitle: "Spring Boot"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Docker_%28container_engine%29_logo.svg/64px-Docker_%28container_engine%29_logo.png", subtitle: "Docker"),
          ListTutor(subicon: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Kubernetes_logo_without_workmark.svg/64px-Kubernetes_logo_without_workmark.png", subtitle: "Kubernetes"),
        ],
      ),
    );
  }
}

class ListTutor extends StatelessWidget {

  const ListTutor({super.key, required this.subicon, required this.subtitle});

  final String subicon;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      // child: Center(
      //     child: Card(
      //         elevation: 10.0,
      //         child: Column(children: <Widget>[
      //           Image(
      //             image: NetworkImage(subicon),
      //             width: 100.0,
      //           ),
      //           Text(
      //             subtitle,
      //             style: const TextStyle(fontSize: 20.0),
      //           ),
      //         ]
      //       )
      //     )
      // )
      child: Center(
        child: Row(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  subicon),
              width: 100.0,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    const Text('Ini Deskripsinya')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
