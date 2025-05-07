class GoogleAuthState {
  final bool isLoading;
  final String? error;
  final dynamic userData;

  GoogleAuthState({
    this.isLoading = false,
    this.error,
    this.userData,
  });

  GoogleAuthState copyWith({
    bool? isLoading,
    String? error,
    dynamic userData,
  }) {
    return GoogleAuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      userData: userData ?? this.userData,
    );
  }
}