import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bebas_uas/provider/provider.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TProvider>(context);
    return Column(
      children: [
        Container(
          height: 94,
          decoration: BoxDecoration(color: Colors.green),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "TOP UP",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color:Colors.white),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Total Saldo :',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Text(
                    'Rp. ${prov.saldo.toString()}',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0, // soften the shadow
                  spreadRadius: 0.5, //extend the shadow
                  offset: Offset(
                    3.0, // Move to right 5  horizontally
                    3.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            masukkanNominal(context, 'Isi Saldo'),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(Icons.wallet),
                        Text('Isi Saldo'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            masukkanNominal(context, 'Pembayaran'),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(Icons.money),
                        Text('Bayar'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            masukkanNominal(context, 'Transfer'),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(Icons.send),
                        Text('Transfer'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0, // soften the shadow
                  spreadRadius: 0.5, //extend the shadow
                  offset: Offset(
                    3.0, // Move to right 5  horizontally
                    3.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text(
                  'Transaksi Terakhir',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (prov.statement == "")
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("Belom memiliki transaksi",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    else if (prov.statement == "add")
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                            'Melakukan Transaksi ISI saldo sebesar Rp. ${prov.saldosementara} ',
                            style: TextStyle(color: Colors.green)),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                            'Melakukan Transaksi BAYAR saldo sebesar Rp. ${prov.saldosementara} ',
                            style: TextStyle(color: Colors.red)),
                      )
                  ],
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }
}

masukkanNominal(BuildContext context, String text) {
  final prov = Provider.of<TProvider>(context);
  final nominalController = TextEditingController();
  return SimpleDialog(
    title: Text(text),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TextField(
          controller: nominalController,
          obscureText: false,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey[250],
              filled: true,
              hintText: 'Masukkan Nominal',
              hintStyle: TextStyle(color: Colors.grey[500])),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              if (text == 'Isi Saldo') {
                if (int.parse(nominalController.text) + prov.saldo <=
                    100000000) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => masukkanPin(
                        context, int.parse(nominalController.text), text),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        errorDialog(context, 'Nominal melebihi batas!'),
                  );
                }
              } else if (text == 'Pembayaran') {
                if (prov.saldo >= int.parse(nominalController.text)) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => masukkanPin(
                        context, int.parse(nominalController.text), text),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        errorDialog(context, 'Saldo Tidak Cukup'),
                  );
                }
              } else {
                if (prov.saldo >= int.parse(nominalController.text)) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => masukkanPin(
                        context, int.parse(nominalController.text), text),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        errorDialog(context, 'Saldo Tidak Cukup'),
                  );
                }
              }
            },
            child: const Text('OK'),
          )
        ],
      )
    ],
  );
}

masukkanPin(BuildContext context, int nominal, String tipe) {
  final prov = Provider.of<TProvider>(context);
  final pinController = TextEditingController();
  return SimpleDialog(
    title: const Text('Masukkan PIN'),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TextField(
          controller: pinController,
          obscureText: true,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey[250],
              filled: true,
              hintText: 'Masukkan Nominal',
              hintStyle: TextStyle(color: Colors.grey[500])),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              if (tipe == 'Isi Saldo') {
                if (pinController.text == prov.pin) {
                  prov.statement = "add";
                  prov.addsaldo(nominal);
                  prov.saldosementara = nominal.toString();
                  // prov.saldo = prov.saldo + nominal;
                  showDialog(
                    context: context,
                    builder: (context) =>
                        successDialog(context, 'Berhasil melakukan Top Up!'),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        errorDialog(context, 'Pin yang dimasukkan salah!'),
                  );
                }
              } else if (tipe == 'Pembayaran') {
                if (pinController.text == prov.pin) {
                  prov.statement = "min";
                  prov.minsaldo(nominal);
                  // prov.saldo = prov.saldo - nominal;
                  prov.saldosementara = nominal.toString();

                  showDialog(
                    context: context,
                    builder: (context) =>
                        successDialog(context, 'Berhasil melakukan pembayaran'),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        errorDialog(context, 'Pin yang dimasukkan salah!'),
                  );
                }
              } else {
                if (pinController.text == prov.pin) {
                  prov.saldo = prov.saldo - nominal;
                  showDialog(
                    context: context,
                    builder: (context) =>
                        successDialog(context, 'Berhasil melakukan transfer'),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        errorDialog(context, 'Pin yang dimasukkan salah!'),
                  );
                }
              }
            },
            child: const Text('OK'),
          )
        ],
      )
    ],
  );
}

errorDialog(BuildContext context, String text) {
  return AlertDialog(
    title: const Text('Error!'),
    content: Text(text),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('OK'),
      )
    ],
  );
}

successDialog(BuildContext context, String text) {
  return AlertDialog(
    title: const Text('Success!'),
    content: Text(text),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        child: const Text('OK'),
      )
    ],
  );
}
