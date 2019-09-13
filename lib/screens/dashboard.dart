import 'package:cars/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:folding_cell/folding_cell.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.black87,
        centerTitle: true,
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
      body: Stack(
        children: <Widget>[
          dashboard(context),
        ],
      ),
    );
  }

  Widget dashboard(context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("images/body.jpg"),
            fit: BoxFit.cover,
          ),
          Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Divider(
                  height: 10.0,
                ),
                Text(
                  "Mesajlar",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: SimpleFoldingCell(
                    frontWidget: frontWidget(),
                    innerTopWidget: innerTopWidget(),
                    innerBottomWidget: innerBottomWidget(),
                    cellSize: Size(MediaQuery.of(context).size.width, 175),
                    padding: EdgeInsets.all(10.0),
                  ),
                ),
                Text(
                  "Araç Talepleri",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: SimpleFoldingCell(
                    frontWidget: frontWidget(),
                    innerTopWidget: innerTopWidget(),
                    innerBottomWidget: innerBottomWidget(),
                    cellSize: Size(MediaQuery.of(context).size.width, 175),
                    padding: EdgeInsets.all(10.0),
                  ),
                ),
                Text(
                  "Satın Alma Talepleri",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: SimpleFoldingCell(
                    frontWidget: frontWidget(),
                    innerTopWidget: innerTopWidget(),
                    innerBottomWidget: innerBottomWidget(),
                    cellSize: Size(MediaQuery.of(context).size.width, 175),
                    padding: EdgeInsets.all(10.0),
                  ),
                ),
                Text(
                  "Taşınır İstek Talepleri",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: SimpleFoldingCell(
                    frontWidget: frontWidget(),
                    innerTopWidget: innerTopWidget(),
                    innerBottomWidget: innerBottomWidget(),
                    cellSize: Size(MediaQuery.of(context).size.width, 175),
                    padding: EdgeInsets.all(10.0),
                  ),
                ),
                Text(
                  "Görevde ki Araçlar",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: SimpleFoldingCell(
                    frontWidget: frontWidget(),
                    innerTopWidget: innerTopWidget(),
                    innerBottomWidget: innerBottomWidget(),
                    cellSize: Size(MediaQuery.of(context).size.width, 175),
                    padding: EdgeInsets.all(10.0),
                  ),
                ),
                Divider(
                  height: 12.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Container innerTopWidget() {
  return Container();
}

Container innerBottomWidget() {
  return Container();
}

Container frontWidget() {
  return Container(
    alignment: Alignment.center,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.0),
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

/*
Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0),
          ),
          // Image(
          //   image: AssetImage("images/body.jpg"),
          //   fit: BoxFit.cover,
          // ),
          Text(
            "Mesajlar",
            style: TextStyle(color: Colors.black, fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          Column(

          ),
          ListView.builder(
            padding: EdgeInsets.all(30.0),
      itemCount: entries.length,
      itemBuilder: (context, i) => Column(
            children: <Widget>[
              SizedBox(

              ),
              Divider(
                height: 7.0,
                color: Colors.black,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Muhammed Yazıcı",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text("24.07.2019",
                        style: TextStyle(fontSize: 14.0, color: Colors.black)),
                  ],
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text("Merhaba Efendim",
                      style: TextStyle(color: Colors.black54, fontSize: 15.0)),
                ),
              )
            ],
          ),
    ),
        ],
      ),
    ));
*/
