class MonitorModel {
  final double value;
  final String time;

  MonitorModel(
    this.time,
    this.value,
  );

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'value': value,
    };
  }
}