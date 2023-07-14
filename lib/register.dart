import 'package:bebas_uas/aboutus.dart';
import 'package:bebas_uas/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:bebas_uas/login.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  DateTime _date = DateTime.now();

  bool? checkedValue = false;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Daftar",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'Username',
                  labelText: 'Username *',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password *',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: confirmController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  labelText: 'Konfirmasi Password *',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InputDatePickerFormField(
                          initialDate: _date,
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2250),
                          onDateSubmitted: (date) {
                            setState(() {
                              _date = date;
                              print(_date);
                            });
                          },
                          fieldLabelText: 'Tanggal Lahir',
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          var res = await showDatePicker(
                              context: context,
                              initialDate: _date,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2500));

                          if (res != null) {
                            setState(() {
                              _date = res;
                            });
                          }
                        },
                        icon: const Icon(Icons.date_range),
                      )
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                if (usernameController.text == '' ||
                    passwordController.text == '' ||
                    confirmController.text == '') {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        errorDialog(context, 'Isi semua form'),
                  );
                } else if (passwordController.text != confirmController.text) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        errorDialog(context, 'Password tidak sama'),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => successDialog(context),
                  );
                  prov.username = usernameController.text;
                  prov.saldo = 100000;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()));
                }
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sudah punya akun?',
                  style: TextStyle(fontSize: 16),
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
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}

errorDialog(BuildContext context, String msg) {
  return AlertDialog(
    title: const Text('Gagal Mendaftar!'),
    content: Text(msg),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'),
      )
    ],
  );
}

successDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Pendaftaran Sukses!'),
    content: const Text('Data telah disimpan'),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
        child: const Text('OK'),
      )
    ],
  );
}
