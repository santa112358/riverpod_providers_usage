import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final futureProvider = FutureProvider.autoDispose<String>(
  (ref) async {
    await Future<void>.delayed(
      const Duration(milliseconds: 400),
    );
    return 'Future completed';
  },
);

class FutureProviderExample extends HookConsumerWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider'),
      ),
      body: Center(
        child: state.when(
          data: (data) {
            return Text(data);
          },
          error: (e, s) {
            return const Text('error');
          },
          loading: () {
            return const Text('loading');
          },
        ),
      ),
    );
  }
}
