import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/notifiers/image_state.dart';
import 'package:vedavita/repository/features_repository.dart';

// Provider for the repository
final postRepositoryProvider = Provider<ImageRepository>((ref) {
  return ImageRepository();
});


// StateNotifier for image upload
class ImageUploadNotifier extends StateNotifier<ImageUploadState> {
  final ImageRepository _repository;
  
  ImageUploadNotifier(this._repository) : super(ImageUploadState());
  
  // Set selected image
  void setImage(File? image) {
    state = state.copyWith(
      selectedImage: image,
      clearError: true,
      clearResponse: true
    );
  }
  
  // Upload image
  Future<void> uploadImage() async {
    if (state.selectedImage == null) {
      state = state.copyWith(errorMessage: "Please select an image first");
      return;
    }
    
    try {
      // Set loading state
      state = state.copyWith(isLoading: true, clearError: true);  
      
      // Call repository to upload image
      final response = await _repository.uploadImage(state.selectedImage!);
      
      // Update state with response
      state = state.copyWith(isLoading: false, response: ImageUploadState().response);
      
      // Debug print to verify response
      print('Upload response received: ${response.success}');
      print('Response message: ${response.message}');

    } catch (e) {
      print('Error during upload: $e');
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
  
  // Reset state
  void resetState() {
    state = ImageUploadState();
  }
}

// Provider for image upload state
final imageUploadProvider = StateNotifierProvider<ImageUploadNotifier, ImageUploadState>((ref) {
  final repository = ref.watch(postRepositoryProvider);
  return ImageUploadNotifier(repository);
});