import 'package:cars/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final aluCard = Hero(
      tag: "hero",
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("images/abc.png"),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "VİRAMES",
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
    );

    final about = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Virames V4 Proje Yönetimi, Bir sizden, iki bizden… Fikirleri en doğru yoldan projelere dönüştürüyoruz. Ürüne ve projeye dayalı üretim yapılabiliyor, projeye dayalı üretimin kontrolünü sağlamanıza olanak veriyoruz…Virames V4 Üretim Planlama, Cevaplar cebimizde… Hammadde halinden ürün haline gelene kadar olan tüm yaşam döngüsünün merkezindeyiz. Her aşama kontrolümüz altında. Kaliteden, maliyete, zamandan iş gücüne kadar…",
        style: TextStyle(fontSize: 15.0, color: Colors.black),
      ),
    );
    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[aluCard, welcome, about],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("HAKKINDA"),
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
      body: body,
    );
  }
}
