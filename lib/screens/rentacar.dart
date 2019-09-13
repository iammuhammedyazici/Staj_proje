import 'dart:convert';
import 'package:cars/models/fakeTools.dart';
import 'package:cars/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RentCar extends StatefulWidget {
  @override
  RentCarState createState() => RentCarState();
}

var departments = List<dynamic>();
var url = "http://rest.virames.com.tr/GetVehicleList";

Future<List<dynamic>> _getDepartmentLists() async {
  var rawData = await http.get(url);
  var list = json.decode(rawData.body);
  Iterable iterableList = list.toList();
  departments = iterableList;
  return departments;
}

class RentCarState extends State<RentCar> {
  List item = fakeTools;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("KİRALIK ARAÇLAR"),
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
          color: Colors.white,
          child: FutureBuilder(
            future: _getDepartmentLists(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  itemCount: departments.length,
                  itemBuilder: (context, index) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return CircularProgressIndicator();
                        break;
                      case ConnectionState.done:
                        return Column(
                          children: <Widget>[
                            Divider(
                              height: 10.0,
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
                                      height: 200.0,
                                      width: 340.0,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: 250,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 2, 0, 0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "Sıra : " +
                                                        index.toString(),
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  Text(
                                                    "Araç Grup :  " +
                                                        snapshot.data[index]
                                                            ["VehicleGroup"],
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 5, 0, 2),
                                                    child: Container(
                                                      width: 260,
                                                      child: Text(
                                                        "Vehicle :  " +
                                                            snapshot.data[index]
                                                                [
                                                                "LicensePlate"],
                                                        style: TextStyle(
                                                            fontSize: 15.0),
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
                        );
                        break;
                      default:
                        return Center(
                          child: Text(
                            "No Data",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                        break;
                    }
                  });
            },
          ),
        ));
  }
}
