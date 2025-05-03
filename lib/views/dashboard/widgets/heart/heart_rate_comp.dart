
import 'package:flutter/material.dart';
import 'package:vedavita/models/heartRate/heart_rate_entry.dart';

class HeartRateSummaryCard extends StatelessWidget {
  final List<HeartRateEntry> heartRateData;

  const HeartRateSummaryCard({super.key, required this.heartRateData});

  @override
  Widget build(BuildContext context) {
    // Calculate statistics
    final int minHeartRate = heartRateData.map((e) => e.heartRate).reduce((a, b) => a < b ? a : b);
    final int maxHeartRate = heartRateData.map((e) => e.heartRate).reduce((a, b) => a > b ? a : b);
    final double avgHeartRate = heartRateData.map((e) => e.heartRate).reduce((a, b) => a + b) / heartRateData.length;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(
              context,
              'Average',
              '${avgHeartRate.toStringAsFixed(1)} bpm',
              Icons.favorite,
              Colors.red,
            ),
            _buildStatItem(
              context,
              'Minimum',
              '$minHeartRate bpm',
              Icons.arrow_downward,
              Colors.blue,
            ),
            _buildStatItem(
              context,
              'Maximum',
              '$maxHeartRate bpm',
              Icons.arrow_upward,
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: color,
          ),
        ),
      ],
    );
  }
}