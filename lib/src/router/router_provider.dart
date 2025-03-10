import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:where_in_the_world/src/settings/settings_view.dart';

import '../sample_feature/sample_item_details_view.dart';
import '../sample_feature/sample_item_list_view.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
          name: SampleItemListView.routeName,
          path: SampleItemListView.routeName,
          pageBuilder: (context, state) => MaterialPage(
                child: SampleItemListView(),
              )),
      GoRoute(
          name: SampleItemDetailsView.routeName,
          path: SampleItemDetailsView.routeName,
          pageBuilder: (context, state) => MaterialPage(
                child: SampleItemDetailsView(),
              )),
      GoRoute(
          name: SettingsView.routeName,
          path: SettingsView.routeName,
          pageBuilder: (context, state) => MaterialPage(
                child: SettingsView(),
              )),
    ],
  );
});
