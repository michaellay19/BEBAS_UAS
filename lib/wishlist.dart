import 'package:bebas_uas/components/appbar.dart';
import 'package:bebas_uas/halaman_utama.dart';
import 'package:bebas_uas/pages/home.dart';
import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(color: Colors.green),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Wish List",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    width: 450,
                                    child: Image.asset('wishlist.png'),
                                  ),
                                ),
                                Text(
                                  'Mau simpen barang untuk dibeli nanti?',
                                ),
                                Text(
                                  'Bandingkan harga dan spesifikasinya?',
                                ),
                                Text(
                                  'Di sini tempatnya!',
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    width: 450,
                                    child: Image.asset('wishlist1.png'),
                                  ),
                                ),
                                Text(
                                  'Lagi lihat-lihat, ada barang yang kamu suka?',
                                ),
                                Text(
                                  'Klik ikon hati buat simpan di wishlist',
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    width: 450,
                                    child: Image.asset('wishlist2.png'),
                                  ),
                                ),
                                Text(
                                  'Pakai fitur Koleksi buat mengelompokkan',
                                ),
                                Text(
                                  'barang-barang di Wishlist sesukamu',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalamanUtama(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 70),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Cari Barang',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
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
                        Text("Rekomendasi untukmu",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
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
                            gambar: "laptop.jpg",
                            text1: "Lanjut cari",
                            text2: "Laptop"),
                        ItemCard(
                            gambar: "pensil.jpg",
                            text1: "Cek lagi yuk",
                            text2: "Pensil"),
                        ItemCard(
                            gambar: "sepatu.jpg",
                            text1: "Cari lebih banyak",
                            text2: "Sepatu"),
                        ItemCard(
                            gambar: "kertasthermal.jpg",
                            text1: "Balik lihiat",
                            text2: "Kertas Thermal"),
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
          ],
        )
      ],
    );
  }
}
