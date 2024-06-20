import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:signals/signals_flutter_extended.dart';

import '../db/sync.dart';
import 'provider.dart';
import 'router.dart';

class SyncResult {
  final bool ok;
  final String error;
  final DateTime time;

  SyncResult(this.ok, this.time, [this.error = '']);
}

class App extends StatefulWidget {
  const App({
    super.key,
    this.title = 'Flutter App',
    this.backgroundSyncDuration = const Duration(minutes: 5),
    required this.service,
  });

  final String title;
  final Duration backgroundSyncDuration;
  final SyncService service;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Timer? _sync;
  bool _syncing = false;
  late final router = createRouter(widget.service);
  VoidCallback? _authListener;
  final syncTimes$ = listSignal<SyncResult>([]);

  ThemeData createTheme(Brightness brightness) {
    final colors = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: brightness,
    );
    return ThemeData(
      colorScheme: colors,
      useMaterial3: true,
      brightness: brightness,
    );
  }

  Future<void> initSync() async {
    final sync = Provider.of<SyncService>(context);
    if (sync == null) return;
    if (_syncing) return;
    final time = Stopwatch();
    time.start();
    log('starting sync');
    _syncing = true;
    try {
      await sync.syncCollections();
      syncTimes$.add(SyncResult(true, DateTime.now()));
    } catch (e) {
      log('error syncing collections: $e');
      syncTimes$.add(SyncResult(true, DateTime.now(), '$e'));
    } finally {
      time.stop();
      log('finished sync in ${time.elapsedMilliseconds}ms');
      _syncing = false;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _sync = Timer.periodic(
        widget.backgroundSyncDuration,
        (_) => initSync(),
      );
      initSync();
    });
  }

  @override
  void dispose() {
    _sync?.cancel();
    _authListener?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SignalProvider<List<SyncResult>>.value(
      value: syncTimes$,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: widget.title,
        theme: createTheme(Brightness.light),
        darkTheme: createTheme(Brightness.dark),
        themeMode: ThemeMode.system,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
