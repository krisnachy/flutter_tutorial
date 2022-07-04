import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Membuat list widget
  List<Widget> widgets = [];
  int counter = 1;

  //membuat constructor
  // _MyAppState() {
  //   for (var i = 0; i < 15; i++) {
  //     widgets.add(Text("Data ke-$i"));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan ListView'),
        ),
        //Jika menggunakan kolom ketika data melebihi layar akan overflow sehingga harus menggunakan listview
        // body: Column(
        //   children: widgets,
        // ),
        body: ListView(
          children: [
            Row(
              //sisa space akan dibagi rata jika menggunakan space aroun
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ElevatedButton(child: Text('Tambah Data'), onPressed: null,),
                // ElevatedButton(child: Text('Hapus Data'), onPressed: null,)
                ElevatedButton(
                  child: Text('Tambah Data'),
                  onPressed: () {
                    setState(() {
                      widgets.add(Text(
                        'Data ke-$counter',
                        style: TextStyle(fontSize: 20),
                      ));
                      counter++;
                    });
                  },
                ),
                ElevatedButton(
                  child: Text('Hapus Data'),
                  onPressed: () {
                    setState(() {
                      widgets.removeLast();
                      counter--;
                    });
                  },
                )
              ],
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: widgets)
          ],
        ),
      ),
    );
  }
}
