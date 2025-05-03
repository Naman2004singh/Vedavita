import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/providers/image_provider.dart';

class UploadSuccessScreen extends ConsumerWidget {
  const UploadSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get upload response from state
    final uploadState = ref.watch(imageUploadProvider);
    
    // If response is null, it might mean we navigated here incorrectly
    if (uploadState.response == null || !uploadState.response!.success) {
      // Handle this edge case - return to previous screen after a short delay
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No valid upload data found')),
          );
          Navigator.of(context).pop();
        }
      });
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Successful'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Success animation/icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 80,
              ),
            ),
            const SizedBox(height: 32),
            
            // Success message
            Text(
              uploadState.response?.message ?? 'Image uploaded successfully!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            
            // Response details
            if (uploadState.response?.data != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display response data
                    const Text('Image details:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      uploadState.response?.data.toString() ?? 'No additional data',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            
            const Spacer(),
            
            // Back to home button
            ElevatedButton(
              onPressed: () {
                // Reset upload state
                ref.read(imageUploadProvider.notifier).resetState();
                // Navigate back to home or main screen
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}