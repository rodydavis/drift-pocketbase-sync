import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../database/sql/generated.dart';
import '../../database/sync.dart';
import '../auth/signal.dart';

class PlaylistsScreen extends StatefulWidget {
  const PlaylistsScreen({
    super.key,
    required this.userId,
    required this.service,
  });

  final String userId;
  final SyncService service;

  @override
  State<PlaylistsScreen> createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends State<PlaylistsScreen> {
  void Function()? cancelSubscription;

  late final playlists$ = bindSignal(
    context,
    widget.service.db
        .userPlaylistsGetByUserId(userId: widget.userId)
        .watch()
        .toSignal(),
  );

  @override
  void initState() {
    super.initState();
    widget.service.realtimeCollection(Collections.userPlaylists).then((cb) {
      cancelSubscription = cb;
    });
  }

  @override
  void dispose() {
    cancelSubscription?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists'),
        actions: [
          IconButton(
            onPressed: () {
              widget.service.syncCollection(Collections.userPlaylists).ignore();
            },
            icon: const Icon(Icons.sync),
            tooltip: 'Sync playlists',
          ),
        ],
      ),
      body: playlists$.value.map(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e) => Center(child: Text('Error loading playlists: $e')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No playlists found'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final userId = userId$()!;
          await widget.service.db.userPlaylistsInsert(
            name: 'New Playlist: ${DateTime.now().toIso8601String()}',
            userId: userId,
          );
          // await widget.service.syncCollection(Collections.userPlaylists);
        },
      ),
    );
  }
}
