import 'package:cars/utilities/constants.dart';
import 'package:cars/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(Login());
class Urls{
  static const BASE_API_URL = "http://rest.virames.com.tr/GetVehicleList";
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
      routes: Routes.routes,
      // initialRoute: '/',
      // routes: {
      //   '/':(context)=>LoginPage(),
      //   '/dashBoard' :(context)=>menuDashboardPage()
      // },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("images/login.png"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 20.0))),
                  child: Container(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Kullanıcı Adı",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Şifre",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                        ),
                        Padding(padding: const EdgeInsets.only(top: 20.0)),
                        MaterialButton(
                          height: 40.0,
                          minWidth: 90.0,
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text(
                            "Giriş",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(Constants.ROUTE_DASHBOARD);
                          },
                          splashColor: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
