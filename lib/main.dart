import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer audioplayer;
  String duration = "00:00:00";

  _MyAppState() {
    audioplayer = AudioPlayer();
    audioplayer.onAudioPositionChanged.listen((durasi) {
      setState(() {
        duration = durasi.toString();
      });
    });
    audioplayer.setReleaseMode(ReleaseMode.LOOP);
  }

  void playSound(String url) async{
    await audioplayer.play(url);
  }

  void pauseSound() async{
    await audioplayer.pause();
  }

  void resumeSound() async{
    audioplayer.resume();
  }

  void stopSound() async{
    await audioplayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Playing Music"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(child: Text("Play"), onPressed: () {
                playSound("http://23.237.126.42/ost/top-gear-2-sega-genesis/yzcalloe/01_Title%20Theme.mp3");
              }),
              RaisedButton(child: Text("Pause"), onPressed: () {
                pauseSound();
              }),
              RaisedButton(child: Text("Resume"), onPressed: () {
                resumeSound();
              }),
              RaisedButton(child: Text("Stop"), onPressed: () {
                stopSound();
              }),
              Text(
                duration,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
