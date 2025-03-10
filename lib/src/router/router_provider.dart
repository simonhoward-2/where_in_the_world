import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:where_in_the_world/src/pages/home_page/constants/home_page_constants.dart';
import 'package:where_in_the_world/src/pages/home_page/home_page.dart';
import 'package:where_in_the_world/src/pages/settings/constants/settings_page_constants.dart';
import 'package:where_in_the_world/src/pages/settings/settings_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
          name: homePageRoute,
          path: homePageRoute,
          pageBuilder: (context, state) => MaterialPage(
                child: HomePage(),
              )),
      GoRoute(
          name: settingsPageRoute,
          path: settingsPageRoute,
          pageBuilder: (context, state) => MaterialPage(
                child: SettingsPage(),
              )),
    ],
  );
});
