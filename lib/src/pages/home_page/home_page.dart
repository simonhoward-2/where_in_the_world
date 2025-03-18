import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:where_in_the_world/src/common_widgets/main_scaffold/main_scaffold.dart';
import 'package:where_in_the_world/src/pages/home_page/constants/simons_locations.dart';
import 'package:where_in_the_world/src/pages/home_page/state/current_selected_location.dart';
import 'package:where_in_the_world/src/pages/settings/notifier/settings_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late FutureProvider<String?> darkMapStyle;

  @override
  void initState() {
    // Load the dark map style
    darkMapStyle = FutureProvider((ref) async {
      return await DefaultAssetBundle.of(context).loadString('assets/maps_dark_theme.json');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Load the json text of the dark map style
    var darkMapStyleLoaded = ref.watch(darkMapStyle);

    // Get the theme mode for the map styling
    var themeMode = ref.watch(settingsProvider).themeMode;
    if (themeMode == ThemeMode.system) {
      themeMode = MediaQuery.of(context).platformBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    }

    // watch for changes in the current location
    ref.listen(
      currentSelectedLocationProvider,
      (previous, next) {
        // Position has changed
        _controller.future.then((controller) {
          controller.animateCamera(CameraUpdate.newLatLng(next.position));
        });
      },
    );

    final currentLocation = simonsLocations.last;
    var selectedLocation = ref.watch(currentSelectedLocationProvider);

    final dateFormat = DateFormat('MMM y');

    return MainScaffold(
      title: "Where in the world is Simon Howard?",
      body: Column(
        children: [
          // Map
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 400,
              width: 600,
              child: darkMapStyleLoaded.when(
                data: (data) => GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: selectedLocation.position,
                    zoom: 3,
                  ),
                  style: themeMode == ThemeMode.dark ? data : "[]",
                  markers: simonsLocations.map((location) {
                    return Marker(
                      markerId: MarkerId(location.city),
                      position: location.position,
                      infoWindow: InfoWindow(
                          title: location.city,
                          snippet: '${dateFormat.format(location.start)} - ${location.end != null ? dateFormat.format(location.end!) : "Present"}'),
                    );
                  }).toSet(),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Center(child: Text("Error loading map style")),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Current location: ${currentLocation.city}, ${currentLocation.country}'),
          Text('Timezone: ${currentLocation.timeZoneString}'),
          SizedBox(height: 20),
          SizedBox(
            width: 600,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 50),
              child: CarouselView(
                  itemExtent: 200,
                  onTap: (value) {
                    ref.read(currentSelectedLocationProvider.notifier).selectLocation(simonsLocations[value]);
                  },
                  children: simonsLocations.map((location) {
                    return ColoredBox(
                      color: location == selectedLocation ? Colors.blue : Colors.teal,
                      child: Center(
                        child: Column(
                          children: [
                            Text('${location.city}, ${location.country}'),
                            Text('${dateFormat.format(location.start)} - ${location.end != null ? dateFormat.format(location.end!) : "Present"}'),
                          ],
                        ),
                      ),
                    );
                  }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
