import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vedavita/providers/image_provider.dart';
import 'package:vedavita/views/image%20analysier/widgets/image_upload_success.dart';

class ImageAnalyse extends ConsumerStatefulWidget {
  const ImageAnalyse({super.key});

  @override
  ConsumerState<ImageAnalyse> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends ConsumerState<ImageAnalyse> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Reset state when screen is first loaded
      ref.read(imageUploadProvider.notifier).resetState();
    });
  }

  // Pick image from gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80, // Optional: reduce image quality to save bandwidth
    );
    
    if (image != null) {
      ref.read(imageUploadProvider.notifier).setImage(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the image upload state
    final uploadState = ref.watch(imageUploadProvider);
    
    // Listen to state changes
    ref.listen<ImageUploadState>(
      imageUploadProvider,
      (previous, current) {
        // Show error if any
        if (current.errorMessage != null && previous?.errorMessage != current.errorMessage) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(current.errorMessage!)),
          );
        }
        
        // Navigate to success screen if upload was successful
        if (current.response != null && current.response!.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const UploadSuccessScreen(),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image preview
            Expanded(
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: uploadState.selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            uploadState.selectedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        )
                      : const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image, size: 64, color: Colors.grey),
                              SizedBox(height: 16),
                              Text(
                                'Tap to select an image',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Upload button
            ElevatedButton(
              onPressed: uploadState.isLoading || uploadState.selectedImage == null
                  ? null
                  : () {
                      // Call upload image method
                      ref.read(imageUploadProvider.notifier).uploadImage();
                    },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                disabledBackgroundColor: Colors.grey[300],
              ),
              child: uploadState.isLoading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Uploading...'),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : const Text(
                      'Upload Image',
                      style: TextStyle(fontSize: 16),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}