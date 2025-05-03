
import 'package:flutter/material.dart';
import 'package:vedavita/models/heartRate/heart_rate_entry.dart';
import 'package:vedavita/views/dashboard/widgets/heart/date_formetter.dart';

class HeartRateDataTable extends StatelessWidget {
  final List<HeartRateEntry> heartRateData;

  const HeartRateDataTable({Key? key, required this.heartRateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort data by date (newest first)
    final sortedData = List<HeartRateEntry>.from(heartRateData)
      ..sort((a, b) => b.date.compareTo(a.date));

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Heart Rate History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text(
                      'Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Day',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Heart Rate (bpm)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: sortedData.map((entry) {
                  return DataRow(
                    cells: [
                      DataCell(Text(DateFormatter.formatDate(entry.date))),
                      DataCell(Text(entry.day)),
                      DataCell(Text('${entry.heartRate}')),
                      DataCell(
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: _getHeartRateColor(entry.heartRate.toDouble()),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(_getHeartRateStatus(entry.heartRate.toDouble())),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getHeartRateColor(double heartRate) {
    if (heartRate < 60) {
      return Colors.blue;
    } else if (heartRate >= 60 && heartRate < 80) {
      return Colors.green;
    } else if (heartRate >= 80 && heartRate < 100) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String _getHeartRateStatus(double heartRate) {
    if (heartRate < 60) {
      return 'Low';
    } else if (heartRate >= 60 && heartRate < 80) {
      return 'Normal';
    } else if (heartRate >= 80 && heartRate < 100) {
      return 'Elevated';
    } else {
      return 'High';
    }
  }
}