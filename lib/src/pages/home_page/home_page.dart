import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:where_in_the_world/src/common_widgets/main_scaffold/main_scaffold.dart';
import 'package:where_in_the_world/src/pages/settings/notifier/settings_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late FutureProvider<String?> darkMapStyle;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-33.8626157, 151.1949714),
    zoom: 8,
  );

  @override
  void initState() {
    darkMapStyle = FutureProvider((ref) async {
      return await DefaultAssetBundle.of(context).loadString('assets/maps_dark_theme.json');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Await the loading of the dark map style
    var darkMapStyleLoaded = ref.watch(darkMapStyle);

    // Get the theme mode for the map styling
    var themeMode = ref.watch(settingsProvider).themeMode;
    if (themeMode == ThemeMode.system) {
      themeMode = MediaQuery.of(context).platformBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    }

    return MainScaffold(
      title: "Where in the world is Simon Howard?",
      body: darkMapStyleLoaded.when(
        data: (data) => GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          style: themeMode == ThemeMode.dark ? data : null,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text("Error loading map style")),
      ),
    );
  }
}
