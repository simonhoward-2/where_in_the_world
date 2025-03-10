import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:where_in_the_world/src/common_widgets/main_scaffold/main_scaffold.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
      title: "Where in the world?",
      body: Text("Map goes here"),
    );
  }
}
