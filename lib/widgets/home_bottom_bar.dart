import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:travel/buttom/favorit.dart';
import 'package:travel/buttom/list.dart';
import 'package:travel/buttom/location.dart';
import 'package:travel/drawer/profile.dart';

import '../screens/home_screen.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: selectedIndex,
      items: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          child: Icon(Icons.person_outlined, size: 30),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FavoritePage()));
          },
          child: Icon(Icons.favorite_outlined, size: 30),
        ), // index 0
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Icon(Icons.home, size: 30, color: Colors.redAccent),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LocationPage()));
          },
          child: Icon(Icons.location_on_outlined, size: 30),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ListPage()));
          },
          child: Icon(Icons.list, size: 30),
        ),
      ],
    );
  }
}
