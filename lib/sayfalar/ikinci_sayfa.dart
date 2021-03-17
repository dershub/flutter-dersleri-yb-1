import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// interface => arayüz => kalıp :: tam soyut kavramlar
abstract class Madde {
  int hacim;
  int hacmiHesapla();
  int kutleHesapla();
  String konumBul();
}

abstract class Canli extends Madde {
  // abstract => soyut
  int maxYas;

  // erişim işaretleri
  // _ private => tamamen sınıf içine özel
  // protected => sınıfa ve alt sınıflarına özel
  // internal =>
  // public => kamuya açık

  int _dogumYili;

  void islemYap() {}

  bool solunumYap(bool oksijen) {
    bool karbondioksit = !oksijen;

    // oksijen vücuda alınır
    // oksijeni hucreye ilet
    // hücreden karbondioksit alınır
    // vücudun dışına atılır

    return karbondioksit;
  }

  @override
  int hacmiHesapla() {
    // TODO: implement hacmiHesapla
    throw UnimplementedError();
  }

  @override
  String konumBul() {
    // TODO: implement konumBul
    throw UnimplementedError();
  }

  @override
  int kutleHesapla() {
    // TODO: implement kutleHesapla
    throw UnimplementedError();
  }

  // soyut işlem tanımlama
  // soyut işlemler kalıtımda override edilmek zorundadırlar
  String ure();
}

class Aycicegi extends Canli {
  int _yaprakSayisi;

  @override
  int maxYas = 5;

  @override // tekrar tanımlamama
  bool solunumYap(bool oksijen) {
    // vücuda difuzyon ile girer
    // vücuttaki co2 miktarı artınca dışarı attı
    return super.solunumYap(oksijen);
  }

  @override
  String ure() {
    return "String";
  }
}

class Cekirdek extends Aycicegi {}

class Balik extends Canli {
  @override
  bool solunumYap(bool oksijen) {
    // solungaç yardımızya sudaki oksijeni vücut içine alıcak
    return super.solunumYap(oksijen);
  }

  @override
  String ure() {
    // TODO: implement ure
    throw UnimplementedError();
  }
}

class Insan extends Canli {
  @override
  bool solunumYap(bool o2) {
    return super.solunumYap(o2);
  }

  @override
  String ure() {
    // TODO: implement ure
    throw UnimplementedError();
  }
}

class IkinciSayfa extends StatefulWidget {
  // tamamen abstract (soyut) classlar (kavramlar) (sonradan işlenecek)

  @override
  _IkinciSayfaState createState() {
    print("createState: Ben burada bazı şeyler yapmak istiyorum çok erken");
    // print("mounted: $mounted");
    return _IkinciSayfaState();
  }
}

class _IkinciSayfaState extends State<IkinciSayfa> {
  int sayi = 0;
  Random random = Random();

  // soyut kavramlardan ornek olaşturamazsınız
  // Canli c1 = Canli();

  Aycicegi a1 = Aycicegi();

  void sayiyiArtir() {
    print(a1._yaprakSayisi);
    print(a1._dogumYili);

    try {
      print("sayi");
      sayi = sayi + int.parse("bir");
      print(sayi);
    } catch (fHata, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
    } finally {
      sayi++;
      setState(() {});
    }
  }

  Future<String> getData() async {
    final cevap = await http.get(
        "https://raw.githubusercontent.com/ozanerturk/covid19-turkey-api/master/dataset/timeline.json");

    if (cevap.statusCode == 200) {
      return cevap.body;
    } else {
      throw Exception(
          "Veriler Getirilirken Hata Oluştu. Hata Kodu: ${cevap.statusCode}");
    }
  }

  @override
  void initState() {
    print("mounted: $mounted");

    print("initState: Burada yine birşeyler yapmak istiyorum");
    print("context: $context");

    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("context: $context");
    print("didChangeDependencies: Burada yine birşeyler yapmak istiyorum");

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext c) {
    // burada mümkün mertebe burada
    /* void sayiyiArtir() {
      sayi++;
      print("sayi");
      print(sayi);

      setState(() {
        print("setState: Burada yine birşeyler yapmak istiyorum");
      });
    } */

    // build => ekrana çiz
    print("Ekrana çiz fonksiyonu çağrıldı");

    return Scaffold(
      backgroundColor: Color.fromARGB(
        255,
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
      ),
      appBar: AppBar(
        title: Text("İkinci Sayfa $sayi"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: sayiyiArtir,
          ),
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (_, s) {
          return Center(
            child: Text(s.hasData ? s.data : "waiting"),
          );
        },
      ),
    );
  }

  @override
  void didUpdateWidget(IkinciSayfa eskiWidget) {
    print("didUpdateWidget: Burada yine birşeyler yapmak istiyorum");
    print(eskiWidget);

    super.didUpdateWidget(eskiWidget);
  }

  @override
  void deactivate() {
    print("deactivate: Burada yine birşeyler yapmak istiyorum");

    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose: Burada yine birşeyler yapmak istiyorum");
    super.dispose();
  }
}
