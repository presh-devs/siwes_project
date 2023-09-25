import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siwes_project/contstants/theme.dart';
import 'package:siwes_project/features/authenticate/views/signin_screen.dart';
import 'package:siwes_project/features/onboarding/provider/onboarding_provider.dart';
import 'package:siwes_project/features/onboarding/views/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
  ], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final completed = ref.watch(onboardingRepositoryProvider).onboardingComplete();
    return MaterialApp(
      //TODO change name later
      title: 'Flutter Demo',
      theme: ProjectTheme.materialTheme(context),
      debugShowCheckedModeBanner: false,
      home: completed ? const SignIn(): const OnboardingPage(),
    );
  }
}
