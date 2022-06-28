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
  String message = "Ini adala text";

  //anonymous method = method yang tidak punya nama
  // void tombolDiTekan() {
  //   setState(() {
  //     message = "Tombol sudah ditekan";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Anonymous Method'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              ElevatedButton(
                  // onPressed: tombolDiTekan,
                  //menggunakan anonymous jika hanya digunakan dalam satu tempat saja
                  onPressed: () {
                    setState(() {
                      message = "Tombol sudah ditekan";
                    });
                  },
                  child: const Text('Tekan Saya'))
            ],
          ),
        ),
      ),
    );
  }
}
