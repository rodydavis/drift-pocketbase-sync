import 'package:client/db/database.dart';
import 'package:client/db/sql/generated.dart';
import 'package:client/db/sync.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocketbase/pocketbase.dart';

void main() {
  group("sync", () {
    late Database db;
    late PocketBase pb;
    late SyncService service;

    Future<void> resetPb() async {
      final collections = await pb.collections.getFullList();
      for (final col in collections) {
        if (col.type != 'view') {
          final records = await pb.collection(col.id).getFullList();
          for (final record in records) {
            await pb.collection(col.id).delete(record.id);
          }
        }
      }
      await pb.send('/api/remove-deleted-records', method: "DELETE");
    }

    setUp(() async {
      db = Database(NativeDatabase.memory());
      pb = PocketBase("http://127.0.0.1:8090");
      service = SyncService(db, pb);
      await pb.admins.authWithPassword("admin@email.com", "admin123456");
      await resetPb();
    });

    tearDown(() async {
      await db.close();
      await resetPb();
    });

    group('songs', () {
      group('remote', () {
        test('should be empty at first', () async {
          final songs = await pb.collection(Collections.songs.id).getFullList();
          expect(songs.isEmpty, true);
        });

        test('add/delete new song', () async {
          final col = pb.collection(Collections.songs.id);
          var songs = await col.getFullList();
          expect(songs.isEmpty, true);

          final data = <String, Object?>{'name': 'Track 1'};
          final record = await col.create(body: data);

          songs = await col.getFullList();
          expect(songs.isNotEmpty, true);
          expect(songs.first.data['name'], 'Track 1');

          await col.delete(record.id);
        });

        test('update new song', () async {
          final col = pb.collection(Collections.songs.id);
          var songs = await col.getFullList();
          expect(songs.isEmpty, true);

          var data = <String, Object?>{'name': 'Track 1'};
          final record = await col.create(body: data);

          songs = await col.getFullList();
          expect(songs.isNotEmpty, true);
          expect(songs.first.data['name'], 'Track 1');

          data = {'name': 'Track 2'};
          await col.update(record.id, body: data);

          songs = await col.getFullList();
          expect(songs.isNotEmpty, true);
          expect(songs.first.data['name'], 'Track 2');

          await col.delete(record.id);
        });
      });
    });

    group('local', () {
      test('should be empty at first', () async {
        final songs = await db.songsGetAll().get();
        expect(songs.isEmpty, true);
      });

      test('add/delete new song', () async {
        var songs = await db.songsGetAll().get();
        expect(songs.isEmpty, true);

        await createDbSong(db, 'Track 1');

        songs = await db.songsGetAll().get();
        final song = songs.first;

        expect(songs.isNotEmpty, true);
        expect(song.name, 'Track 1');

        await db.songsHardDeleteOne(id: song.id);
      });

      test('update new song', () async {
        var songs = await db.songsGetAll().get();
        expect(songs.isEmpty, true);

        var song = await createDbSong(db, 'Track 1');

        songs = await db.songsGetAll().get();

        expect(songs.isNotEmpty, true);
        expect(song.name, 'Track 1');

        await updateDbSong(db, song, 'Track 2');

        songs = await db.songsGetAll().get();
        song = songs.first;

        expect(songs.isNotEmpty, true);
        expect(song.name, 'Track 2');

        await db.songsHardDeleteOne(id: song.id);
      });
    });

    group('remote and local', () {
      test('remote records sync to local', () async {
        final col = pb.collection(Collections.songs.id);
        var dbSongs = await db.songsGetAll().get();
        expect(dbSongs.isEmpty, true);

        final data = <String, Object?>{'name': 'Track 1'};
        final record = await col.create(body: data);

        var remoteSongs = await col.getFullList();
        expect(remoteSongs.isNotEmpty, true);
        expect(record.data['name'], 'Track 1');
        expect(remoteSongs.first.data['name'], 'Track 1');

        dbSongs = await db.songsGetAll().get();
        expect(dbSongs.isEmpty, true);

        await service.syncCollections();

        dbSongs = await db.songsGetAll().get();
        final dbSong = dbSongs.first;

        expect(dbSongs.isNotEmpty, true);
        expect(dbSong.name, 'Track 1');
        expect(dbSong.fresh, false);
        expect(dbSong.synced, true);
      });

      test('local new records get created on remote', () async {
        final col = pb.collection(Collections.songs.id);
        var dbSongs = await db.songsGetAll().get();
        expect(dbSongs.isEmpty, true);

        var song = await createDbSong(db, 'Track 1');
        var remoteSongs = await col.getFullList();

        expect(song.name, 'Track 1');
        expect(song.fresh, true);
        expect(song.synced, false);
        expect(remoteSongs.isEmpty, true);

        await service.syncCollections();

        remoteSongs = await col.getFullList();
        expect(remoteSongs.isNotEmpty, true);
        expect(remoteSongs.first.data['name'], 'Track 1');

        dbSongs = await db.songsGetAll().get();
        song = dbSongs.first;

        expect(dbSongs.isNotEmpty, true);
        expect(song.name, 'Track 1');
        expect(song.fresh, false);
        expect(song.synced, true);
      });

      test('local valid edits get saved to remote', () async {
        final col = pb.collection(Collections.songs.id);
        var dbSongs = await db.songsGetAll().get();
        expect(dbSongs.isEmpty, true);

        var song = await createDbSong(db, 'Track 1');
        var remoteSongs = await col.getFullList();

        expect(song.name, 'Track 1');
        expect(song.fresh, true);
        expect(song.synced, false);
        expect(remoteSongs.isEmpty, true);

        await service.syncCollections();

        remoteSongs = await col.getFullList();
        var remoteSong = remoteSongs.first;

        expect(remoteSongs.isNotEmpty, true);
        expect(remoteSong.data['name'], 'Track 1');

        dbSongs = await db.songsGetAll().get();
        song = dbSongs.first;

        expect(dbSongs.isNotEmpty, true);
        expect(song.name, 'Track 1');
        expect(song.fresh, false);
        expect(song.synced, true);

        await updateDbSong(db, song, 'Track 2');
        dbSongs = await db.songsGetAll().get();
        song = dbSongs.first;
        remoteSongs = await col.getFullList();
        remoteSong = remoteSongs.first;

        expect(song.name, 'Track 2');
        expect(song.fresh, false);
        expect(song.synced, false);
        expect(remoteSong.data['name'], 'Track 1');

        await service.syncCollections();

        dbSongs = await db.songsGetAll().get();
        song = dbSongs.first;
        remoteSongs = await col.getFullList();
        remoteSong = remoteSongs.first;

        expect(song.name, 'Track 2');
        expect(song.fresh, false);
        expect(song.synced, true);
        expect(remoteSong.data['name'], 'Track 2');
      });

      test('Remote edits should update existing local records', () async {
        final id = db.newId();
        await createRemoteSong(pb, 'Track 1', id: id);
        await service.syncCollections();

        var songs = await db.songsGetAll().get();
        var song = songs.first;

        expect(song.id, id);
        expect(song.name, 'Track 1');

        await updateRemoteSong(pb, id, 'Track 2');
        await service.syncCollections();

        songs = await db.songsGetAll().get();
        song = songs.first;

        expect(song.id, id);
        expect(song.name, 'Track 2');
      });

      test('Local edits that are newer will override remote', () async {
        final id = db.newId();
        await createRemoteSong(pb, 'Track 1', id: id);
        await service.syncCollections();

        var songs = await db.songsGetAll().get();
        var song = songs.first;

        expect(song.id, id);
        expect(song.name, 'Track 1');

        await updateDbSong(db, song, 'Track 2');
        var remoteSong = await pb //
            .collection(Collections.songs.id)
            .getFullList()
            .then((v) => v.first);

        expect(song.id, remoteSong.id);
        expect(remoteSong.getStringValue('name'), 'Track 1');

        await service.syncCollections();

        songs = await db.songsGetAll().get();
        song = songs.first;
        remoteSong = await pb //
            .collection(Collections.songs.id)
            .getFullList()
            .then((v) => v.first);

        expect(song.id, id);
        expect(song.name, 'Track 2');
        expect(remoteSong.getStringValue('name'), 'Track 2');
      });

      test('Local edits that are older will be overridden by remote', () async {
        final id = db.newId();
        await createRemoteSong(pb, 'Track 1', id: id);
        await service.syncCollections();

        var songs = await db.songsGetAll().get();
        var song = songs.first;

        expect(song.id, id);
        expect(song.name, 'Track 1');

        await updateDbSong(db, song, 'Track 2');
        await updateRemoteSong(pb, song.id, 'Track 3');
        var remoteSong = await pb //
            .collection(Collections.songs.id)
            .getFullList()
            .then((v) => v.first);

        songs = await db.songsGetAll().get();
        song = songs.first;

        expect(song.name, 'Track 2');
        expect(song.id, remoteSong.id);
        expect(remoteSong.getStringValue('name'), 'Track 3');

        await service.syncCollections();

        songs = await db.songsGetAll().get();
        song = songs.first;
        remoteSong = await pb //
            .collection(Collections.songs.id)
            .getFullList()
            .then((v) => v.first);

        expect(song.id, id);
        expect(song.name, 'Track 3');
        expect(remoteSong.getStringValue('name'), 'Track 3');
      });

      test('Remote deletes will override any local edits', () async {
        final id = db.newId();
        await createRemoteSong(pb, 'Track 1', id: id);
        await service.syncCollections();

        var songs = await db.songsGetAll().get();
        var song = songs.first;

        expect(song.id, id);
        expect(song.name, 'Track 1');

        await pb.collection(Collections.songs.id).delete(id);

        await service.syncCollections();

        songs = await db.songsGetAll().get();
        final rd = await pb //
            .collection(Collections.deletedRecords.id)
            .getFullList();

        expect(songs.isEmpty, true);
        expect(rd.isNotEmpty, true);
        expect(rd.first.getStringValue('record_id'), id);
        expect(rd.first.getStringValue('collection_id'), Collections.songs.id);
      });
    });
  });
}

Future<Song> createDbSong(
  Database db,
  String name, {
  String? id,
}) async {
  return await db
      .songsInsert(
        id: id ?? db.newId(),
        created: DateTime.now(),
        updated: DateTime.now(),
        fresh: true,
        name: name,
      )
      .then((e) => e.first);
}

Future<Song> updateDbSong(Database db, Song song, String name) async {
  await db.songsUpdate(
    id: song.id,
    created: song.created,
    updated: DateTime.now(),
    fresh: false,
    deleted: song.deleted,
    name: name,
    artistId: song.artistId,
    downloadLink: song.downloadLink,
  );
  return song.copyWith(name: name);
}

Future<RecordModel> createRemoteSong(
  PocketBase pb,
  String name, {
  String? id,
}) async {
  return await pb.collection(Collections.songs.id).create(
    body: {
      'name': name,
      if (id != null) 'id': id,
    },
  );
}

Future<RecordModel> updateRemoteSong(
  PocketBase pb,
  String id,
  String name,
) async {
  return await pb.collection(Collections.songs.id).update(
    id,
    body: {
      'name': name,
    },
  );
}
