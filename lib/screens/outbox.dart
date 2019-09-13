import 'package:cars/models/fakeMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Outbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OutboxState();
}

class OutboxState extends State<Outbox> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fakeDataGiden.length,
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
                  fakeDataGiden[i].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(fakeDataGiden[i].time,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey)),
              ],
            ),
            subtitle: Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(fakeDataGiden[i].message,
                  style: TextStyle(color: Colors.grey, fontSize: 15.0)),
            ),
          )
        ],
      ),
    );
  }
}
