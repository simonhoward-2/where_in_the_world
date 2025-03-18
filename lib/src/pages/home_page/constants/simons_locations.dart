import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:where_in_the_world/src/pages/home_page/models/location_period.dart';

final simonsLocations = [
  LocationPeriod(
    city: 'Rhishikesh',
    country: 'India',
    timeZoneString: 'IST +5:30',
    position: LatLng(30.1033, 78.2948),
    start: DateTime(2025, 2),
    end: DateTime(2025, 3),
  ),
  LocationPeriod(
    city: 'Sydney',
    country: 'Australia',
    timeZoneString: 'AEST +10',
    position: LatLng(-33.8626157, 151.1949714),
    start: DateTime(2025, 3),
  ),
];
