import 'package:cars/models/fakeMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Trash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrashState();
}

class TrashState extends State<Trash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: fakeDataGelen.length,
        itemBuilder: (context, i) => Column(
          children: <Widget>[
            Divider(
              height: 10.0,
              color: Colors.black,
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    fakeDataGelen[i].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(fakeDataGelen[i].time,
                      style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                ],
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(fakeDataGelen[i].message,
                    style: TextStyle(color: Colors.grey, fontSize: 15.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
