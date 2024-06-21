import 'package:drift/drift.dart';
import 'sql/generated.dart';
import 'database.dart';

Map<Collections, TableInfo<Table, PBCollection>> createMapper(Database db) {
  return <Collections, TableInfo<Table, PBCollection>>{
    Collections.users: db.users,
    Collections.albums: db.albums,
    Collections.albumTracks: db.albumTracks,
    Collections.userPlaylists: db.userPlaylists,
    Collections.userPlaylistItems: db.userPlaylistItems,
    Collections.songs: db.songs,
    Collections.artists: db.artists,
    Collections.userLikedSongs: db.userLikedSongs,
    Collections.userFollowers: db.userFollowers,
    Collections.changes: db.changes,
  };
}
