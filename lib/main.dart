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
  int number = 0;
  void tekanTombol() {
    // number = number+1;
    //perintah untuk merefresh tampilan karena jika tidak menggunakan setstate maka fungsi sudah berjalan tetapi tampilan belum berubah
    setState(() {
      number = number + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Statefull Widget Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("12"),
              Text(number.toString()),
              ElevatedButton(
                  onPressed: tekanTombol,
                  child: Text(
                    'Tambah Bilangan',
                    style: TextStyle(fontSize: 10 + number.toDouble()),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
