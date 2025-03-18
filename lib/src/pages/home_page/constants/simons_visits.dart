import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:where_in_the_world/src/pages/home_page/models/location_visit.dart';

import '../models/location.dart';

final homeLocation = Location(
  city: 'Sydney',
  country: 'Australia',
  timeZoneString: 'AEST +10',
  position: LatLng(-33.8626157, 151.1949714),
);

final simonsVisits = [
  // Sydney Oct 2024 - Feb 2025
  LocationVisit(
    location: homeLocation,
    start: DateTime(2024, 10),
    end: DateTime(2025, 2),
  ),
  // India
  LocationVisit(
    location: Location(
      city: 'Rhishikesh',
      country: 'India',
      timeZoneString: 'IST +5:30',
      position: LatLng(30.1033, 78.2948),
    ),
    start: DateTime(2025, 2),
    end: DateTime(2025, 3),
  ),
  // Sydney Mar 2025 - present
  LocationVisit(
    location: homeLocation,
    start: DateTime(2025, 3),
  ),
];
