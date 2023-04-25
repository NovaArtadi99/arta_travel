import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Bahasa',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: 1,
                onChanged: (value) {},
              ),
              Text('Indonesia'),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: 1,
                onChanged: (value) {},
              ),
              Text('Inggris'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Notifikasi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Switch(
                value: true,
                onChanged: (value) {},
              ),
              Text('Terima notifikasi tentang penawaran khusus'),
            ],
          ),
          Row(
            children: [
              Switch(
                value: false,
                onChanged: (value) {},
              ),
              Text('Terima notifikasi tentang perjalanan terbaru'),
            ],
          ),
        ],
      ),
    );
  }
}
