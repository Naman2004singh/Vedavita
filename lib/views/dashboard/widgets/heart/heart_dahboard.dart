// lib/presentation/pages/heart_rate_dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/providers/get%20providers/heart_rate_provider.dart';
import 'package:vedavita/views/dashboard/widgets/heart/heart_rate.dart';
import 'package:vedavita/views/dashboard/widgets/heart/heart_rate_card_summary.dart';
import 'package:vedavita/views/dashboard/widgets/heart/heart_rate_comp.dart';

class HeartRateDashboardPage extends ConsumerWidget {
  const HeartRateDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heartRateAsyncValue = ref.watch(heartRateDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Rate Monitor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(heartRateDataProvider),
            tooltip: 'Refresh Data',
          ),
        ],
      ),
      body: heartRateAsyncValue.when(
        data: (heartRateResponse) {
          if (!heartRateResponse.success || heartRateResponse.data.isEmpty) {
            return const Center(
              child: Text('No heart rate data available'),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Text(
                //     'Heart Rate History',
                //     style: Theme.of(context).textTheme.headlineMedium,
                //   ),
                // ),
                HeartRateSummaryCard(heartRateData: heartRateResponse.data),
                SizedBox(
                  height: 300,
                  child:
                      HeartRateBarChart(heartRateData: heartRateResponse.data),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Detailed Data',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                HeartRateDataTable(heartRateData: heartRateResponse.data),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error loading heart rate data',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.refresh(heartRateDataProvider),
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
