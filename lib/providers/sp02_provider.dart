import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vedavita/models/bp_model.dart';

final sp02ChartDataProvider = FutureProvider<List<ChartData>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));

  final sp02Spots = <FlSpot>[
    FlSpot(0, 98),
    FlSpot(20, 99),
    FlSpot(40, 97),
    FlSpot(60, 98),
    FlSpot(80, 96),
    FlSpot(100, 99),
  ];

  return [
    ChartData(spots: sp02Spots, color: Colors.green),
  ];
});
