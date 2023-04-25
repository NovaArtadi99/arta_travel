import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorit'),
      ),
      body: Center(
        child: Text(
          'Belum ada item favorit',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
