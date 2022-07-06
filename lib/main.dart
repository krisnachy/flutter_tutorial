import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
          title: const Text("Latihan QR"),
        ),
        body: Center(
          child: QrImage(
            version: 6,
            backgroundColor: Colors.grey,
            foregroundColor: Colors.black,
            errorCorrectionLevel: QrErrorCorrectLevel.M,
            padding: EdgeInsets.all(5),
            size: 300,
            data: "https://www.youtube.com/watch?v=7CFAEXymRvM&list=PLZQbl9Jhl-VACm40h5t6QMDB92WlopQmV&index=32",
          )
          ),
      ),
    );
  }
}
