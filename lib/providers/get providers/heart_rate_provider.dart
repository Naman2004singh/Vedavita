// lib/data/providers/heart_rate_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/models/heartRate/heart_rate_response.dart';
import 'package:vedavita/repository/repository.dart';

// Repository provider
final heartRateRepositoryProvider = Provider<Repository>((ref) {
  return Repository();
});

// Heart rate data provider
final heartRateDataProvider = FutureProvider<HeartRateResponse>((ref) async {
  final repository = ref.watch(heartRateRepositoryProvider);
  return repository.getHeartRateData();
});

// Error state provider
final heartRateErrorProvider = StateProvider<String?>((ref) => null);

// Loading state provider
final heartRateLoadingProvider = StateProvider<bool>((ref) => false);