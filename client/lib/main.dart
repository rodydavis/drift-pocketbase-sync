import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

import 'db/connection/connect.dart';

import 'db/database.dart';
import 'db/sync.dart';
import 'ui/app.dart';
import 'ui/auth/signal.dart';
import 'ui/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = createDatabase(
    'example.db',
    // logStatements: true,
  );
  final token = await db.getItem(key: authKey).getSingleOrNull();
  final authStore = AsyncAuthStore(
    initial: token,
    save: (token) async {
      await db.setItem(key: authKey, value: token);
    },
    clear: () async {
      await db.deleteItem(key: authKey);
    },
  );
  final pb = PocketBase(
    "http://127.0.0.1:8090",
    authStore: authStore,
  );
  initAuthListener(pb, db);
  authStore.save(authStore.token, authStore.model);
  final service = SyncService(db, pb);
  runApp(
    Provider<Database>(
      value: db,
      child: Provider<PocketBase>(
        value: pb,
        child: Provider<SyncService>(
          value: service,
          child: App(service: service),
        ),
      ),
    ),
  );
}
