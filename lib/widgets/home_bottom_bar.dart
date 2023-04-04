import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: 2,
      items: [
        Icon(Icons.person_outlined, size: 30), // index 0
        Icon(Icons.favorite_outlined, size: 30), // index 1
        Icon(Icons.home, size: 30, color: Colors.redAccent), // index 2
        Icon(Icons.location_on_outlined, size: 30), // index 3
        Icon(Icons.list, size: 30), // index 4
      ],
    );
  }
}
