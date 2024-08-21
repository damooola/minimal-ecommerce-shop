import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ));
  }
}
