
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNotifier extends StateNotifier<int> {
  PageNotifier() : super(0);

  changePage() {
    if (state < 2) {
      state = state + 1;
    } else {
      return;
    }
  }

  dotClicked(index) {
    state = index;
   
  }
}

final pageProvider = StateNotifierProvider<PageNotifier, int>((ref) {
  return PageNotifier();
});
