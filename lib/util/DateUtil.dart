/// seconds to MM:SS
String constructTime(int seconds) {
  int minute = seconds % 3600 ~/ 60;
  int second = seconds % 60;
  return formatTime(minute) + ":" + formatTime(second);
}

String formatTime(int timeNum) {
  return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
}