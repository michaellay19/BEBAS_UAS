import 'package:bebas_uas/aboutus1.dart';
import 'package:bebas_uas/halaman_utama.dart';
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
              ],
            ),
            SizedBox(height: 20.0),
            ClipOval(
                child: Image.network(
              "https://images.tokopedia.net/img/cache/215-square/shops-1/2020/2/27/4445144/4445144_69388764-4fac-4ff8-9511-6c93dbf7793e.png",
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            )),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Kami sering dipandang sebagai perusahaan Indonesia yang melewati jalan yang mulus. Namun, kami selalu menganggap diri kami sebagai startup penuh energi yang semakin kuat berjuang melewati berbagai tantangan sulit setiap hari.',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
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
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsPage2()),
                    );
                  },
                  child: Text(
                    'Selanjutnya',
                    style: TextStyle(fontSize: 25.0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
