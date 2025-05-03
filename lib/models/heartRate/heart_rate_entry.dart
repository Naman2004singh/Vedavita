class HeartRateEntry {
  final String date;
  final String day;
  final int heartRate;

  HeartRateEntry({
    required this.date,
    required this.day,
    required this.heartRate,
  });

  factory HeartRateEntry.fromJson(Map<String, dynamic> json) {
    return HeartRateEntry(
      date: json['date'],
      day: json['day'],
      heartRate: json['heartRate'],
    );
  }
}