import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stateProvider =
    StateNotifierProvider.autoDispose<SampleStateNotifier, AsyncValue<String>>(
  (ref) => SampleStateNotifier(),
);

class SampleStateNotifier extends StateNotifier<AsyncValue<String>> {
  SampleStateNotifier() : super(const AsyncValue.loading()) {
    Future(
      () async {
        await Future<void>.delayed(
          const Duration(milliseconds: 400),
        );
        state = const AsyncValue.data('Future Completed');
      },
    );
  }
}

class StateNotifierProviderFutureExample extends HookConsumerWidget {
  const StateNotifierProviderFutureExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifierでFutureProviderを再現'),
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
