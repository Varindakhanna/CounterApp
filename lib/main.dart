import 'package:counterapp/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: CounterScreen()));
}

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _counter = ref.watch(counterProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Counter:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$_counter',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
