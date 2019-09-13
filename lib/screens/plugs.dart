import 'package:cars/models/fakeInsurance.dart';
import 'package:cars/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Plugs extends StatefulWidget {
  @override
  PlugsState createState() => PlugsState();
}

class PlugsState extends State<Plugs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Depo İşlem Fişleri"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Menu",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text("Muhammed Yazıcı",
                  style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage("images/menu_bar.jpg")),
              ),
            ),
            ListTile(
              title: Text(" - Mesajlar"),
              trailing: Icon(
                Icons.message,
                color: Colors.black87,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Constants.ROUTE_MESSAGES);
              },
            ),
            ListTile(
              title: Text(" - Araç Talepleri"),
              trailing: Icon(Icons.directions_car, color: Colors.black87),
              onTap: () {
                Navigator.of(context).pushNamed(Constants.ROUTE_VEHICLEDEMAND);
              },
            ),
            ListTile(
              title: Text(" - Araç Arıza Bildirimleri"),
              trailing: Icon(Icons.event_busy, color: Colors.black87),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Constants.ROUTE_FAULTNOTIFICATION);
              },
            ),
            ListTile(
              title: Text(" - Araçlar"),
              trailing: Icon(Icons.drive_eta, color: Colors.black87),
              onTap: () {
                Navigator.of(context).pushNamed(Constants.ROUTE_TOOLS);
              },
            ),
            ListTile(
              title: Text(" - Kiralık Araçlar"),
              trailing: Icon(Icons.departure_board, color: Colors.black87),
              onTap: () {
                Navigator.of(context).pushNamed(Constants.ROUTE_RENTACAR);
              },
            ),
            ListTile(
              title: Text(" - Sigorta/Muayene"),
              trailing: Icon(Icons.book, color: Colors.black87),
              onTap: () {
                Navigator.of(context).pushNamed(Constants.ROUTE_INSURANCE);
              },
            ),
            ListTile(
              title: Text(" - Satın Alma Talepleri"),
              trailing: Icon(Icons.local_car_wash, color: Colors.black87),
              onTap: () {
                Navigator.of(context).pushNamed(Constants.ROUTE_BUYDEMAND);
              },
            ),
            ListTile(
              title: Text(" - Taşınır İstek Formları"),
              trailing: Icon(Icons.format_align_center, color: Colors.black87),
              onTap: () {
                Navigator.of(context).pushNamed(Constants.ROUTE_FORMS);
              },
            ),
            ListTile(
              title: Text(" - Depo İşlem Fişleri"),
              trailing: Icon(Icons.library_books, color: Colors.black87),
              onTap: () {
                Navigator.of(context).pushNamed(Constants.ROUTE_PLUGS);
              },
            ),
            ListTile(
              title: Text(" - Hakkında"),
              trailing: Icon(Icons.info, color: Colors.black87),
              onTap: () {
                Navigator.of(context).pushNamed(Constants.ROUTE_ABOUT);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: fakeInsuarance.length,
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
                    fakeInsuarance[i].plate,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Talep : " + fakeInsuarance[i].insurance),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
