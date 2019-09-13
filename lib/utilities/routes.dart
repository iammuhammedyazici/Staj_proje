import 'package:cars/screens/about.dart';
import 'package:cars/screens/buyDemand.dart';
import 'package:cars/screens/dashboard.dart';
import 'package:cars/screens/faultNotifications.dart';
import 'package:cars/screens/forms.dart';
import 'package:cars/screens/insurance.dart';
import 'package:cars/screens/messages.dart';
import 'package:cars/screens/plugs.dart';
import 'package:cars/screens/rentacar.dart';
import 'package:cars/screens/tools.dart';
import 'package:cars/screens/vehicledemand.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_MESSAGES: (BuildContext context) => Messages(),
    Constants.ROUTE_DASHBOARD: (BuildContext context) => DashboardPage(),
    Constants.ROUTE_VEHICLEDEMAND: (BuildContext context) => VehicleDemand(),
    Constants.ROUTE_FAULTNOTIFICATION: (BuildContext context) =>
        FaultNotification(),
    Constants.ROUTE_TOOLS: (BuildContext context) => Tools(),
    Constants.ROUTE_RENTACAR: (BuildContext context) => RentCar(),
    Constants.ROUTE_INSURANCE: (BuildContext context) => Insurance(),
    Constants.ROUTE_BUYDEMAND: (BuildContext context) => BuyDemand(),
    Constants.ROUTE_ABOUT: (BuildContext context) => About(),
    Constants.ROUTE_PLUGS: (BuildContext context) => Plugs(),
    Constants.ROUTE_FORMS: (BuildContext context) => Forms(),
    // Constants.ROUTE_MYAPP:(BuildContext context)=> Ascli(),
  };
}
