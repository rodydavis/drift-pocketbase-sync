import 'package:client/ui/provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () async {
          final pb = Provider.of<PocketBase>(context)!;
          final res = await pb.send('/test');
          print(res);
        },
      ),
    );
  }
}
