import 'package:bebas_uas/components/appbar.dart';
import 'package:bebas_uas/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final feedcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TProvider>(context);
    return Column(
      children: [
        Appbarcom(
          username: prov.username,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: TextField(
            controller: feedcontroller,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.white,
                hintText: "Post something new !!!"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text("CLEAR"),
                onPressed: () {
                  setState(() {
                    // print(listfeedcomment[0]["username"]);
                    feedcontroller.clear();
                  });
                },
              ),
              ElevatedButton(
                child: Text("POST"),
                onPressed: () {
                  if (feedcontroller.text == "") {
                  } else {
                    prov.addcomment(prov.username, feedcontroller.text);
                    print(feedcontroller.text);
                    feedcontroller.clear();
                    final snackBar1 = SnackBar(
                      content: const Text('You post a new feed!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                  }
                },
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20),
          // margin: EdgeInsets.only(bottom: 20),
          width: 460,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "FEED PAGE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            for (var i in prov.listfeedcomment)
              FeedCard(
                  username: i["username"].toString(),
                  comment: i["comment"].toString())
          ]),
        )
      ],
    );
  }
}

class FeedCard extends StatefulWidget {
  final String username;
  final String comment;
  const FeedCard({super.key, required this.username, required this.comment});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  Color _iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 110, 210, 223)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    widget.username,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(widget.comment),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: _iconColor,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_iconColor == Colors.red) {
                        _iconColor = Colors.grey;
                        final snackBar1 = SnackBar(
                          content: const Text('You unlike this comment!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                      } else if (_iconColor == Colors.grey)
                        _iconColor = Colors.red;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
