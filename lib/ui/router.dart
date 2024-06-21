import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../database/sync.dart';
import 'auth/login/screen.dart';
import 'auth/signal.dart';
import 'home/screen.dart';
import 'playlists/screen.dart';
import 'settings/sync_logs/screen.dart';

GoRouter createRouter(SyncService service) {
  return GoRouter(
    initialLocation: isLoggedIn$() ? '/' : '/auth/login',
    refreshListenable: isLoggedIn$.toValueListenable(),
    routes: [
      GoRoute(
        redirect: (context, state) {
          if (!isLoggedIn$()) return '/auth/login';
          return null;
        },
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'playlists',
            builder: (context, state) => PlaylistsScreen(
              service: service,
              userId: userId$()!,
            ),
          ),
          GoRoute(
            path: 'settings',
            redirect: (context, state) => '/settings/sync-logs',
            routes: [
              GoRoute(
                path: 'sync-logs',
                builder: (context, state) => const SyncLogsScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/auth',
        redirect: (context, state) {
          if (isLoggedIn$()) return '/';
          return '/auth/login';
        },
        routes: [
          GoRoute(
            path: 'login',
            builder: (context, state) => const LoginScreen(),
          ),
        ],
      ),
    ],
  );
}
