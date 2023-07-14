import 'package:bebas_uas/login.dart';
import 'package:bebas_uas/pages/home.dart';
import 'package:bebas_uas/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      width: 500,
      color: Colors.white,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "SETTING",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        child: Icon(Icons.person),
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(prov.username,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text("Rp10.000.000 . 20.000.000 Coins",
                              style: TextStyle(color: Colors.black)),
                          Text("Not verification",
                              style: TextStyle(color: Colors.red)),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.settings,
                        size: 30,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: Row(
                  children: [
                    Setting1(namasetting: "Buka Toko Gratis"),
                    SizedBox(
                      width: 10,
                    ),
                    Setting1(namasetting: "Daftar Affiliate"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Aktivitas saya",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCard1(
                        gambar: "laptop.jpg",
                        text1: "Diproses",
                        text2: "Laptop ROG"),
                    ItemCard1(
                        gambar: "enoki.jpg",
                        text1: "Sedang Dikirim",
                        text2: "Jamur Enoki"),
                    ItemCard1(
                        gambar: "kertasthermal.jpg",
                        text1: "Tiba di Tujuan",
                        text2: "Kertas Thermal")
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.list_alt_outlined),
                title: Text("Daftar Transaksi"),
              ),
              ListTile(
                leading: Icon(Icons.favorite_outline_outlined),
                title: Text("Wishlist"),
              ),
              ListTile(
                leading: Icon(Icons.star_outline_outlined),
                title: Text("Ulasan"),
              ),
              ListTile(
                leading: Icon(Icons.house_outlined),
                title: Text("Toko yang Di-follow"),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Semua Kategori",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag_outlined),
                title: Text("Kategori"),
              ),
              ListTile(
                leading: Icon(Icons.menu_outlined),
                title: Text("Top-Up & Tagihan"),
              ),
              ListTile(
                leading: Icon(Icons.airplanemode_on_outlined),
                title: Text("Travel & Entertainment"),
              ),
              ListTile(
                leading: Icon(Icons.money_outlined),
                title: Text("Keuangan"),
              ),
              ListTile(
                leading: Icon(Icons.settings_applications_outlined),
                title: Text("Layanan Lainnya"),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Pusat bantuan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.warning_outlined),
                title: Text("Pesanan Dikomplain"),
              ),
              ListTile(
                leading: Icon(Icons.support_agent_outlined),
                title: Text("Bantuan Tokopedia Care"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.code_outlined),
                title: Text("Scan Kode QR"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text('Log out'))
            ],
          ),
        )
      ]),
    );
  }
}

class Setting1 extends StatelessWidget {
  final String namasetting;
  const Setting1({super.key, required this.namasetting});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(6)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              namasetting,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_right)
          ]),
        ));
  }
}

class ItemCard1 extends StatelessWidget {
  final String gambar;
  final String text1;
  final String text2;
  const ItemCard1(
      {super.key,
      required this.gambar,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 75,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(8),
        )),
        elevation: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 75,
              height: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                child: Image.asset(
                  gambar,
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  Text(
                    text2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
