class FakeFault {
  String name;
  String message;
  String time;


  FakeFault({this.name, this.message, this.time});
}


List<FakeFault> fakeFault = [
    FakeFault(
        name: "Yazıcı",
        message: "Şase yandı?",
        time: "13:30",
        ),
    FakeFault(
        name: "Derin",
        message: "Fren çalışmıyor?",
        time: "14:30",
        ),
    FakeFault(
        name: "Sivas SK",
        message: "Akü bitti",
        time: "15:30",
       ),
  ];
 