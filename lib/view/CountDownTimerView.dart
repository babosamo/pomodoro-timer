import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pomodoro_timer/model/Count.dart';
import 'package:pomodoro_timer/util/ColorUtil.dart';
import 'package:pomodoro_timer/util/DateUtil.dart';
import 'package:provider/provider.dart';

import 'CountDownTimerPainter.dart';

class CountDownTimerView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CountDownTimerView();

}

class _CountDownTimerView extends State<CountDownTimerView>
    with TickerProviderStateMixin {

  Timer _timer;
  String _buttonTitle = "시작";

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final counter = Provider.of<Counter>(context);
    controller.duration = Duration(seconds: counter.getCounter());

    void _startTimer() {
      if (_timer == null) {
        setState(() {
          _buttonTitle = "정지";
        });

        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          counter.decrease();
        });
      } else {
        if (_timer.isActive) {
          setState(() {
            _buttonTitle = "시작";
          });

          counter.reset();
          _timer.cancel();
          _timer = null;
        }
      }

      if (controller.isAnimating) {
        controller.duration = Duration(seconds: counter.getCounter());
        controller.reverse(from: 0.0);
        controller.stop();
      } else {
        controller.reverse(
            from: controller.value == 0.0
                ? 1.0
                : controller.value);
      }
    }

    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget child) {
                        return CustomPaint(
                            painter: CountDownTimerPainter(
                              animation: controller,
                              backgroundColor: HexColor("#50ffffff"),
                              color: Colors.white,
                            )
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.center,
                    child: Text(
                        '${constructTime(counter.getCounter())}' ?? "",
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white
                        )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              color: HexColor("#ff0f53"),
              textColor: Colors.white,
              child: Text(
                "$_buttonTitle",
              ),
              padding: EdgeInsets.all(24),
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.white)
              ),
              onPressed: _startTimer,
            ),
          ],
        ),
      ),
    );
  }
}
