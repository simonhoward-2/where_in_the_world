import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:where_in_the_world/src/common_widgets/main_scaffold/main_scaffold.dart';

import 'notifier/settings_notifier.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var settings = ref.watch(settingsProvider);
    return MainScaffold(
      title: 'Settings',
      showSettingsButton: false,
      body: Row(
        children: [
          const Text('Theme Mode: '),
          DropdownButton<ThemeMode>(
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
        ],
      ),
    );
  }
}
