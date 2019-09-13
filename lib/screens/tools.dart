import 'package:cars/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Tools extends StatefulWidget {
  @override
  ToolsState createState() => ToolsState();
}

class ToolsState extends State<Tools> {
  var vehicles = List<dynamic>();

  var url = "http://rest.virames.com.tr/GetVehicleList";

  Future<List<dynamic>> _getVehicleLists() async {
    var rawData = await http.get(url);
    var list = json.decode(rawData.body);
    Iterable iterableList = list.toList();
    vehicles = iterableList;
    return vehicles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Araçlar"),
          centerTitle: true,
          backgroundColor: Colors.black87,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch(vehicles));
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
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
                  Navigator.of(context).pushNamed(Constants.ROUTE_MYAPP);
                },
              ),
            ],
          ),
        ),
        body: Container(
            color: Colors.white,
            child: Container(
              child: FutureBuilder(
                future: _getVehicleLists(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                      itemCount: vehicles.length,
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
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: new BorderSide(
                                              color: Colors.blueAccent,
                                              width: 2.0),
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
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.drive_eta,
                                                        color: Colors.black,
                                                      ),
                                                      Text(
                                                        "ID :  " +
                                                            snapshot.data[index]
                                                                ["Oid"],
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
                                                            "LicensePlate :  " +
                                                                snapshot.data[
                                                                        index][
                                                                    "LicensePlate"],
                                                            style: TextStyle(
                                                                fontSize: 15.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 5, 0, 2),
                                                        child: Container(
                                                          width: 260,
                                                          child: Text(
                                                            "VehicleGroup : " +
                                                                snapshot.data[
                                                                        index][
                                                                    "VehicleGroup"],
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
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VehicleDetails(
                                          snapshot.data[index]["Oid"],
                                        ),
                                      ),
                                    );
                                  },
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
            )));
  }
}

class DataSearch extends SearchDelegate<dynamic> {
  final List<dynamic> vehicles;
  DataSearch(this.vehicles);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
      query = "";

      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
    ? vehicles
    : vehicles.where((p)=>p.contains(query))
    .toList();
    
    return ListView.builder(
      itemCount:suggestionList.length ,
        itemBuilder: (context,index)=>ListTile(
          leading: Icon(Icons.drive_eta),
          title: suggestionList[index]["LicensePlate"] ,
        ),

    );
  }
}

class VehicleDetails extends StatelessWidget {
  final String id;
  VehicleDetails(
    this.id,
  );

  Future<dynamic> _getDetails() async {
    var rawData =
        await http.get("http://rest.virames.com.tr/GetVehicle?id=$id");
    var details = json.decode(rawData.body);
    print(details);
    return details;
  }

//snapshot.data["TasList"]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Details"),
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
                      "Plate : " + snapshot.data["LicensePlate"],
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
                                                "License Plate :  " +
                                                    snapshot
                                                        .data["LicensePlate"],
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
                                                "Vehicle Group :  " +
                                                    snapshot
                                                        .data["VehicleGroup"],
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
                                                "Vehicle Identification Number :  " +
                                                    snapshot.data[
                                                        "VehicleIdentificationNumber"],
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
                                                "Current Km Hour :  " +
                                                    snapshot
                                                        .data["CurrentKmHour"]
                                                        .toString(),
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
                                                "Institution Number :  " +
                                                    snapshot.data[
                                                        "InstitutionNumber"],
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
                                                                  VehicleInventory(
                                                                    snapshot.data[
                                                                        "LicensePlate"],
                                                                    snapshot
                                                                        .data[
                                                                            "VehicleInventory"]
                                                                        .toString(),
                                                                  )));
                                                    },
                                                    child: Text(
                                                      "-> Vehicle Inventory",
                                                    ),
                                                  ),
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  VehicleCertificateList(
                                                                    snapshot.data[
                                                                        "LicensePlate"],
                                                                    snapshot
                                                                        .data[
                                                                            "VehicleCertificateList"]
                                                                        .toString(),
                                                                  )));
                                                    },
                                                    child: Text(
                                                      "-> Vehicle Certificate List",
                                                    ),
                                                  ),
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => TaskList(
                                                              snapshot.data[
                                                                  "LicensePlate"],
                                                              snapshot.data["TaskList"]
                                                                  .toString(),
                                                              snapshot.data["TaskList"]
                                                                      [0]["Oid"]
                                                                  .toString(),
                                                              snapshot.data["TaskList"][0]
                                                                  ["ByDemand"],
                                                              snapshot.data["TaskList"]
                                                                  [0]["Status"],
                                                              snapshot.data["TaskList"]
                                                                      [0][
                                                                  "Institution"],
                                                              snapshot.data["TaskList"]
                                                                      [0][
                                                                  "WorkDescription"],
                                                              snapshot.data["TaskList"][0]
                                                                  ["DestinationAddress"],
                                                              snapshot.data["TaskList"][0]["PersonnelListesi"]),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      "-> Task List",
                                                    ),
                                                  ),
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      DefectList(
                                                                        snapshot
                                                                            .data["LicensePlate"],
                                                                        snapshot
                                                                            .data["DefectList"]
                                                                            .toString(),
                                                                      )));
                                                    },
                                                    child: Text(
                                                      "-> Defect List",
                                                    ),
                                                  ),
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PeriodicMaintenanceList(
                                                                    snapshot.data[
                                                                        "LicensePlate"],
                                                                    snapshot
                                                                        .data[
                                                                            "PeriodicMaintenanceList"]
                                                                        .toString(),
                                                                  )));
                                                    },
                                                    child: Text(
                                                      "-> Periodic Maintenance List",
                                                    ),
                                                  ),
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  VehicleTrafficCrashRecordList(
                                                                    snapshot.data[
                                                                        "LicensePlate"],
                                                                    snapshot
                                                                        .data[
                                                                            "VehicleTrafficCrashRecordList"]
                                                                        .toString(),
                                                                  )));
                                                    },
                                                    child: Text(
                                                      "-> Vehicle Traffic Crash Record List",
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

class TaskList extends StatelessWidget {
  final String plate;
  final String id;
  final String vehicle;
  final String byDemand;
  final String status;
  final String institution;
  final String workDescription;
  final String destinationAddress;
  final String personnelListesi;

  TaskList(
      this.plate,
      this.id,
      this.vehicle,
      this.byDemand,
      this.status,
      this.institution,
      this.workDescription,
      this.destinationAddress,
      this.personnelListesi);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Task List Details"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Text(
              "Plate : " + plate,
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
                      side:
                          new BorderSide(color: Colors.blueAccent, width: 2.0),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                    child: Container(
                                      width: 260,
                                      child: Text(
                                        "Vehicle :  " + vehicle,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                    child: Container(
                                      width: 260,
                                      child: Text(
                                        "By Demand :  " + byDemand,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                    child: Container(
                                      width: 260,
                                      child: Text(
                                        "Status :  " + status,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                    child: Container(
                                      width: 260,
                                      child: Text(
                                        "Institution :  " + institution,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                    child: Container(
                                      width: 260,
                                      child: Text(
                                        "Work Description :  " +
                                            workDescription,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                    child: Container(
                                      width: 260,
                                      child: Text(
                                        "Destination Address :  " +
                                            destinationAddress,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                    child: Container(
                                      width: 260,
                                      child: Text(
                                        "Destination Address :  " +
                                            personnelListesi.toString(),
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
      ),
    );
  }
}

class VehicleCertificateList extends StatelessWidget {
  final String plate;
  final String vehicleCertificateList;
  VehicleCertificateList(this.plate, this.vehicleCertificateList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vehicle Certificate List"),
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
                "Plate : " + plate.toString(),
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
                                          vehicleCertificateList,
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

class VehicleInventory extends StatelessWidget {
  final String plate;
  final String vehicleInventory;
  VehicleInventory(this.plate, this.vehicleInventory);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vehicle Inventory"),
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
                "Plate : " + plate.toString(),
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
                                          vehicleInventory,
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

class DefectList extends StatelessWidget {
  final String plate;
  final String defectList;
  DefectList(this.plate, this.defectList);
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
                "Plate : " + plate.toString(),
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
                                          defectList,
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

class PeriodicMaintenanceList extends StatelessWidget {
  final String plate;
  final String periodicMaintenanceList;
  PeriodicMaintenanceList(this.plate, this.periodicMaintenanceList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Periodic Maintenance List"),
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
                "Plate : " + plate.toString(),
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
                                          periodicMaintenanceList,
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

class VehicleTrafficCrashRecordList extends StatelessWidget {
  final String plate;
  final String vehicleTrafficCrashRecordList;
  VehicleTrafficCrashRecordList(this.plate, this.vehicleTrafficCrashRecordList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vehicle Traffic Crash Record List"),
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
                "Plate : " + plate.toString(),
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
                                          vehicleTrafficCrashRecordList,
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
