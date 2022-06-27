import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Material app adalah widget yg berisi data-data yg diperlukan oleh app yg menggunakan material design
    return MaterialApp(
      //tampilan awal yang akan ditampilkan oleh material app
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Aplikasi Hello World"),
        ),
        body: Center(
            child: Container(
                color: Colors.lightBlue,
                width: 150,
                height: 50,
                child: const Text(
                  "Saya sedang melatih kemampuan flutter saya",
                  maxLines: 2,
                  //elipsis jika terpotong memberikan titik titik
                  //clip benar-benar dipotong
                  overflow: TextOverflow.ellipsis,
                  //default bernilai true, kalo false text tidak akan ditaruh ke bawah
                  softWrap: false,
                  //mengatur text ditampilkan apakah rata kanan kiri justify dll
                  textAlign: TextAlign.center,
                  //style mengatur gaya font
                  style: TextStyle(color: Colors.white),
                ))),
      ),
    );
  }
}
