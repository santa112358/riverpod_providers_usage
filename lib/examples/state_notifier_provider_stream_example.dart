import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stateProvider =
    StateNotifierProvider.autoDispose<SampleStateNotifier, AsyncValue<String>>(
  SampleStateNotifier.new,
);

class SampleStateNotifier extends StateNotifier<AsyncValue<String>> {
  SampleStateNotifier(Ref ref) : super(const AsyncValue.loading()) {
    final subscription = Stream<String>.periodic(
      const Duration(seconds: 1),
      (count) {
        return count.toString();
      },
    ).listen((event) {
      state = AsyncValue.data(event);
    });
    ref.onDispose(
      subscription.cancel,
    );
  }
}

class StateNotifierProviderStreamExample extends HookConsumerWidget {
  const StateNotifierProviderStreamExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifierでStreamProviderを再現'),
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
