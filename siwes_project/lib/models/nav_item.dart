import 'package:flutter/material.dart';


List<BottomNavigationBarItem> navBarItems = [
  //TODO replace icon with svg
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
  const BottomNavigationBarItem(
      icon: Icon(Icons.notifications), label: 'Notifications'),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
];
