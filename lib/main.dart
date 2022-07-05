import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Inkwell untuk memmebrikan warna gradasi pada button tidak seperti elevated button

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Material app adalah widget yg berisi data-data yg diperlukan oleh app yg menggunakan material design
    return MaterialApp(
      //tampilan awal yang akan ditampilkan oleh material app
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Membuat Button"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () {},
              color: Colors.amber,
              shape: const StadiumBorder(),
              child: const Text("Raised Button"),
            ),
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.pink],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Material(
                //harus dikasih transparan karena material numpuk
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  splashColor: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: const Text(
                    "My Button",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
