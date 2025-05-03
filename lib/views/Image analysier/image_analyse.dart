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
    // Reset state when screen is first loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(imageUploadProvider.notifier).resetState();
    });
  }

  // Show image selection options (camera or gallery)
  Future<void> _showImageSelect() async {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a photo'),
              onTap: () async {
                Navigator.pop(context);
                await _getImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () async {
                Navigator.pop(context);
                await _getImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Pick image from the specified source (gallery or camera)
  Future<void> _getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 80, // Optional: reduce image quality to save bandwidth
    );

    if (image != null) {
      ref.read(imageUploadProvider.notifier).setImage(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final uploadState = ref.watch(imageUploadProvider);

    // Listen to state changes
    ref.listen<ImageUploadState>(
      imageUploadProvider,
      (previous, current) {
        if (current.errorMessage != null &&
            previous?.errorMessage != current.errorMessage) {
          // Show error message if any
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(current.errorMessage!)),
          );
        }

        if (current.response?.success == true) {
          // Navigate to success screen if image upload was successful
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const UploadSuccessScreen()),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Upload Image')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image preview
            Expanded(
              child: GestureDetector(
                onTap: _showImageSelect,
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
                                style: TextStyle(fontSize: 16, color: Colors.grey),
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
                        CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
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
