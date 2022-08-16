import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_yt/bloc/color_bloc.dart';
import 'package:flutter_yt/bloc/counter_bloc.dart';
import 'package:flutter_yt/ui/draft_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => DraftPage(
        backgroundColor: color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (context, count) => GestureDetector(
                  onTap: () {
                    counterBloc.dispatch(count + 1);
                  },
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      colorBloc.dispatch(ColorEvent.toPink);
                    },
                    color: Colors.pink,
                    shape: (color == Colors.pink)
                        ? const CircleBorder(
                            side: BorderSide(color: Colors.black, width: 3))
                        : const CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {
                      colorBloc.dispatch(ColorEvent.toAmber);
                    },
                    color: Colors.amber,
                    shape: (color == Colors.amber)
                        ? const CircleBorder(
                            side: BorderSide(color: Colors.black, width: 3))
                        : const CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {
                      colorBloc.dispatch(ColorEvent.toPurple);
                    },
                    color: Colors.purple,
                    shape: (color == Colors.purple)
                        ? const CircleBorder(
                            side: BorderSide(color: Colors.black, width: 3))
                        : const CircleBorder(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
