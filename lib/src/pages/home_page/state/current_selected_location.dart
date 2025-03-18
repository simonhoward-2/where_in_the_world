import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:where_in_the_world/src/pages/home_page/constants/simons_locations.dart';
import 'package:where_in_the_world/src/pages/home_page/models/location_period.dart';

final currentSelectedLocationProvider = StateNotifierProvider<CurrentSelectedLocationNotifier, LocationPeriod>((ref) {
  return CurrentSelectedLocationNotifier();
});

class CurrentSelectedLocationNotifier extends StateNotifier<LocationPeriod> {
  CurrentSelectedLocationNotifier() : super(simonsLocations.last);

  void selectLocation(LocationPeriod location) {
    state = location;
  }
}
