import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

enum ColorEvent { to_amber, to_light_blue }

class ColorBloc {
  Color _color = Colors.amber;

  //bisa dikatakan untuk mengurusi input
  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  //bisa dikatakan untuk menampilkan hasil
  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_amber)
      _color = Colors.amber;
    else
      _color = Colors.lightBlue;

    //menyambungkan event ke state
    _stateSink.add(_color);
  }

  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  //berfungsi untuk membereskan 'selang' atau stream, karena terus emakan memori
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
