import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:signals/signals_flutter_extended.dart';

import '../../../db/sync.dart';
import '../../app.dart';
import '../../provider.dart';

class SyncLogsScreen extends StatefulWidget {
  const SyncLogsScreen({super.key});

  @override
  State<SyncLogsScreen> createState() => _SyncLogsScreenState();
}

class _SyncLogsScreenState extends State<SyncLogsScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> syncAll() async {
    final sync = Provider.of<SyncService>(context);
    if (sync == null) return;
    await sync.syncCollections();
  }

  @override
  Widget build(BuildContext context) {
    final logs$ = SignalProvider.of<List<SyncResult>>(context);
    final items = logs$().reversed.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Logs'),
        actions: [
          IconButton(
            onPressed: syncAll,
            icon: const Icon(Icons.sync),
            tooltip: 'Sync everything',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text('Sync ${item.ok ? 'ok' : 'error'}'),
            subtitle: Text(timeago.format(item.time)),
          );
        },
      ),
    );
  }
}
