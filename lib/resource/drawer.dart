import 'package:flutter/material.dart';

import '../provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
    required this.main,
  }) : super(key: key);

  final MainProvider main;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(),
          ),
          ListTile(
            title: const Text('Theme'),
            trailing: Switch(
              value: main.getIsDark,
              onChanged: (value) {
                main.setIsDark = value;
              },
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
