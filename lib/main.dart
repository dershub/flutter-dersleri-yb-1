import 'package:flutter/material.dart';

import 'sayfalar/asenkron_ders.dart';
import 'sayfalar/ikinci_sayfa.dart';

// liste metotları medium linki: https://hubders.medium.com/kullan%C4%B1%C5%9Fl%C4%B1-liste-metodlar%C4%B1-d0ecf2860619
// diagram linki: https://drive.google.com/file/d/1Z15ihJB2wVkHeGdvWfR8I94wDOM6MgZa/view?usp=sharing
// ödev https://dart.dev/samples buradaki örnekleri kendi örneklerinizle değiştirerek tekrardan yazın

// https://docs.google.com/spreadsheets/d/1XMObfC3FVXkUejidOgKHvrhmaPqUy25pMruXJWdKFMI/edit?ts=602429d4#gid=1239209870

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title:
              "Anasayfa başlığı") /* Scaffold(body: Anasayfa(title: 'Flutter Demo Home Page')) */,
    );
  }
}

class Anasayfa extends StatefulWidget {
  Anasayfa({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnasayfaDurumu createState() {
    _AnasayfaDurumu ad1 = _AnasayfaDurumu();
    return ad1;
  }
}

class _AnasayfaDurumu extends State<Anasayfa> {
  @override
  Widget build(BuildContext kb) {
    return Center(
      child: KirmiziYazi("Kirmizi Yazi"),
    );
  }
}

class KirmiziYazi extends Text {
  KirmiziYazi(String data) : super(data, style: TextStyle(color: Colors.red));
}

class SiyahKutu {
  String rengi;
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    print("Butona basıldı");
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext kb) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.near_me),
            onPressed: () {
              Navigator.of(kb).push(
                MaterialPageRoute(
                  builder: (BuildContext k) {
                    /* return Scaffold(
                      appBar: AppBar(
                        title: Text("İkinci Sayfa Adressiz"),
                      ),
                    ); */
                    return IkinciSayfa();
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.accessibility_new_outlined),
            onPressed: () {
              Navigator.of(kb).push(
                MaterialPageRoute(
                  builder: (BuildContext k) {
                    /* return Scaffold(
                      appBar: AppBar(
                        title: Text("İkinci Sayfa Adressiz"),
                      ),
                    ); */
                    return AsenkronDers();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(child: AsenkronDers()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
