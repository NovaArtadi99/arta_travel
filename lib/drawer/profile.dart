import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://static1.undiksha.ac.id/siakng/2021/fotomahasiswa/1236157590-1629800152.jpg'),
            ),
          ),
          Text(
            'Nova Artadi',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'putunova0123@gmail.com',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Address'),
            subtitle: Text('Temukus, Banjar, Buleleng, Bali'),
          ),
          // ListTile(
          //   leading: Icon(Icons.work),
          //   title: Text('University Address'),
          //   subtitle: Text('456 Business Ave, Cityville USA'),
          // ),
        ],
      ),
    );
  }
}
