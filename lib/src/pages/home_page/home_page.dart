import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locations_history_browser/locations_history_browser.dart';
import 'package:locations_history_browser/style/locations_history_browser_style.dart';

import '../../common_widgets/app_config.dart';
import '../../common_widgets/main_scaffold/main_scaffold.dart';
import 'constants/simons_visits.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
      title: 'Where in the World is Simon?',
      body: LocationsHistoryBrowser(
        mapsUrlTemplate: AppConfig.mapsUrlTemplate,
        locationVisits: simonsVisits,
        style: LocationsHistoryBrowserStyle(
          selectedLocationBackgroundColor: Colors.black,
          locationVisitBackgroundColor: Color(0xFF6D70DC),
          locationVisitTextColor: Colors.white,
          selectedLocationTextColor: Colors.white,
        ),
      ),
    );
  }
}
