import 'package:flutter/material.dart';
import 'package:travel/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/travelbackground.jpg"),
          fit: BoxFit.cover,
          opacity: 0.7,
        )),
        child: Material(
          color: Colors.transparent,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "The Arta Travel!",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Aplikasi Travel merupakan platform yang membantu dan memudahkan orang-orang melakukan transaksi terkait pemesanan tiket transportasi, penyewaan tempat penginapan, pemesanan tiket masuk objek wisata, hingga tiket pertunjukan.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                    child: Ink(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
