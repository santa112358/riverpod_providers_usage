import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stateProvider = StateProvider.autoDispose<int>((ref) => 0);

class StateProviderExample extends HookConsumerWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider sample'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(stateProvider.notifier).update(
                (state) => state + 1,
              );
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
