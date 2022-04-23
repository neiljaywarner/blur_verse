import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blur Wrapper widget',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Blur Wrapper widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double blurValue = 10;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String blurValueStr = blurValue.toStringAsFixed(2);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Wrap(
              children:
                'He is before all things and in him all things hold together'.split(' ').map((e) {
                  return MyBlur(e, shouldBlur: shouldBlur(blurValue));
                }).toList()


            ),
            Slider(
              value: blurValue,
              max: 20,
              onChanged: (double value) => setState(() => blurValue = value),
            )
          ],
        ),
      ),
    );
  }
}

bool shouldBlur(double blurValue) => Random().nextInt(20) < blurValue.toInt();

class MyBlur extends StatelessWidget {
  const MyBlur(this.text, {Key? key, this.shouldBlur = true}) : super(key: key);

  final String text;
  final bool shouldBlur;
  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: shouldBlur ?  3.2 : 0,
      blurColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }
}
