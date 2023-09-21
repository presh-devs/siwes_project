
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = FutureProvider<Connectivity>((ref) {
  final connectivity = Connectivity();
  return connectivity;
});

final connectivityStreamProvider = StreamProvider<ConnectivityResult>((ref) {
  return ref.read(connectivityProvider).value!.onConnectivityChanged;
});