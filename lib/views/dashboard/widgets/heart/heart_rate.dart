// lib/presentation/widgets/heart_rate_bar_chart.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vedavita/models/heartRate/heart_rate_entry.dart';
import 'package:vedavita/views/dashboard/widgets/heart/date_formetter.dart';

class HeartRateBarChart extends StatelessWidget {
  final List<HeartRateEntry> heartRateData;

  const HeartRateBarChart({Key? key, required this.heartRateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Group heart rate data by date and calculate average for each day
    final Map<String, List<HeartRateEntry>> groupedByDate = {};
    for (var entry in heartRateData) {
      if (!groupedByDate.containsKey(entry.date)) {
        groupedByDate[entry.date] = [];
      }
      groupedByDate[entry.date]!.add(entry);
    }

    // Calculate average heart rate for each day
    final List<MapEntry<String, double>> averageHeartRates = groupedByDate.entries.map((entry) {
      final double avgHeartRate = entry.value
          .map((e) => e.heartRate)
          .reduce((a, b) => a + b) /
          entry.value.length;
      return MapEntry(entry.key, avgHeartRate);
    }).toList();

    // Sort by date
    averageHeartRates.sort((a, b) => a.key.compareTo(b.key));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 120, // Maximum heart rate display value
          minY: 40,  // Minimum heart rate display value
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.blueGrey,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final date = averageHeartRates[groupIndex].key;
                final value = rod.toY.toStringAsFixed(1);
                final day = heartRateData.firstWhere(
                  (element) => element.date == date,
                  orElse: () => HeartRateEntry(date: date, day: "Unknown", heartRate: 0),
                ).day;
                
                return BarTooltipItem(
                  '$day, ${DateFormatter.formatDate(date)}\nAvg HR: $value bpm',
                  const TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (double value, TitleMeta meta) {
                  if (value.toInt() >= averageHeartRates.length || value.toInt() < 0) {
                    return const SizedBox.shrink();
                  }
                  
                  final date = averageHeartRates[value.toInt()].key;
                  final day = heartRateData.firstWhere(
                    (element) => element.date == date,
                    orElse: () => HeartRateEntry(date: date, day: "Unknown", heartRate: 0),
                  ).day;
                  
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      day.substring(0, 3), // First three letters of day
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      value.toInt().toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  );
                },
                reservedSize: 40,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          barGroups: List.generate(
            averageHeartRates.length,
            (index) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: averageHeartRates[index].value,
                  color: _getHeartRateColor(averageHeartRates[index].value),
                  width: 20,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                ),
              ],
            ),
          ),
          gridData: FlGridData(
            show: true,
            horizontalInterval: 20,
          ),
        ),
      ),
    );
  }

  Color _getHeartRateColor(double heartRate) {
    // Color coding based on heart rate ranges
    if (heartRate < 60) {
      return Colors.blue; // Low heart rate
    } else if (heartRate >= 60 && heartRate < 80) {
      return Colors.green; // Normal heart rate
    } else if (heartRate >= 80 && heartRate < 100) {
      return Colors.orange; // Elevated heart rate
    } else {
      return Colors.red; // High heart rate
    }
  }
}

