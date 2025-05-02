import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageAnalyser extends ConsumerStatefulWidget {
  const ImageAnalyser({super.key});

  @override
  ConsumerState<ImageAnalyser> createState() => _ImageAnalyserState();
}

class _ImageAnalyserState extends ConsumerState<ImageAnalyser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Analyser'),
      ),
      body: const Center(
        child: Text('Image Analyser Screen'),
      ),
    );
  }
}