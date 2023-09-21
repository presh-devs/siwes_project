import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:siwes_project/features/connection_monitor/providers/connection_monitor_providers.dart';

@immutable
class ConnectionMonitor extends ConsumerWidget {
  const ConnectionMonitor({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivity = ref.watch(connectivityProvider);
    final connectivityStream = ref.watch(connectivityStreamProvider);
    return connectivity.when(
      data: (data) {
        return connectivityStream.when(
          data: (data) {
            final result = connectivityStream.value;
            return Stack(
              children: [
                child,
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    alignment: Alignment.topCenter,
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor:
                          result != ConnectivityResult.none ? 0.0 : 1.0,
                      child: Material(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0) + const EdgeInsets.symmetric(horizontal: 12.0),
                          child: const Text(
                            'Please check your internet connection',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return const SizedBox();
          },
          loading: () => const SizedBox(),
        );
      },
      error: (error, stackTrace) {
        return const SizedBox();
      },
      loading: () => const SizedBox(),
    );
  }
}
