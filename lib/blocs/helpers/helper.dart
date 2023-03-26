import 'dart:async';

String formatDuration(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;
  return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
}

//timer function return 1 second periodically
Stream<int> timerStream() {
  return Stream.periodic(Duration(seconds: 1), (count) {
    return count;
  });
}
