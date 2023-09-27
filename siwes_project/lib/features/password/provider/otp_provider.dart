import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountdownTimerNotifier extends StateNotifier<Duration> {
  CountdownTimerNotifier(Duration remainingTime) : super(remainingTime);

  Timer? _timer;

  void startTimer() {
    if (_timer != null && _timer!.isActive) {}

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state - const Duration(seconds: 1);

      if (state == Duration.zero) {
        _timer!.cancel();
      }
    });
  }

  // void resetTimer() {
  //   if (_timer != null && _timer!.isActive) {
  //     _timer!.cancel();
  //   }

  //   state = Duration.zero;
  // }
}

final countdownTimerProvider =
    StateNotifierProvider.autoDispose<CountdownTimerNotifier, Duration>((ref) {
  return CountdownTimerNotifier(const Duration(seconds: 30));
});
