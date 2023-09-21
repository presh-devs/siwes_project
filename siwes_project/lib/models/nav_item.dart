import 'package:flutter/material.dart';
import 'package:siwes_project/features/notifications/views/notification_page.dart';
import 'package:siwes_project/features/profile/views/profile_page.dart';
import 'package:siwes_project/features/review/views/review_page.dart';
import 'package:siwes_project/features/search/views/search_page.dart';


List<BottomNavigationBarItem> navBarItems = [
  //TODO replace icon with svg
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
  const BottomNavigationBarItem(
      icon: Icon(Icons.notifications), label: 'Notifications'),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
];

List<Widget> navScreens = const [
  ReviewPage(),
  SearchPage(),
  NotificationPage(),
  ProfilePage(),
];