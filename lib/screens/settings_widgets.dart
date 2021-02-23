import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smartexweb/stores/main_store.dart';

class SettingsExample extends StatelessWidget {
  const SettingsExample(this.store);
  final MainStore store;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFFFF4500),
            size: 30.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFFFF4500),
          ),
        ),
      ),
      body: Observer(
        builder: (context) => SwitchListTile(
          activeColor: Color(0xFFFF4500),
          value: store.settings.useDarkMode,
          title: const Text('Use dark mode'),
          onChanged: (value) {
            store.settings.setDarkMode(value: value);
          },
        ),
      ));
}
