import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Appbarcom extends StatefulWidget {
  const Appbarcom({super.key});

  @override
  State<Appbarcom> createState() => _AppbarcomState();
}

class _AppbarcomState extends State<Appbarcom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Wellcome Michael Lay",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: Container(
                        width: 15,
                        height: 13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red),
                        child: Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: Container(
                        width: 15,
                        height: 13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red),
                        child: Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: Container(
                        width: 15,
                        height: 13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red),
                        child: Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    Positioned(
                      top: 15,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
