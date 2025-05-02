import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromScreen extends ConsumerStatefulWidget {
  const PromScreen({super.key});

  @override
  ConsumerState<PromScreen> createState() => _PromScreenState();
}

class _PromScreenState extends ConsumerState<PromScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prom Screen'),
      ),
      body: const Center(
        child: Text('Prom Screen Content'),
      ),
    );
  }
}