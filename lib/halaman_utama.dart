import 'package:bebas_uas/components/appbar.dart';
import 'package:bebas_uas/pages/feed.dart';
import 'package:bebas_uas/pages/home.dart';
import 'package:bebas_uas/pages/setting.dart';
import 'package:bebas_uas/provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Feed(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 195, 36),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.image_outlined,
            ),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Official Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 31, 195, 36),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
