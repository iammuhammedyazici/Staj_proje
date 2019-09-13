import 'package:cars/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FaultNotification extends StatefulWidget {
  FaultNotificationState createState() => FaultNotificationState();
}

class FaultNotificationState extends State<FaultNotification> {
  var vehicles = List<dynamic>();
  var url = "http://rest.virames.com.tr/GetDefectNotificationList";

  Future<List<dynamic>> _getVehicleLists() async {
    var rawData = await http.get(url);
    var list = json.decode(rawData.body);
    Iterable iterableList = list.toList();
    vehicles = iterableList;
    return vehicles;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ARAÇ ARIZA BİLDİRİMLERİ"),
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
        body: Container(
          child: FutureBuilder(
            future: _getVehicleLists(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text(
                      "Loading...",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Divider(
                          height: 10.0,
                          color: Colors.black,
                        ),
                        Text(
                          "Sıra : " + (index + 1).toString(),
                          style: TextStyle(color: Colors.red),
                        ),
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: new BorderSide(
                                      color: Colors.blueAccent, width: 2.0),
                                ),
                                elevation: 5,
                                child: Container(
                                  color: Colors.white70,
                                  height: 200.0,
                                  width: 350.0,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 250,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 2, 0, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "ID :  " +
                                                    snapshot.data[index]["Oid"],
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 5, 0, 2),
                                                child: Container(
                                                  width: 260,
                                                  child: Text(
                                                    "Vehicle :  " +
                                                        snapshot.data[index]
                                                            ["Vehicle"],
                                                    style: TextStyle(
                                                        fontSize: 16.0),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 5, 0, 2),
                                                child: Container(
                                                  width: 260,
                                                  child: Text(
                                                    "Description : " +
                                                        snapshot.data[index]
                                                            ["Description"],
                                                    style: TextStyle(
                                                        fontSize: 16.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DefectNotificationListDetail(
                                          snapshot.data[index]["Oid"],
                                        )));
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class DefectNotificationListDetail extends StatelessWidget {
  final String id;
  DefectNotificationListDetail(
    this.id,
  );

  Future<dynamic> _getDetails() async {
    var rawData = await http
        .get("http://rest.virames.com.tr/GetDefectNotification?id=$id");
    var details = json.decode(rawData.body);
    print(details);
    return details;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: FutureBuilder(
          future: _getDetails(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            } else {
              return Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(color: Colors.red, fontSize: 18.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                    ),
                    Divider(
                      height: 8.0,
                      color: Colors.black,
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: new BorderSide(
                                  color: Colors.blueAccent, width: 2.0),
                            ),
                            elevation: 5,
                            child: Container(
                              color: Colors.white70,
                              height: 510.0,
                              width: 350.0,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 510,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 5, 0, 2),
                                            child: Container(
                                              width: 260,
                                              child: Text(
                                                "Vehicle :  " +
                                                    snapshot.data["Vehicle"],
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 5, 0, 2),
                                            child: Container(
                                              width: 260,
                                              child: Text(
                                                "Description :  " +
                                                    snapshot
                                                        .data["Description"],
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 5, 0, 2),
                                              child: Column(
                                                children: <Widget>[
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DefectNotificationLines(snapshot
                                                                      .data[
                                                                          "DefectNotificationLines"]
                                                                      .toString())));
                                                    },
                                                    child: Text(
                                                      "-> Defect Notification Lines",
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class DefectNotificationLines extends StatelessWidget {
  final String defectNotificationLines;
  DefectNotificationLines(this.defectNotificationLines);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Defect List"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Text(
                "List ",
                style: TextStyle(color: Colors.red, fontSize: 18.0),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Divider(
                height: 8.0,
                color: Colors.black,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: new BorderSide(
                            color: Colors.blueAccent, width: 2.0),
                      ),
                      elevation: 5,
                      child: Container(
                        color: Colors.white70,
                        height: 500.0,
                        width: 350.0,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 510,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                      child: Container(
                                        width: 260,
                                        child: Text(
                                          defectNotificationLines,
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
