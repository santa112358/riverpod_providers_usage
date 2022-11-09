import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stateProvider =
    StateNotifierProvider.autoDispose<SampleStateNotifier, int>(
  (ref) => SampleStateNotifier(),
);

class SampleStateNotifier extends StateNotifier<int> {
  SampleStateNotifier() : super(0);

  void increment() {
    state++;
  }
}

class StateNotifierProviderStateExample extends HookConsumerWidget {
  const StateNotifierProviderStateExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifierProvider StateProvider sample'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(stateProvider.notifier).increment();
        },
      ),
      body: Center(
        child: Text(
          '${ref.watch(stateProvider)}',
        ),
      ),
    );
  }
}
