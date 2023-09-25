
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siwes_project/features/onboarding/data/onboarding_repository.dart';

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

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  
  throw UnimplementedError();
});

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
 
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  
  return OnboardingRepository(sharedPreferences);
});