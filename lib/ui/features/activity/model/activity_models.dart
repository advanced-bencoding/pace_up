class DevicePosition {
  final double longitude;
  final double latitude;

  const DevicePosition({required this.longitude, required this.latitude});
}

class Pace {
  final int minutes;
  final int seconds;

  Pace(this.minutes, this.seconds);

  @override
  String toString() => '$minutes:${seconds.toString().padLeft(2, '0')}';
}
