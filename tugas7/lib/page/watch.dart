import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:tugas7/model/watch_data.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

import 'package:validators/validators.dart';

import 'form.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({super.key, required this.listBudget});
  final List<Budget> listBudget;
  @override
  _MyWatchListState createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<List<WatchList>> fetchWatchList() async {
      var url =
          Uri.parse('https://katalogsalma.herokuapp.com/mywatchlist/json/');
      var response = await http.get(
        url,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
      );

      // melakukan decode response menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // melakukan konversi data json menjadi object WatchList
      List<WatchList> listWatch = [];
      for (var d in data) {
        if (d != null) {
          listWatch.add(WatchList.fromJson(d));
        }
      }

      return listWatch;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
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
                title: const Text('Form'),
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
                  // Route menu ke halaman utama
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
                  // Route menu ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyWatchList(
                              listBudget: widget.listBudget,
                            )),
                  );
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: fetchWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyWatchListDetail(
                                              data: snapshot.data![index],
                                              listBudget: widget.listBudget,
                                            )));
                              },
                              child: Text(
                                "${snapshot.data![index].fields.title}",
                                // style: const TextStyle(
                                //   fontSize: 18.0,
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                            ),
                          ));
                }
              }
            }));
  }
}

class MyWatchListDetail extends StatefulWidget {
  final WatchList data;
  const MyWatchListDetail(
      {super.key, required this.listBudget, required this.data});
  final List<Budget> listBudget;

  @override
  State<MyWatchListDetail> createState() => _MyWatchListDetailState();
}

class _MyWatchListDetailState extends State<MyWatchListDetail> {
  // WatchList? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
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
              title: const Text('Form'),
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
                      builder: (context) => MyWatchList(
                            listBudget: widget.listBudget,
                          )),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text(widget.data.fields.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Release Date  : ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(widget.data.fields.releaseDate,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Rating    : ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(widget.data.fields.rating.toString() + "/10",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Status    : ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(
                    widget.data.fields.watched
                        ? "Sudah ditonton"
                        : "Belum ditonton",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Review   : ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(widget.data.fields.review,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'))),
        const SizedBox(
          height: 50,
        ),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.blue,
        //     minimumSize: Size.fromHeight(50),
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Text(
        //     'Back',
        //     style: TextStyle(fontSize: 12),
        //   ),
        // ),
      ],
    );
  }
}
