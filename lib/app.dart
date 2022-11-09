import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_providers_usage/examples/future_provider_example.dart';
import 'package:riverpod_providers_usage/examples/state_notifier_provider_future_example.dart';
import 'package:riverpod_providers_usage/examples/state_notifier_provider_stream_example.dart';
import 'package:riverpod_providers_usage/examples/state_provider_example.dart';
import 'package:riverpod_providers_usage/examples/stream_provider_example.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Providers Usage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FutureProviderExample(),
                  ),
                );
              },
              child: const Text('FutureProvider使用例'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const StateNotifierProviderFutureExample(),
                  ),
                );
              },
              child: const Text('StateNotifierで\nFutureProviderの再現例'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StreamProviderExample(),
                  ),
                );
              },
              child: const Text('StreamProvider使用例'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const StateNotifierProviderStreamExample(),
                  ),
                );
              },
              child: const Text('StateNotifierで\nStreamProviderの再現例'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StateProviderExample(),
                  ),
                );
              },
              child: const Text('StateProvider使用例'),
            ),
          ],
        ),
      ),
    );
  }
}
