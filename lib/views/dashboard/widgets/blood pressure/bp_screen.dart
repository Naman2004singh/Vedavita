import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedavita/providers/bp_provider.dart';

class LinearCharts extends ConsumerWidget {
  const LinearCharts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartDataAsync = ref.watch(chartDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Pressure Chart"),
        centerTitle: true,
        elevation: 0,
      ),
      body: chartDataAsync.when(
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text("Loading chart data...", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 48),
              SizedBox(height: 16),
              Text('Error loading data: $error',
                  style: TextStyle(color: Colors.red)),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(chartDataProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (chartDataList) {
          if (chartDataList.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bar_chart_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No data available', style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          }

          // Calculate global min/max values from all data points
          final allPoints =
              chartDataList.expand((chart) => chart.spots).toList();
          final maxY =
              allPoints.map((e) => e.y).reduce((a, b) => a > b ? a : b) * 1.1;
          final minY = 0.0;

          return Column(
            children: [
              // Title
              const Padding(
                padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                child: Text(
                  "Blood Pressure (Systolic/Diastolic)",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Legend
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: chartDataList.asMap().entries.map((entry) {
                    final index = entry.key;
                    final data = entry.value;
                    final title = index == 0 ? "Systolic" : "Diastolic";

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: data.color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            title,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Line chart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LineChart(
                    LineChartData(
                      maxX: 100,
                      minX: 0,
                      maxY: maxY,
                      minY: minY,
                      lineBarsData: chartDataList.map((chartData) {
                        return LineChartBarData(
                          spots: chartData.spots,
                          isCurved: true,
                          color: chartData.color,
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                chartData.color.withOpacity(0.3),
                                chartData.color.withOpacity(0.0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        );
                      }).toList(),
                      gridData: FlGridData(show: true),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      ),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 20,
                            getTitlesWidget: (value, meta) => SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 8,
                              child: Text('Day ${value.toInt()}'),
                            ),
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 20,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) => SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 8,
                              child: Text('${value.toInt()}'),
                            ),
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          tooltipBgColor: Colors.black87,
                          getTooltipItems: (touchedSpots) {
                            return touchedSpots.map((spot) {
                              final title =
                                  spot.barIndex == 0 ? "Systolic" : "Diastolic";
                              return LineTooltipItem(
                                '$title\nDay ${spot.x.toInt()}: ${spot.y.toInt()}',
                                const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              );
                            }).toList();
                          },
                        ),
                        handleBuiltInTouches: true,
                      ),
                    ),
                  ),
                ),
              ),

              // Summary Card
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Summary",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Your blood pressure reading consists of two values: systolic and diastolic. "
                          "Systolic pressure (the higher number) measures the pressure in your arteries "
                          "when your heart beats. Diastolic pressure (the lower number) measures the pressure "
                          "in your arteries when your heart rests between beats. A normal reading is typically "
                          "around 120/80 mm Hg. Regular monitoring can help detect early signs of hypertension.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
