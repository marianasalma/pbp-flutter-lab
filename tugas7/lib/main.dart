import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Program Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _text = 'GENAP';
  bool genap = true;
  bool isNotZero = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter>0) {
        isNotZero = true;
      }
      if (_counter % 2 == 0) {
        _text = 'GENAP';
        genap=true;
      } else {
        _text = 'GANJIL';
        genap=false;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter==0) {
        isNotZero = false;
      }
      if (_counter % 2 == 0) {
        _text = 'GENAP';
        genap=true;
      } else {
        _text = 'GANJIL';
        genap=false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text, style: TextStyle(color: genap==true?Colors.red:Colors.blue),),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(visible: isNotZero, child: 
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                )
                ),
                const SizedBox(width: 100),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
