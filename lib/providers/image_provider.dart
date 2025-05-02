// lib/providers/post_providers.dart
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/models/chat_response_model.dart';
import 'package:vedavita/repository/repository.dart';

// Provider for the repository
final postRepositoryProvider = Provider<Repository>((ref) {
  return Repository();
});

// State for image upload
class ImageUploadState {
  final bool isLoading;
  final String? errorMessage;
  final ChatResponseModel? response;
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
    ChatResponseModel? response,
    File? selectedImage,
  }) {
    return ImageUploadState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
      selectedImage: selectedImage ?? this.selectedImage,
    );
  }
}

// StateNotifier for image upload
class ImageUploadNotifier extends StateNotifier<ImageUploadState> {
  final Repository _repository;

  ImageUploadNotifier(this._repository) : super(ImageUploadState());

  // Set selected image
  void setImage(File? image) {
    state = state.copyWith(selectedImage: image);
  }

  // Upload image only
  Future<void> uploadImage() async {
    if (state.selectedImage == null) {
      state = state.copyWith(errorMessage: "Please select an image first");
      return;
    }

    try {
      // Set loading state
      state = state.copyWith(isLoading: true, errorMessage: null);

      // Call repository to upload image
      final response = await _repository.uploadImage(state.selectedImage!);

      // Update state with response
      state = state.copyWith(
        isLoading: false,
        response: response,
      );

    } catch (e) {
      // Handle error
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
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