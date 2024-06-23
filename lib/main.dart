import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

import 'database/connection/connect.dart';

import 'database/database.dart';
import 'database/sync.dart';
import 'pocketbase/client.dart';
import 'ui/app.dart';
import 'ui/auth/signal.dart';
import 'ui/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = createDatabase(
    'app.sqlite',
    logStatements: true,
  );
  final pb = await createPbClient(db);
  initAuthListener(pb, db);
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
