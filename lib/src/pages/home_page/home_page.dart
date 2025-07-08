import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locations_history_browser/locations_history_browser.dart';

import '../../common_widgets/app_config.dart';
import '../../common_widgets/main_scaffold/main_scaffold.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
      title: 'Where in the World is Simon?',
      body: LocationsHistoryBrowser(
        mapsUrlTemplate: AppConfig.mapsUrlTemplate,
      ),
    );
  }
}
