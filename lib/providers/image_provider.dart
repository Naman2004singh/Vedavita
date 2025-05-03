// lib/providers/image_provider.dart
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/models/image_model.dart';
import 'package:vedavita/repository/repository.dart';

// Provider for the repository
final postRepositoryProvider = Provider<Repository>((ref) {
  return Repository();
});

// State for image upload
class ImageUploadState {
  final bool isLoading;
  final String? errorMessage;
  final PostResponseModel? response; // Changed from ChatResponseModel to PostResponseModel
  final File? selectedImage;
  
  ImageUploadState({
    this.isLoading = false,
    this.errorMessage,
    this.response,
    this.selectedImage,
  });
  
  ImageUploadState copyWith({
    bool? isLoading,
    String? errorMessage,
    PostResponseModel? response,
    File? selectedImage,
    bool clearError = false,
    bool clearResponse = false,
    bool clearImage = false,
  }) {
    return ImageUploadState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      response: clearResponse ? null : (response ?? this.response),
      selectedImage: clearImage ? null : (selectedImage ?? this.selectedImage),
    );
  }
}

// StateNotifier for image upload
class ImageUploadNotifier extends StateNotifier<ImageUploadState> {
  final Repository _repository;
  
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
      // if (response.data != null) {
      //   print('Image URL: ${response.data!.image}');
      //   print('Result: ${response.data!.result}');
      // }
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