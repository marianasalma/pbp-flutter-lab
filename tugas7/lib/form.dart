import 'dart:ffi';

import 'package:flutter/material.dart';

import 'main.dart';

import 'package:validators/validators.dart';

var allBudgetData = [];

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key, required this.listBudget});

  final List<Budget> listBudget;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = "";
  String _stringNominal = "";
  // Initial Selected Value
  String? dropdownvalue;
  var dataBudget = [];
  final fieldJudul = TextEditingController();
  final fieldNominal = TextEditingController();

  // List of items in our dropdown menu
  var items = [
    'Pemasukkan',
    'Pengeluaran',
  ];

  void saveData() {
    // setState(() {
    //   widget.listBudget.add(Budget(_judulBudget, _stringNominal, dropdownvalue));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
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
                // Route menu ke halaman form
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
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: fieldJudul,
                    decoration: InputDecoration(
                      hintText: "Contoh: Transportasi",
                      labelText: "Judul Budget",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judulBudget = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judulBudget = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: fieldNominal,
                    decoration: InputDecoration(
                      hintText: "Contoh: 100000",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _stringNominal = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _stringNominal = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          isNumeric(value) == false) {
                        return 'Nilai harus integer!';
                      }
                      return null;
                    },
                  ),
                ),
                DropdownButton(
                  // Initial Value
                  hint: const Text("Pilih Jenis"),
                  value: dropdownvalue,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option, it will
                  // change button value to selected value
                  onChanged: (String? value) {
                    setState(() {
                      dropdownvalue = value ?? "";
                    });
                  },
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    // saveData();
                    widget.listBudget.add(
                        Budget(_judulBudget, _stringNominal, dropdownvalue));
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Container(
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Center(child: const Text('Success')),
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  Center(
                                      child: Text(
                                          'Data budget berhasil disimpan')),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      fieldJudul.clear();
                                      fieldNominal.clear();
                                      allBudgetData.add(dataBudget);
                                      dataBudget.clear();
                                    },
                                    child: const Text('Kembali'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key, required this.listBudget});

  final List<Budget> listBudget;

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> mywidgets = [];
    var len = allBudgetData.length;

    for (int x = 0; x < widget.listBudget.length; x++) {
      mywidgets.add(Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(widget.listBudget[x].judul),
              Row(children: <Widget>[
                Text(widget.listBudget[x].nominal),
                Spacer(),
                Text(widget.listBudget[x].jenis ?? ""),
              ])
            ],
          )));
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
                // Route menu ke halaman form
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
          ],
        ),
      ),
      body: Column(children: mywidgets),
    );
  }
}
