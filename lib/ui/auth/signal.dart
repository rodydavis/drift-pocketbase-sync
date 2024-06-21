import 'dart:developer';

import 'package:pocketbase/pocketbase.dart';
import 'package:signals/signals.dart';

import '../../database/database.dart';

const authKey = 'auth-token';

final auth$ = signal<AuthStoreEvent?>(null);
final authModel$ = computed<Object?>(() => auth$.value?.model);
final recordAuthModel$ = computed<RecordModel?>(() {
  final m = authModel$.value;
  if (m is RecordModel) return m;
  return null;
});
final adminAuthModel$ = computed<AdminModel?>(() {
  final m = authModel$.value;
  if (m is AdminModel) return m;
  return null;
});
final isLoggedIn$ = computed<bool>(() {
  return recordAuthModel$.value != null || adminAuthModel$.value != null;
});
final userId$ = computed<String?>(() {
  return recordAuthModel$()?.id;
});

void Function() initAuthListener(PocketBase pb, Database db) {
  final auth = pb.authStore;
  final refreshed = <String>{};
  final stream = auth.onChange.asyncMap(
    (e) async {
      if (!auth.isValid) {
        await db.deleteItem(key: authKey);
        return AuthStoreEvent('', null);
      }
      final m = e.model;
      if (m is RecordModel && !refreshed.contains(m.id)) {
        bool healthy = false;
        try {
          final health = await pb.health.check();
          healthy = health.code == 200;
          if (healthy) {
            refreshed.add(m.id);
            await pb.collection(m.collectionId).authRefresh();
          }
        } catch (e) {
          log('error refreshing auth: $e');
          if (healthy) {
            auth.clear();
          }
        }
      }
      return e;
    },
  );

  final connector = connect(auth$);
  connector << stream;
  auth.save(auth.token, auth.model);
  return connector.dispose;
}
