import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siwes_project/features/connection_monitor/connection_monitor.dart';
import 'package:siwes_project/main/providers.dart/bottom_nav_provider.dart';
import 'package:siwes_project/models/nav_item.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const []);
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final currentScreen= ref.watch(bottomNavbarProvider);

    return SizedBox.expand(
      child: Scaffold(
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ConnectionMonitor(
                child:navScreens[currentScreen] ,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
                  items: navBarItems,
                  unselectedItemColor: Colors.black,
                  selectedItemColor: Colors.red,
                  currentIndex: ref.read(bottomNavbarProvider),
                  onTap: (index) {
                    ref.read(bottomNavbarProvider.notifier).gotoSection(
                          index,
                        );
                  },
                ),
      ),
    );
  }
}
