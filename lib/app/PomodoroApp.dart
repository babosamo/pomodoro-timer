import 'package:flutter/material.dart';
import 'package:pomodoro_timer/model/Count.dart';
import 'package:pomodoro_timer/screen/FirstPage.dart';
import 'package:provider/provider.dart';

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Counter>(
        create: (_) => Counter(1),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FirstPage(title: 'Flutter Demo Home Page'),
        )
    );
  }
}