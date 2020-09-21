import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier {

  int _count = 0;
  int _initialCount;

  Counter(this._count) {
    _initialCount = _count;
    print("count is $_count");
  }

  void increase() {
    _count++;
    notifyListeners();
  }

  void decrease() {
    _count--;
    print("count is $_count");
    notifyListeners();
  }

  void reset() {
    _count =_initialCount;
    notifyListeners();
  }

  int getCounter() => _count;
}
