import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 31, 195, 36)),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Tentang Tokopedia',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 20.0),
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(
                      'https://www.freepnglogos.com/uploads/logo-tokopedia-png/logo-tokopedia-15.png'),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Kami sering dipandang sebagai perusahaan Indonesia yang melewati jalan yang mulus. Namun, kami selalu menganggap diri kami sebagai startup penuh energi yang semakin kuat berjuang melewati berbagai tantangan sulit setiap hari.',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                SizedBox(height: 24.0),
                Row(
                  children: [
                    Icon(Icons.phone, size: 20.0),
                    SizedBox(width: 8.0),
                    Text(
                      'Hubungi kami: 012345678912',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.mail, size: 20.0),
                    SizedBox(width: 8.0),
                    Text(
                      'Email: info@tokopedia.com',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
