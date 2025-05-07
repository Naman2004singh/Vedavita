import 'dart:io';
import 'package:vedavita/models/image_model.dart';

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
