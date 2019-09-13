//VehicleTrafficCrashRecordList
/*
Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Text(
                "Plate : " + licensePlate,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "ID :  " + id,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                      child: Container(
                                        width: 260,
                                        child: Text(
                                          "Vehicle :  " + licensePlate,
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                      child: Container(
                                        width: 260,
                                        child: Text(
                                          "Description : " + vehicleGroup,
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                      child: Container(
                                        width: 260,
                                        child: Text(
                                          "Vehicle Idendification Number :  " +
                                              vehicleIdentificationNumber,
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                      child: Container(
                                        width: 260,
                                        child: Text(
                                          "Current Km Hour :  " +
                                              currentKmHour.toString(),
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                      child: Container(
                                        width: 260,
                                        child: Text(
                                          "InstitutionNumber :  " +
                                              institutionNumber,
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 5, 0, 2),
                                        child: Column(
                                          children: <Widget>[
                                            FlatButton(
                                              onPressed: () {
                                                /*...*/
                                              },
                                              child: Text(
                                                "-> Vehicle Inventory",
                                              ),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                /*...*/
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
                                                        builder: (context) =>
                                                            TaskList(
                                                                id, taskList)));
                                              },
                                              child: Text(
                                                "-> Task List",
                                              ),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                /*...*/
                                              },
                                              child: Text(
                                                "-> Defect List",
                                              ),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                /*...*/
                                              },
                                              child: Text(
                                                "-> Periodic Maintenance List",
                                              ),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                /*...*/
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
              // Image(
              //   image: AssetImage("images/arac.gif"),
              //   fit: BoxFit.cover,

              // ),
            ],
          ),
        )
*/
