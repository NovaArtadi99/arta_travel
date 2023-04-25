import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<String> destinations = [
    'Buleleng',
    'Badung',
    'Bangli',
    'Gianyar',
    'Karangasem',
    'Klungkung',
    'Tabanan',
    'Denpasar',
    'Jembrana'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destinasi Wisata'),
      ),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(destinations[index]),
            onTap: () {
              // Navigasi ke halaman detail
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(destination: destinations[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String destination;

  DetailPage({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination),
      ),
      body: Center(
        child: Text(
          'Detail dari $destination',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
