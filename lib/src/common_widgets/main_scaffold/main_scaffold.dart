import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:where_in_the_world/src/pages/settings/settings_view.dart';

class MainScaffold extends ConsumerWidget {
  final String title;
  final Widget body;
  final bool showSettingsButton;

  const MainScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showSettingsButton = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (showSettingsButton)
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.pushNamed(SettingsView.routeName);
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: body,
      ),
    );
  }
}
