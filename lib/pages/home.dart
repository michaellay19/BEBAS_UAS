import 'package:bebas_uas/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../components/appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownvalue = "Medan";

  var locationlist = [
    "Medan",
    "Jakarta",
    "Aceh",
    "Berastagi",
    "Kaban Jahe",
    "Karo"
  ];
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TProvider>(context);
    return Column(children: [
      Appbarcom(
        username: prov.username,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: TextField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.white,
              hintText: "Cari di Tokopedia"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Row(children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              Text(
                "Dikirim ke ",
                style: TextStyle(color: Colors.white),
              ),
            ]),
            DropdownButton(
                value: dropdownvalue,
                items: locationlist.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                })
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "gopay.png",
                              width: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Gopay",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Text("Rp. ${prov.saldo.toString()}"),
                        Text(
                          "10.000.000 Coins",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(width: 0.5, color: Colors.grey))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "diamond.jpg",
                                width: 18,
                              ),
                              Text(
                                "Rewards",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            "Diamond",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "36 Kupon Baru",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          height: 800,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(15)),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shop),
                            Text("Promo Hari"),
                            Text("Ini")
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.money),
                            Text("Lihat"),
                            Text("Semua")
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.car_rental),
                            Text("Toserba"),
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.computer),
                            Text("Rumah"),
                            Text("Tangga")
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.payment),
                            Text("Top-Up &"),
                            Text("Tagihan")
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.airplanemode_on),
                            Text("Travel &"),
                            Text("Entertainment")
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.money_rounded),
                            Text("Keuangan"),
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.coffee),
                            Text("Kecantikan"),
                          ]),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.music_note),
                            Text("Elektronik"),
                          ]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lanjut cek ini, yuk",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemCard(
                                gambar: "kertasthermal.jpg",
                                text1: "Balik lihiat",
                                text2: "Kertas Thermal"),
                            ItemCard(
                                gambar: "tatakan.jpg",
                                text1: "Terakhir kamu cek",
                                text2: "Ttatakan Meja"),
                            ItemCard(
                                gambar: "nenas.jpg",
                                text1: "Lanjut Browse",
                                text2: "Buah-buahan"),
                            ItemCard(
                                gambar: "enoki.jpg",
                                text1: "Cek lagi yuk",
                                text2: "Enoki"),
                            ItemCard(
                                gambar: "laptop.jpg",
                                text1: "Lanjut cari",
                                text2: "Laptop"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BannerCard(banner: "banner1.webp"),
                    BannerCard(banner: "banner2.webp"),
                    BannerCard(banner: "banner3.webp"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ribuan Kebutuhan Sekolah",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Lihat Semua",
                          style: TextStyle(
                              color: Color.fromARGB(255, 31, 195, 36)),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    ItemCard(
                        gambar: "buku.jpg",
                        text1: "Balik lihat",
                        text2: "Buku"),
                    ItemCard(
                        gambar: "penggaris.jpg",
                        text1: "Lanjut browse",
                        text2: "Penggaris"),
                    ItemCard(
                        gambar: "pensil.jpg",
                        text1: "Cek lagi yuk",
                        text2: "Pensil"),
                    ItemCard(
                        gambar: "sepatu.jpg",
                        text1: "Cari lebih banyak",
                        text2: "Sepatu"),
                    ItemCard(
                        gambar: "tas.jpg", text1: "Lanjut cari", text2: "Tas"),
                    ItemCard(
                        gambar: "termos.jpg",
                        text1: "Balik lihat",
                        text2: "Termos"),
                  ]),
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}

class ItemCard extends StatelessWidget {
  final String gambar;
  final String text1;
  final String text2;
  const ItemCard(
      {super.key,
      required this.gambar,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 215,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.asset(
                gambar,
                width: 150,
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Text(
                text1,
                style: TextStyle(fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Text(
                text2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  final String banner;
  const BannerCard({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 480,
      height: 180,
      child: Image.asset(
        banner,
        width: 460,
        height: 300,
        fit: BoxFit.fill,
      ),
    );
  }
}
