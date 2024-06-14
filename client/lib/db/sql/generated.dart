import 'package:dart_mappable/dart_mappable.dart';

part 'generated.mapper.dart';

enum CollectionType {
  base,
  auth,
  view
}

enum Collections {
    users("_pb_users_auth_", "users", '"users"', CollectionType.auth),
    albums("5ku18r3zcsjfny2", "albums", '"albums"', CollectionType.base),
    albumTracks("6i2p0s6n40k6itg", "album_tracks", '"album_tracks"', CollectionType.base),
    userPlaylists("gongh7idf7btzhd", "user_playlists", '"user_playlists"', CollectionType.base),
    userPlaylistItems("lrrynz3wk8bzckg", "user_playlist_items", '"user_playlist_items"', CollectionType.base),
    songs("s6a3vmk9ldvim14", "songs", '"songs"', CollectionType.base),
    artists("cq4ellepsrwybvk", "artists", '"artists"', CollectionType.auth),
    userActivity("utije4fvesybnsb", "user_activity", '"user_activity"', CollectionType.base),
    deletedRecords("2w1uun4pfhprxhd", "deleted_records", '"deleted_records"', CollectionType.base),
    userLikedSongs("7qhhksn5g6y2kdr", "user_liked_songs", '"user_liked_songs"', CollectionType.base),
    userFollowers("glsbddfy50ymkxz", "user_followers", '"user_followers"', CollectionType.base);

  const Collections (this.id, this.name, this.sql, this.type);
  final String id, name, sql;
  final CollectionType type;
}

sealed class PBCollection {
  final String id;
  PBCollection({
    required this.id,
  });
}

@MappableClass()
class PBBase extends PBCollection with PBBaseMappable {
  final bool synced;
  final bool fresh;
  final bool deleted;
  final DateTime created;
  final DateTime updated;
  PBBase({
    required super.id,
    required this.synced,
    required this.fresh,
    required this.deleted,
    required this.created,
    required this.updated,
  });
}

@MappableClass()
class PBView extends PBCollection with PBViewMappable {
  PBView({
    required super.id,
  });
}

@MappableClass()
class PBAuth extends PBBase with PBAuthMappable {
  final String? username;
  final String? email;
  final bool? emailVisibility;
  final bool? verified;
  PBAuth({
    required super.id,
    required super.created,
    required super.updated,
    required super.fresh,
    required super.synced,
    required super.deleted,
    required this.username,
    required this.email,
    required this.emailVisibility,
    required this.verified,
  });
}

@MappableClass()
class User extends PBAuth with UserMappable {
  @MappableField(key: 'name')
  final String? name;

  @MappableField(key: 'avatar')
  final String? avatar;

  User({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required super.username,
    required super.email,
    required super.emailVisibility,
    required super.verified,
    this.name,
    this.avatar,
  });
}
@MappableClass()
class Album extends PBBase with AlbumMappable {
  @MappableField(key: 'name')
  final String name;

  Album({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required this.name,
  });
}
@MappableClass()
class AlbumTrack extends PBBase with AlbumTrackMappable {
  @MappableField(key: 'album_id')
  final String albumId;

  @MappableField(key: 'song_id')
  final String songId;

  @MappableField(key: 'order')
  final double order;

  AlbumTrack({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required this.albumId,
    required this.songId,
    required this.order,
  });
}
@MappableClass()
class UserPlaylist extends PBBase with UserPlaylistMappable {
  @MappableField(key: 'name')
  final String name;

  @MappableField(key: 'user_id')
  final String userId;

  UserPlaylist({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required this.name,
    required this.userId,
  });
}
@MappableClass()
class UserPlaylistItem extends PBBase with UserPlaylistItemMappable {
  @MappableField(key: 'playlist_id')
  final String playlistId;

  @MappableField(key: 'user_id')
  final String userId;

  @MappableField(key: 'song_id')
  final String songId;

  @MappableField(key: 'order')
  final double order;

  UserPlaylistItem({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required this.playlistId,
    required this.userId,
    required this.songId,
    required this.order,
  });
}
@MappableClass()
class Song extends PBBase with SongMappable {
  @MappableField(key: 'name')
  final String name;

  @MappableField(key: 'download_link')
  final String? downloadLink;

  @MappableField(key: 'artist_id')
  final String? artistId;

  Song({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required this.name,
    this.downloadLink,
    this.artistId,
  });
}
@MappableClass()
class Artist extends PBAuth with ArtistMappable {
  Artist({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required super.username,
    required super.email,
    required super.emailVisibility,
    required super.verified,
  });
}
@MappableClass()
class UserActivity extends PBBase with UserActivityMappable {
  @MappableField(key: 'user_id')
  final String userId;

  @MappableField(key: 'collection_id')
  final String collectionId;

  @MappableField(key: 'record_id')
  final String recordId;

  @MappableField(key: 'record_data')
  final String recordData;

  @MappableField(key: 'type')
  final String type;

  @MappableField(key: 'private')
  final bool? private;

  UserActivity({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required this.userId,
    required this.collectionId,
    required this.recordId,
    required this.recordData,
    required this.type,
    this.private,
  });
}
@MappableClass()
class DeletedRecord extends PBBase with DeletedRecordMappable {
  @MappableField(key: 'collection_id')
  final String collectionId;

  @MappableField(key: 'record_id')
  final String recordId;

  @MappableField(key: 'record_data')
  final String recordData;

  DeletedRecord({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required this.collectionId,
    required this.recordId,
    required this.recordData,
  });
}
@MappableClass()
class UserLikedSong extends PBBase with UserLikedSongMappable {
  @MappableField(key: 'user_id')
  final String userId;

  @MappableField(key: 'song_id')
  final String songId;

  UserLikedSong({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required this.userId,
    required this.songId,
  });
}
@MappableClass()
class UserFollower extends PBBase with UserFollowerMappable {
  @MappableField(key: 'user_id')
  final String userId;

  @MappableField(key: 'target_user_id')
  final String targetUserId;

  UserFollower({
    required super.id,
    required super.created,
    required super.updated,
    required super.deleted,
    required super.synced,
    required super.fresh,
    required this.userId,
    required this.targetUserId,
  });
}
