import 'package:flutter/material.dart';

class DraftPage extends StatelessWidget {
  const DraftPage({Key key, this.backgroundColor = Colors.pink, this.body}) : super(key: key);

  final Color backgroundColor;
  final Widget body;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('MultiBloc'),
      ),
      body: body,
    );
  }
}