import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:you_tube/home.dart';
import 'package:flutter/services.dart';
import 'package:you_tube/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pagelist = [const Home()];
  var myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff282828),
        title: Image.asset(
          "assets/logo.jpg",
          width: 80,
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.videocam),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://scontent-sin2-2.xx.fbcdn.net/v/t1.0-1/p160x160/64340449_2337463323244547_2174759606612393984_n.jpg?_nc_cat=109&_nc_oc=AQl0XB7iywuWGHilz6fQBJsHQ6RYjDZH0AETIKL18aBs27d7duLq6bpYvCief81JP8I&_nc_ht=scontent-sin2-2.xx&oh=e14dcec173375fa651a2d1af2c4c279c&oe=5E2BFADD",
              ),
              radius: 13,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: pagelist[myindex],

      //bottom navigaton bar....................................................
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xff909090),
        selectedItemColor: Colors.black,
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: myindex,
        onTap: (int currenIndex) {},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'
              //title: Container(
              //margin: EdgeInsets.only(top: 4),
              //child: Text("Home"),
              ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.fire),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidEnvelope),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidFolder),
            label: 'library',
          ),
        ],
      ),
    );
  }
}
