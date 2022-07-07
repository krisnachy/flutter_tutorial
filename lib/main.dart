import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController(text: "No Name");
  bool isOn = false;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("nama", controller.text);
    pref.setBool("ison", isOn);
  }

  Future<String> getNama() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    //?? adalah if jika null return yang kanan, jika ada isi return yang kiri
    return pref.getString("nama") ?? "No Nama";
  }

  Future<bool> getOn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("ison") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan Sharedpreference"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
              ),
              Switch(
                  value: isOn,
                  onChanged: (newValue) {
                    setState(() {
                      isOn = newValue;
                    });
                  }),
              RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    saveData();
                  }),
              RaisedButton(
                  child: Text('Load'),
                  onPressed: () {
                    getNama().then((value) {
                      controller.text = value;
                      setState(() {});
                    });
                    getOn().then((value) {
                      isOn = value;
                      setState(() {});
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
