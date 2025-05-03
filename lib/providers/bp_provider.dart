import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vedavita/models/bp_model.dart';

final chartDataProvider = FutureProvider<List<ChartData>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));

  final systolicSpots = <FlSpot>[
    FlSpot(0, 120),
    FlSpot(20, 122),
    FlSpot(40, 118),
    FlSpot(60, 125),
    FlSpot(80, 119),
    FlSpot(100, 121),
  ];

  final diastolicSpots = <FlSpot>[
    FlSpot(0, 80),
    FlSpot(20, 78),
    FlSpot(40, 82),
    FlSpot(60, 79),
    FlSpot(80, 81),
    FlSpot(100, 80),
  ];

  return [
    ChartData(spots: systolicSpots, color: Colors.red),
    ChartData(spots: diastolicSpots, color: Colors.blue),
  ];
});
