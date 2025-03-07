// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingsState {
  final ThemeMode themeMode;

  SettingsState({
    required this.themeMode,
  });

  SettingsState.initial() : themeMode = ThemeMode.system;

  SettingsState copyWith({
    ThemeMode? themeMode,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
