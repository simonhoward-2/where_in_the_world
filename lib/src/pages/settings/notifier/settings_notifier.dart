import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/settings_state.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) => SettingsNotifier(),
);

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier()
      : super(
          SettingsState.initial(),
        );

  void updateThemeMode(ThemeMode? newThemeMode) {
    state = state.copyWith(themeMode: newThemeMode);
  }
}
