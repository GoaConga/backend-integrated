import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:internsforyou/setup/homescreen/home_screen.dart';
import 'package:internsforyou/setup/browse/browse_screen.dart';
import 'package:internsforyou/setup/setting/sign_in.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Interns 4 You'),
            leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
            bottom: TabBar(indicatorColor: Colors.yellow, indicatorWeight: 5,
                //isScrollable: true,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: 'Home'),
                  Tab(icon: Icon(Icons.star), text: 'Feed'),
                  Tab(icon: Icon(Icons.face), text: 'Browse'),
                  Tab(icon: Icon(Icons.settings), text: 'Settings'),
                ]),
            backgroundColor: Colors.orange,
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(children: [
            Home(),
            Delete_Home(),
            Browse_Home(),
            Sign_in_Home(),
          ])));
}
