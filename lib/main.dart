import 'package:flutter/material.dart';
import 'package:flutter_yt/application_color.dart';
import 'package:provider/provider.dart';

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
      home: ChangeNotifierProvider<ApplicationColor>(
        builder: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                "Provider State Management",
                style: TextStyle(color: applicationColor.color),
              ),
            ),
          ),
          body: Center(
              child: Column(
            children: [
              Consumer<ApplicationColor>(
                builder: (context, applicationCOlor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: applicationCOlor.color,
                    duration: Duration(milliseconds: 500)),
              ),
              Row(
                children: [
                  Container(margin: EdgeInsets.all(5), child: Text("AB")),
                  Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Switch(
                          value: applicationColor.isLightBlue,
                          onChanged: (newValue) {
                            applicationColor.isLightBlue = newValue;
                          })),
                  Container(margin: EdgeInsets.all(5), child: Text("LB")),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
