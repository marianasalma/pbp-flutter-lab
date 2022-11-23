import 'package:flutter/material.dart';

import 'page/form.dart';
import 'page/watch.dart';


void main() {
  runApp(const MyApp());
}

class Budget {
  final String judul;
  final String nominal;
  final String? jenis;

  const Budget(this.judul, this.nominal, this.jenis);
}

List<Budget> listBudget = [];

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
      home: MyHomePage(title: 'Program Counter', listBudget: listBudget),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.listBudget});

  final String title;
  List<Budget> listBudget;

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
      if (_counter > 0) {
        isNotZero = true;
      }
      if (_counter % 2 == 0) {
        _text = 'GENAP';
        genap = true;
      } else {
        _text = 'GANJIL';
        genap = false;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter == 0) {
        isNotZero = false;
      }
      if (_counter % 2 == 0) {
        _text = 'GENAP';
        genap = true;
      } else {
        _text = 'GANJIL';
        genap = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Menambahkan drawer menu
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            title: 'Program Counter',
                            listBudget: widget.listBudget,
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyFormPage(
                            listBudget: widget.listBudget,
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyDataPage(
                            listBudget: widget.listBudget,
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('My Watch List'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyWatchList(listBudget: widget.listBudget,)),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text,
              style: TextStyle(color: genap == true ? Colors.red : Colors.blue),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(
                    visible: isNotZero,
                    child: FloatingActionButton(
                      onPressed: _decrementCounter,
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    )),
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
