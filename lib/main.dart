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
        home: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Latihan Tabbar"),
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.comment),
              text: "Comments",
            ),
            Tab(
              child: Image(
                image: AssetImage("assets/cute_icon.png"),
              ),
            ),
            Tab(
              icon: Icon(Icons.computer),
            ),
            Tab(
              text: "News",
            )
          ],
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Tab 1"),),
            Center(child: Text("Tab 2"),),
            Center(child: Text("Tab 3"),),
            Center(child: Text("Tab 4"),),
          ],
        ),
      ),
    ));
  }
}
