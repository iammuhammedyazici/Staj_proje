import 'package:cars/screens/inbox.dart';
import 'package:cars/screens/outbox.dart';
import 'package:cars/screens/trash.dart';
import 'package:cars/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  MessagesState createState() => MessagesState();
}

class MessagesState extends State<Messages> {
  int _currentIndex = 0;
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Inbox();
      case 1:
        return Outbox();
      case 2:
        return Trash();
        break;
      default:
        return Inbox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MESAJLAR"),
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
                      fit: BoxFit.fill,
                      image: AssetImage("images/menu_bar.jpg")),
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
                  Navigator.of(context)
                      .pushNamed(Constants.ROUTE_VEHICLEDEMAND);
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
                trailing:
                    Icon(Icons.format_align_center, color: Colors.black87),
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
        body: callPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text("Inbox"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.skip_next),
              title: Text("Outbox"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restore_from_trash),
              title: Text("Trash"),
            ),
          ],
        ),
      ),
    );
  }
}
