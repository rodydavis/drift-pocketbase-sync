import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Playlists'),
            onTap: () {
              context.push('/playlists');
            },
          ),
          ListTile(
            title: const Text('Sync Logs'),
            onTap: () {
              context.push('/settings/sync-logs');
            },
          ),
        ],
      ),
    );
  }
}
