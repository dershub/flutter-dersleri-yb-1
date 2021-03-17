import 'dart:math';

import 'package:flutter/material.dart';

asenkronIslem1() async {
  await Future.delayed(Duration(seconds: 13));

  print("Merhaba Dünya 1");
}

asenkronIslem2() async {
  await Future.delayed(Duration(seconds: 2));
  print("Merhaba Dünya 2");
}

asenkronIslem3() async {
  print("Merhaba Dünya 3");
}

asenkronIslem4() async {
  print("Merhaba Dünya 4");
}

asenkronIslem5() async {
  print("Merhaba Dünya 5");
}

Future<String> senkronIslem() async {
  for (List sayilar = [];
      sayilar.length < 10;
      sayilar.add(Random().nextInt(100))) {
    print(sayilar);
  }

  asenkronIslem1();

  await asenkronIslem2();

  asenkronIslem3();
  asenkronIslem4();
  asenkronIslem5();

  return "Başarıyla tamamlandım";
}

// Iterable => adim adim işlenebilen
// Stream => asenkron iterable

List<int> altiyaKadarDogalSayilar = [0, 1, 2, 3, 4, 5, 6];
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

Iterable<int> eyeKadarDogalSayilar(int e) sync* {
  for (int i = 0; i <= e; i++) {
    yield i;
  }
}

List urleler = [
  "url1",
  "url2",
  "url3",
  "url4",
];

Stream<int> rastgeleSuredeElemanOlustur(int e) async* {
  for (int i = 0; i <= e; i++) {
    Random r = Random();
    await Future.delayed(Duration(seconds: r.nextInt(e)));
    int gi = await Future.value(r.nextInt(e));
    yield gi;
  }
}

class AsenkronDers extends StatelessWidget {
  @override
  Widget build(BuildContext adres) {
    rastgeleSuredeElemanOlustur(15).listen((int deger) {
      print(deger);
    });

    List ikiyeKadarDS = [];
    ikiyeKadarDS.add(0);
    ikiyeKadarDS.add(1);
    ikiyeKadarDS.add(2);

    List<int> yediyeKadarDS = eyeKadarDogalSayilar(7).toList();

    print(altiyaKadarDogalSayilar);
    print(yediyeKadarDS);
    print(eyeKadarDogalSayilar(17).toSet());

    senkronIslem()
        .then((deger) => print(deger))
        .catchError((hata) => print(hata))
        .whenComplete(
            () => print("whenComplete finally gibi her halukarda çalışır"))
        .timeout(Duration(seconds: 10));

    return Scaffold(
      appBar: AppBar(
        title: Text("Asenkron Ders"),
      ),
    );
  }
}
