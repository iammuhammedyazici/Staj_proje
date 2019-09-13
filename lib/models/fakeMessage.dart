class FakeMessage {
  String name;
  String message;
  String time;
  String avatarUrl;

  FakeMessage({this.name, this.message, this.time, this.avatarUrl});
}

List<FakeMessage> fakeDataGelen = [
    FakeMessage(
        name: "Yazıcı",
        message: "Araçlar ne durumda?",
        time: "13:30",
        avatarUrl:
            ""),
    FakeMessage(
        name: "Derin",
        message: "Mercedes Vito yıllık kiralarınız da indirim yapıyor musunuz?",
        time: "14:30",
        avatarUrl:
            ""),
    FakeMessage(
        name: "Sivas SK",
        message: "10 tane araç lazım bugün teslim edilmesi gerek",
        time: "15:30",
        avatarUrl:
            ""),
  ];
  List<FakeMessage> fakeDataGiden = [
    FakeMessage(
        name: "Sivas SK",
        message: "Araçlarınız ayarlandı. Alabilirsiniz?",
        time: "13:30",
        avatarUrl:
            ""),
    FakeMessage(
        name: "Derin",
        message: "Tabi ki aracınızın kullanım şartlarını öğrenmemiz gerekiyor öncelikle?",
        time: "14:30",
        avatarUrl:
            ""),
    FakeMessage(
        name: "Sivas SK",
        message: "Yolda",
        time: "15:30",
        avatarUrl:
            ""),
  ];
