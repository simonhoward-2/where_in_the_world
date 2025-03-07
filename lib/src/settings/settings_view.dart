import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifier/settings_notifier.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends ConsumerWidget {
  const SettingsView({
    super.key,
  });

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var settings = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: settings.themeMode,
          onChanged: (value) => ref.read(settingsProvider.notifier).updateThemeMode(value),
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        ),
      ),
    );
  }
}
