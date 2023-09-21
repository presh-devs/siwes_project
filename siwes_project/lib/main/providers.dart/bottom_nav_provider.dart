
import 'package:flutter_riverpod/flutter_riverpod.dart';


class BottomNavbarStateNotifer extends StateNotifier<int> {
  BottomNavbarStateNotifer() : super(0);

  void gotoSection(int index,) {
    state = index;
  }
}

final bottomNavbarProvider = StateNotifierProvider<BottomNavbarStateNotifer, int>(
  (ref) => BottomNavbarStateNotifer(),
);
