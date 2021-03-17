import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dart_code_viewer/dart_code_viewer.dart';
import 'package:flutter/material.dart';

import '../code.dart';

class EskiAnasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext adres) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            TypewriterAnimatedTextKit(
              speed: Duration(milliseconds: 200),
              totalRepeatCount: 4,
              text: ["do IT!", "do it RIGHT!!", "do it RIGHT NOW!!!"],
              textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              pause: Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            Expanded(child: DartCodeViewer.light(codeString)),
          ],
        ),
      ),
    );
  }
}
