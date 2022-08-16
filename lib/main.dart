import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_yt/bloc/color_bloc.dart';
import 'package:flutter_yt/bloc/counter_bloc.dart';
import 'package:flutter_yt/ui/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Material app adalah widget yg berisi data-data yg diperlukan oleh app yg menggunakan material design
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(builder: (context) => ColorBloc()),
        BlocProvider<CounterBloc>(builder: (context) => CounterBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //tampilan awal yang akan ditampilkan oleh material app
        home: MainPage(),
      ),
    );
  }
}
