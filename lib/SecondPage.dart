import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Second')),
        body: RaisedButton(
          child: Text('이전 페이지로'),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
