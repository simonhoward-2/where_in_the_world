// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPeriod {
  final String city;
  final String country;
  final String timeZoneString;
  final LatLng position;
  final DateTime start;
  final DateTime? end;

  const LocationPeriod({
    required this.city,
    required this.country,
    required this.timeZoneString,
    required this.start,
    required this.position,
    this.end,
  });
}
