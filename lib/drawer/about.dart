import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "About Us",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            // SizedBox(height: 20),
            // Text(
            //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod sapien nec tellus maximus euismod. Integer eget nisl malesuada, finibus justo in, volutpat risus. Nunc eget leo nec mauris suscipit venenatis. Nam gravida sodales turpis, et luctus sapien facilisis sed.",
            //   style: TextStyle(
            //     fontSize: 16,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
