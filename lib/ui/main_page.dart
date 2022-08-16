import 'package:flutter/material.dart';
import 'package:flutter_yt/ui/draft_page.dart';
import 'package:flutter_yt/ui/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraftPage(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '0',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text(
                "Click to Change",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.pink,
              shape: StadiumBorder(),
            )
          ],
        ),
      ),
    );
  }
}
