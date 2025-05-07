import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vedavita/notifiers/image_state.dart';
import 'package:vedavita/providers/image_provider.dart';
import 'package:vedavita/views/Image%20analysier/widgets/image_upload_success.dart';

class ImageAnalyse extends ConsumerStatefulWidget {
  const ImageAnalyse({super.key});

  @override
  ConsumerState<ImageAnalyse> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends ConsumerState<ImageAnalyse> {
  File? _imageFile;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    // Reset state when screen is first loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_disposed) {
        ref.read(imageUploadProvider.notifier).resetState();
      }
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _clearImageFile();
    super.dispose();
  }

  // Clear image file to prevent memory leaks
  void _clearImageFile() {
    if (_imageFile != null) {
      _imageFile = null;
    }
  }

  // Show image selection options (camera or gallery)
  Future<void> _showImageSelect() async {
    if (_disposed) return;
    
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
    if (_disposed) return;
    
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 80, // Optional: reduce image quality to save bandwidth
    );

    if (image != null && !_disposed) {
      _imageFile = File(image.path);
      ref.read(imageUploadProvider.notifier).setImage(_imageFile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final uploadState = ref.watch(imageUploadProvider);

    // Listen to state changes
    ref.listen<ImageUploadState>(
      imageUploadProvider,
      (previous, current) {
        if (_disposed) return;
        
        if (current.errorMessage != null &&
            previous?.errorMessage != current.errorMessage) {
          // Show error message if any
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(current.errorMessage!)),
          );
        }

        // Explicitly check for success response and navigate
        if (current.response != null && current.response!.success == true) {
          // Use Future.microtask to avoid build-phase navigation issues
          Future.microtask(() {
            if (!_disposed && context.mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const UploadSuccessScreen()),
              );
            }
          });
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