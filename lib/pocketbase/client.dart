import 'package:fetch_client/fetch_client.dart';
import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';

import '../database/database.dart';
import '../ui/auth/signal.dart';

const _pbHost = 'http://127.0.0.1:8090';

Uri pbHost() {
  return Uri.parse(_pbHost);
}

Future<PocketBase> createPbClient(Database db) async {
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
  return PocketBase(
    pbHost().toString(),
    authStore: authStore,
    httpClientFactory:
        kIsWeb ? () => FetchClient(mode: RequestMode.cors) : null,
  );
}
