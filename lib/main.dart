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
          title: const Text("Flexible Layout"),
        ),
        body: Column(
          children: [
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.red,
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.green,
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.purple,
                        )),
                  ],
                )),
            Flexible(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                )),
            Flexible(
                flex: 1,
                child: Container(
                  color: Colors.yellow,
                )),
          ],
        ),
      ),
    );
  }
}
