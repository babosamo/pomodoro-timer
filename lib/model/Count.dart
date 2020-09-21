class Counter {

  int _count = 0;

  Counter(this._count);

  void increase() {
    _count++;
  }

  void reset() {
    _count = 0;
  }

  int getCounter() {
    return _count;
  }
}
