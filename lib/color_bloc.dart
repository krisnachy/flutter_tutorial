import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ColorEvent {to_amber, to_light_blue}

//diubah ke hydratedbloc
// class ColorBloc extends Bloc<ColorEvent, Color> {
class ColorBloc extends HydratedBloc<ColorEvent, Color> {
  //ketika menggunakan bloc dart tidak perlu filed untuk menyimpan state
  // Color _color = Colors.amber;
  
  //tanda tanya 2kali untuk mengecek apakah null
  @override
  Color get initialState => super.initialState ?? Colors.amber;
  
  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    /*
    TIDAK PERLU JIKA MENGGUNAKAN BLOC
    _color = (event == ColorEvent.to_amber) ? Colors.amber : Colors.lightBlue;
    yield adalah perintah memasukkan data ke dalam stream
    yield _color; */
    //selain mengembalikan stream akan mengupdate state
    yield (event == ColorEvent.to_amber) ? Colors.amber : Colors.lightBlue;
  }
  
  @override
  Color fromJson(Map<String, dynamic> json) {
    try {
      return Color(json['color'] as int);
    } catch (e) {
      return null;
    }
  }
  
  @override
  Map<String, int> toJson(Color state) {
    try {
      //.value untuk mengubah ke int
      return {'color': state.value};
    } catch (e) {
      return null;
    }
  }
}