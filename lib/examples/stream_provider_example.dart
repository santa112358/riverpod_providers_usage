import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<int>(
  (ref) {
    return Stream<int>.periodic(
      const Duration(seconds: 1),
      (count) {
        return count;
      },
    );
  },
);

class StreamProviderExample extends HookConsumerWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider'),
      ),
      body: Center(
        child: state.when(
          data: (data) {
            return Text('$data');
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
