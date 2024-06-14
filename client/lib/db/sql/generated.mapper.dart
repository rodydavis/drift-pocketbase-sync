// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'generated.dart';

class PBBaseMapper extends ClassMapperBase<PBBase> {
  PBBaseMapper._();

  static PBBaseMapper? _instance;
  static PBBaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PBBaseMapper._());
      PBAuthMapper.ensureInitialized();
      AlbumMapper.ensureInitialized();
      AlbumTrackMapper.ensureInitialized();
      UserPlaylistMapper.ensureInitialized();
      UserPlaylistItemMapper.ensureInitialized();
      SongMapper.ensureInitialized();
      UserActivityMapper.ensureInitialized();
      DeletedRecordMapper.ensureInitialized();
      UserLikedSongMapper.ensureInitialized();
      UserFollowerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PBBase';

  static String _$id(PBBase v) => v.id;
  static const Field<PBBase, String> _f$id = Field('id', _$id);
  static bool _$synced(PBBase v) => v.synced;
  static const Field<PBBase, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(PBBase v) => v.fresh;
  static const Field<PBBase, bool> _f$fresh = Field('fresh', _$fresh);
  static bool _$deleted(PBBase v) => v.deleted;
  static const Field<PBBase, bool> _f$deleted = Field('deleted', _$deleted);
  static DateTime _$created(PBBase v) => v.created;
  static const Field<PBBase, DateTime> _f$created = Field('created', _$created);
  static DateTime _$updated(PBBase v) => v.updated;
  static const Field<PBBase, DateTime> _f$updated = Field('updated', _$updated);

  @override
  final MappableFields<PBBase> fields = const {
    #id: _f$id,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #deleted: _f$deleted,
    #created: _f$created,
    #updated: _f$updated,
  };

  static PBBase _instantiate(DecodingData data) {
    return PBBase(
        id: data.dec(_f$id),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        deleted: data.dec(_f$deleted),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated));
  }

  @override
  final Function instantiate = _instantiate;

  static PBBase fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PBBase>(map);
  }

  static PBBase fromJson(String json) {
    return ensureInitialized().decodeJson<PBBase>(json);
  }
}

mixin PBBaseMappable {
  String toJson() {
    return PBBaseMapper.ensureInitialized().encodeJson<PBBase>(this as PBBase);
  }

  Map<String, dynamic> toMap() {
    return PBBaseMapper.ensureInitialized().encodeMap<PBBase>(this as PBBase);
  }

  PBBaseCopyWith<PBBase, PBBase, PBBase> get copyWith =>
      _PBBaseCopyWithImpl(this as PBBase, $identity, $identity);
  @override
  String toString() {
    return PBBaseMapper.ensureInitialized().stringifyValue(this as PBBase);
  }

  @override
  bool operator ==(Object other) {
    return PBBaseMapper.ensureInitialized().equalsValue(this as PBBase, other);
  }

  @override
  int get hashCode {
    return PBBaseMapper.ensureInitialized().hashValue(this as PBBase);
  }
}

extension PBBaseValueCopy<$R, $Out> on ObjectCopyWith<$R, PBBase, $Out> {
  PBBaseCopyWith<$R, PBBase, $Out> get $asPBBase =>
      $base.as((v, t, t2) => _PBBaseCopyWithImpl(v, t, t2));
}

abstract class PBBaseCopyWith<$R, $In extends PBBase, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      bool? synced,
      bool? fresh,
      bool? deleted,
      DateTime? created,
      DateTime? updated});
  PBBaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PBBaseCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, PBBase, $Out>
    implements PBBaseCopyWith<$R, PBBase, $Out> {
  _PBBaseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PBBase> $mapper = PBBaseMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          bool? synced,
          bool? fresh,
          bool? deleted,
          DateTime? created,
          DateTime? updated}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (deleted != null) #deleted: deleted,
        if (created != null) #created: created,
        if (updated != null) #updated: updated
      }));
  @override
  PBBase $make(CopyWithData data) => PBBase(
      id: data.get(#id, or: $value.id),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      deleted: data.get(#deleted, or: $value.deleted),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated));

  @override
  PBBaseCopyWith<$R2, PBBase, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PBBaseCopyWithImpl($value, $cast, t);
}

class PBViewMapper extends ClassMapperBase<PBView> {
  PBViewMapper._();

  static PBViewMapper? _instance;
  static PBViewMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PBViewMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PBView';

  static String _$id(PBView v) => v.id;
  static const Field<PBView, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<PBView> fields = const {
    #id: _f$id,
  };

  static PBView _instantiate(DecodingData data) {
    return PBView(id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static PBView fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PBView>(map);
  }

  static PBView fromJson(String json) {
    return ensureInitialized().decodeJson<PBView>(json);
  }
}

mixin PBViewMappable {
  String toJson() {
    return PBViewMapper.ensureInitialized().encodeJson<PBView>(this as PBView);
  }

  Map<String, dynamic> toMap() {
    return PBViewMapper.ensureInitialized().encodeMap<PBView>(this as PBView);
  }

  PBViewCopyWith<PBView, PBView, PBView> get copyWith =>
      _PBViewCopyWithImpl(this as PBView, $identity, $identity);
  @override
  String toString() {
    return PBViewMapper.ensureInitialized().stringifyValue(this as PBView);
  }

  @override
  bool operator ==(Object other) {
    return PBViewMapper.ensureInitialized().equalsValue(this as PBView, other);
  }

  @override
  int get hashCode {
    return PBViewMapper.ensureInitialized().hashValue(this as PBView);
  }
}

extension PBViewValueCopy<$R, $Out> on ObjectCopyWith<$R, PBView, $Out> {
  PBViewCopyWith<$R, PBView, $Out> get $asPBView =>
      $base.as((v, t, t2) => _PBViewCopyWithImpl(v, t, t2));
}

abstract class PBViewCopyWith<$R, $In extends PBView, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id});
  PBViewCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PBViewCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, PBView, $Out>
    implements PBViewCopyWith<$R, PBView, $Out> {
  _PBViewCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PBView> $mapper = PBViewMapper.ensureInitialized();
  @override
  $R call({String? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  PBView $make(CopyWithData data) => PBView(id: data.get(#id, or: $value.id));

  @override
  PBViewCopyWith<$R2, PBView, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PBViewCopyWithImpl($value, $cast, t);
}

class PBAuthMapper extends ClassMapperBase<PBAuth> {
  PBAuthMapper._();

  static PBAuthMapper? _instance;
  static PBAuthMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PBAuthMapper._());
      PBBaseMapper.ensureInitialized();
      UserMapper.ensureInitialized();
      ArtistMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PBAuth';

  static String _$id(PBAuth v) => v.id;
  static const Field<PBAuth, String> _f$id = Field('id', _$id);
  static DateTime _$created(PBAuth v) => v.created;
  static const Field<PBAuth, DateTime> _f$created = Field('created', _$created);
  static DateTime _$updated(PBAuth v) => v.updated;
  static const Field<PBAuth, DateTime> _f$updated = Field('updated', _$updated);
  static bool _$fresh(PBAuth v) => v.fresh;
  static const Field<PBAuth, bool> _f$fresh = Field('fresh', _$fresh);
  static bool _$synced(PBAuth v) => v.synced;
  static const Field<PBAuth, bool> _f$synced = Field('synced', _$synced);
  static bool _$deleted(PBAuth v) => v.deleted;
  static const Field<PBAuth, bool> _f$deleted = Field('deleted', _$deleted);
  static String? _$username(PBAuth v) => v.username;
  static const Field<PBAuth, String> _f$username =
      Field('username', _$username);
  static String? _$email(PBAuth v) => v.email;
  static const Field<PBAuth, String> _f$email = Field('email', _$email);
  static bool? _$emailVisibility(PBAuth v) => v.emailVisibility;
  static const Field<PBAuth, bool> _f$emailVisibility =
      Field('emailVisibility', _$emailVisibility);
  static bool? _$verified(PBAuth v) => v.verified;
  static const Field<PBAuth, bool> _f$verified = Field('verified', _$verified);

  @override
  final MappableFields<PBAuth> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #fresh: _f$fresh,
    #synced: _f$synced,
    #deleted: _f$deleted,
    #username: _f$username,
    #email: _f$email,
    #emailVisibility: _f$emailVisibility,
    #verified: _f$verified,
  };

  static PBAuth _instantiate(DecodingData data) {
    return PBAuth(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        fresh: data.dec(_f$fresh),
        synced: data.dec(_f$synced),
        deleted: data.dec(_f$deleted),
        username: data.dec(_f$username),
        email: data.dec(_f$email),
        emailVisibility: data.dec(_f$emailVisibility),
        verified: data.dec(_f$verified));
  }

  @override
  final Function instantiate = _instantiate;

  static PBAuth fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PBAuth>(map);
  }

  static PBAuth fromJson(String json) {
    return ensureInitialized().decodeJson<PBAuth>(json);
  }
}

mixin PBAuthMappable {
  String toJson() {
    return PBAuthMapper.ensureInitialized().encodeJson<PBAuth>(this as PBAuth);
  }

  Map<String, dynamic> toMap() {
    return PBAuthMapper.ensureInitialized().encodeMap<PBAuth>(this as PBAuth);
  }

  PBAuthCopyWith<PBAuth, PBAuth, PBAuth> get copyWith =>
      _PBAuthCopyWithImpl(this as PBAuth, $identity, $identity);
  @override
  String toString() {
    return PBAuthMapper.ensureInitialized().stringifyValue(this as PBAuth);
  }

  @override
  bool operator ==(Object other) {
    return PBAuthMapper.ensureInitialized().equalsValue(this as PBAuth, other);
  }

  @override
  int get hashCode {
    return PBAuthMapper.ensureInitialized().hashValue(this as PBAuth);
  }
}

extension PBAuthValueCopy<$R, $Out> on ObjectCopyWith<$R, PBAuth, $Out> {
  PBAuthCopyWith<$R, PBAuth, $Out> get $asPBAuth =>
      $base.as((v, t, t2) => _PBAuthCopyWithImpl(v, t, t2));
}

abstract class PBAuthCopyWith<$R, $In extends PBAuth, $Out>
    implements PBBaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? fresh,
      bool? synced,
      bool? deleted,
      String? username,
      String? email,
      bool? emailVisibility,
      bool? verified});
  PBAuthCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PBAuthCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, PBAuth, $Out>
    implements PBAuthCopyWith<$R, PBAuth, $Out> {
  _PBAuthCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PBAuth> $mapper = PBAuthMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? fresh,
          bool? synced,
          bool? deleted,
          Object? username = $none,
          Object? email = $none,
          Object? emailVisibility = $none,
          Object? verified = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (fresh != null) #fresh: fresh,
        if (synced != null) #synced: synced,
        if (deleted != null) #deleted: deleted,
        if (username != $none) #username: username,
        if (email != $none) #email: email,
        if (emailVisibility != $none) #emailVisibility: emailVisibility,
        if (verified != $none) #verified: verified
      }));
  @override
  PBAuth $make(CopyWithData data) => PBAuth(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      fresh: data.get(#fresh, or: $value.fresh),
      synced: data.get(#synced, or: $value.synced),
      deleted: data.get(#deleted, or: $value.deleted),
      username: data.get(#username, or: $value.username),
      email: data.get(#email, or: $value.email),
      emailVisibility: data.get(#emailVisibility, or: $value.emailVisibility),
      verified: data.get(#verified, or: $value.verified));

  @override
  PBAuthCopyWith<$R2, PBAuth, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PBAuthCopyWithImpl($value, $cast, t);
}

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
      PBAuthMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'User';

  static String _$id(User v) => v.id;
  static const Field<User, String> _f$id = Field('id', _$id);
  static DateTime _$created(User v) => v.created;
  static const Field<User, DateTime> _f$created = Field('created', _$created);
  static DateTime _$updated(User v) => v.updated;
  static const Field<User, DateTime> _f$updated = Field('updated', _$updated);
  static bool _$deleted(User v) => v.deleted;
  static const Field<User, bool> _f$deleted = Field('deleted', _$deleted);
  static bool _$synced(User v) => v.synced;
  static const Field<User, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(User v) => v.fresh;
  static const Field<User, bool> _f$fresh = Field('fresh', _$fresh);
  static String? _$username(User v) => v.username;
  static const Field<User, String> _f$username = Field('username', _$username);
  static String? _$email(User v) => v.email;
  static const Field<User, String> _f$email = Field('email', _$email);
  static bool? _$emailVisibility(User v) => v.emailVisibility;
  static const Field<User, bool> _f$emailVisibility =
      Field('emailVisibility', _$emailVisibility);
  static bool? _$verified(User v) => v.verified;
  static const Field<User, bool> _f$verified = Field('verified', _$verified);
  static String? _$name(User v) => v.name;
  static const Field<User, String> _f$name = Field('name', _$name, opt: true);
  static String? _$avatar(User v) => v.avatar;
  static const Field<User, String> _f$avatar =
      Field('avatar', _$avatar, opt: true);

  @override
  final MappableFields<User> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #username: _f$username,
    #email: _f$email,
    #emailVisibility: _f$emailVisibility,
    #verified: _f$verified,
    #name: _f$name,
    #avatar: _f$avatar,
  };

  static User _instantiate(DecodingData data) {
    return User(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        username: data.dec(_f$username),
        email: data.dec(_f$email),
        emailVisibility: data.dec(_f$emailVisibility),
        verified: data.dec(_f$verified),
        name: data.dec(_f$name),
        avatar: data.dec(_f$avatar));
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<User>(map);
  }

  static User fromJson(String json) {
    return ensureInitialized().decodeJson<User>(json);
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper.ensureInitialized().encodeJson<User>(this as User);
  }

  Map<String, dynamic> toMap() {
    return UserMapper.ensureInitialized().encodeMap<User>(this as User);
  }

  UserCopyWith<User, User, User> get copyWith =>
      _UserCopyWithImpl(this as User, $identity, $identity);
  @override
  String toString() {
    return UserMapper.ensureInitialized().stringifyValue(this as User);
  }

  @override
  bool operator ==(Object other) {
    return UserMapper.ensureInitialized().equalsValue(this as User, other);
  }

  @override
  int get hashCode {
    return UserMapper.ensureInitialized().hashValue(this as User);
  }
}

extension UserValueCopy<$R, $Out> on ObjectCopyWith<$R, User, $Out> {
  UserCopyWith<$R, User, $Out> get $asUser =>
      $base.as((v, t, t2) => _UserCopyWithImpl(v, t, t2));
}

abstract class UserCopyWith<$R, $In extends User, $Out>
    implements PBAuthCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? username,
      String? email,
      bool? emailVisibility,
      bool? verified,
      String? name,
      String? avatar});
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          Object? username = $none,
          Object? email = $none,
          Object? emailVisibility = $none,
          Object? verified = $none,
          Object? name = $none,
          Object? avatar = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (username != $none) #username: username,
        if (email != $none) #email: email,
        if (emailVisibility != $none) #emailVisibility: emailVisibility,
        if (verified != $none) #verified: verified,
        if (name != $none) #name: name,
        if (avatar != $none) #avatar: avatar
      }));
  @override
  User $make(CopyWithData data) => User(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      username: data.get(#username, or: $value.username),
      email: data.get(#email, or: $value.email),
      emailVisibility: data.get(#emailVisibility, or: $value.emailVisibility),
      verified: data.get(#verified, or: $value.verified),
      name: data.get(#name, or: $value.name),
      avatar: data.get(#avatar, or: $value.avatar));

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl($value, $cast, t);
}

class AlbumMapper extends ClassMapperBase<Album> {
  AlbumMapper._();

  static AlbumMapper? _instance;
  static AlbumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AlbumMapper._());
      PBBaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Album';

  static String _$id(Album v) => v.id;
  static const Field<Album, String> _f$id = Field('id', _$id);
  static DateTime _$created(Album v) => v.created;
  static const Field<Album, DateTime> _f$created = Field('created', _$created);
  static DateTime _$updated(Album v) => v.updated;
  static const Field<Album, DateTime> _f$updated = Field('updated', _$updated);
  static bool _$deleted(Album v) => v.deleted;
  static const Field<Album, bool> _f$deleted = Field('deleted', _$deleted);
  static bool _$synced(Album v) => v.synced;
  static const Field<Album, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(Album v) => v.fresh;
  static const Field<Album, bool> _f$fresh = Field('fresh', _$fresh);
  static String _$name(Album v) => v.name;
  static const Field<Album, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Album> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #name: _f$name,
  };

  static Album _instantiate(DecodingData data) {
    return Album(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Album fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Album>(map);
  }

  static Album fromJson(String json) {
    return ensureInitialized().decodeJson<Album>(json);
  }
}

mixin AlbumMappable {
  String toJson() {
    return AlbumMapper.ensureInitialized().encodeJson<Album>(this as Album);
  }

  Map<String, dynamic> toMap() {
    return AlbumMapper.ensureInitialized().encodeMap<Album>(this as Album);
  }

  AlbumCopyWith<Album, Album, Album> get copyWith =>
      _AlbumCopyWithImpl(this as Album, $identity, $identity);
  @override
  String toString() {
    return AlbumMapper.ensureInitialized().stringifyValue(this as Album);
  }

  @override
  bool operator ==(Object other) {
    return AlbumMapper.ensureInitialized().equalsValue(this as Album, other);
  }

  @override
  int get hashCode {
    return AlbumMapper.ensureInitialized().hashValue(this as Album);
  }
}

extension AlbumValueCopy<$R, $Out> on ObjectCopyWith<$R, Album, $Out> {
  AlbumCopyWith<$R, Album, $Out> get $asAlbum =>
      $base.as((v, t, t2) => _AlbumCopyWithImpl(v, t, t2));
}

abstract class AlbumCopyWith<$R, $In extends Album, $Out>
    implements PBBaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? name});
  AlbumCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AlbumCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Album, $Out>
    implements AlbumCopyWith<$R, Album, $Out> {
  _AlbumCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Album> $mapper = AlbumMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          String? name}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (name != null) #name: name
      }));
  @override
  Album $make(CopyWithData data) => Album(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      name: data.get(#name, or: $value.name));

  @override
  AlbumCopyWith<$R2, Album, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AlbumCopyWithImpl($value, $cast, t);
}

class AlbumTrackMapper extends ClassMapperBase<AlbumTrack> {
  AlbumTrackMapper._();

  static AlbumTrackMapper? _instance;
  static AlbumTrackMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AlbumTrackMapper._());
      PBBaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AlbumTrack';

  static String _$id(AlbumTrack v) => v.id;
  static const Field<AlbumTrack, String> _f$id = Field('id', _$id);
  static DateTime _$created(AlbumTrack v) => v.created;
  static const Field<AlbumTrack, DateTime> _f$created =
      Field('created', _$created);
  static DateTime _$updated(AlbumTrack v) => v.updated;
  static const Field<AlbumTrack, DateTime> _f$updated =
      Field('updated', _$updated);
  static bool _$deleted(AlbumTrack v) => v.deleted;
  static const Field<AlbumTrack, bool> _f$deleted = Field('deleted', _$deleted);
  static bool _$synced(AlbumTrack v) => v.synced;
  static const Field<AlbumTrack, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(AlbumTrack v) => v.fresh;
  static const Field<AlbumTrack, bool> _f$fresh = Field('fresh', _$fresh);
  static String _$albumId(AlbumTrack v) => v.albumId;
  static const Field<AlbumTrack, String> _f$albumId =
      Field('albumId', _$albumId, key: 'album_id');
  static String _$songId(AlbumTrack v) => v.songId;
  static const Field<AlbumTrack, String> _f$songId =
      Field('songId', _$songId, key: 'song_id');
  static double _$order(AlbumTrack v) => v.order;
  static const Field<AlbumTrack, double> _f$order = Field('order', _$order);

  @override
  final MappableFields<AlbumTrack> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #albumId: _f$albumId,
    #songId: _f$songId,
    #order: _f$order,
  };

  static AlbumTrack _instantiate(DecodingData data) {
    return AlbumTrack(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        albumId: data.dec(_f$albumId),
        songId: data.dec(_f$songId),
        order: data.dec(_f$order));
  }

  @override
  final Function instantiate = _instantiate;

  static AlbumTrack fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AlbumTrack>(map);
  }

  static AlbumTrack fromJson(String json) {
    return ensureInitialized().decodeJson<AlbumTrack>(json);
  }
}

mixin AlbumTrackMappable {
  String toJson() {
    return AlbumTrackMapper.ensureInitialized()
        .encodeJson<AlbumTrack>(this as AlbumTrack);
  }

  Map<String, dynamic> toMap() {
    return AlbumTrackMapper.ensureInitialized()
        .encodeMap<AlbumTrack>(this as AlbumTrack);
  }

  AlbumTrackCopyWith<AlbumTrack, AlbumTrack, AlbumTrack> get copyWith =>
      _AlbumTrackCopyWithImpl(this as AlbumTrack, $identity, $identity);
  @override
  String toString() {
    return AlbumTrackMapper.ensureInitialized()
        .stringifyValue(this as AlbumTrack);
  }

  @override
  bool operator ==(Object other) {
    return AlbumTrackMapper.ensureInitialized()
        .equalsValue(this as AlbumTrack, other);
  }

  @override
  int get hashCode {
    return AlbumTrackMapper.ensureInitialized().hashValue(this as AlbumTrack);
  }
}

extension AlbumTrackValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AlbumTrack, $Out> {
  AlbumTrackCopyWith<$R, AlbumTrack, $Out> get $asAlbumTrack =>
      $base.as((v, t, t2) => _AlbumTrackCopyWithImpl(v, t, t2));
}

abstract class AlbumTrackCopyWith<$R, $In extends AlbumTrack, $Out>
    implements PBBaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? albumId,
      String? songId,
      double? order});
  AlbumTrackCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AlbumTrackCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AlbumTrack, $Out>
    implements AlbumTrackCopyWith<$R, AlbumTrack, $Out> {
  _AlbumTrackCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AlbumTrack> $mapper =
      AlbumTrackMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          String? albumId,
          String? songId,
          double? order}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (albumId != null) #albumId: albumId,
        if (songId != null) #songId: songId,
        if (order != null) #order: order
      }));
  @override
  AlbumTrack $make(CopyWithData data) => AlbumTrack(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      albumId: data.get(#albumId, or: $value.albumId),
      songId: data.get(#songId, or: $value.songId),
      order: data.get(#order, or: $value.order));

  @override
  AlbumTrackCopyWith<$R2, AlbumTrack, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AlbumTrackCopyWithImpl($value, $cast, t);
}

class UserPlaylistMapper extends ClassMapperBase<UserPlaylist> {
  UserPlaylistMapper._();

  static UserPlaylistMapper? _instance;
  static UserPlaylistMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserPlaylistMapper._());
      PBBaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserPlaylist';

  static String _$id(UserPlaylist v) => v.id;
  static const Field<UserPlaylist, String> _f$id = Field('id', _$id);
  static DateTime _$created(UserPlaylist v) => v.created;
  static const Field<UserPlaylist, DateTime> _f$created =
      Field('created', _$created);
  static DateTime _$updated(UserPlaylist v) => v.updated;
  static const Field<UserPlaylist, DateTime> _f$updated =
      Field('updated', _$updated);
  static bool _$deleted(UserPlaylist v) => v.deleted;
  static const Field<UserPlaylist, bool> _f$deleted =
      Field('deleted', _$deleted);
  static bool _$synced(UserPlaylist v) => v.synced;
  static const Field<UserPlaylist, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(UserPlaylist v) => v.fresh;
  static const Field<UserPlaylist, bool> _f$fresh = Field('fresh', _$fresh);
  static String _$name(UserPlaylist v) => v.name;
  static const Field<UserPlaylist, String> _f$name = Field('name', _$name);
  static String _$userId(UserPlaylist v) => v.userId;
  static const Field<UserPlaylist, String> _f$userId =
      Field('userId', _$userId, key: 'user_id');

  @override
  final MappableFields<UserPlaylist> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #name: _f$name,
    #userId: _f$userId,
  };

  static UserPlaylist _instantiate(DecodingData data) {
    return UserPlaylist(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        name: data.dec(_f$name),
        userId: data.dec(_f$userId));
  }

  @override
  final Function instantiate = _instantiate;

  static UserPlaylist fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserPlaylist>(map);
  }

  static UserPlaylist fromJson(String json) {
    return ensureInitialized().decodeJson<UserPlaylist>(json);
  }
}

mixin UserPlaylistMappable {
  String toJson() {
    return UserPlaylistMapper.ensureInitialized()
        .encodeJson<UserPlaylist>(this as UserPlaylist);
  }

  Map<String, dynamic> toMap() {
    return UserPlaylistMapper.ensureInitialized()
        .encodeMap<UserPlaylist>(this as UserPlaylist);
  }

  UserPlaylistCopyWith<UserPlaylist, UserPlaylist, UserPlaylist> get copyWith =>
      _UserPlaylistCopyWithImpl(this as UserPlaylist, $identity, $identity);
  @override
  String toString() {
    return UserPlaylistMapper.ensureInitialized()
        .stringifyValue(this as UserPlaylist);
  }

  @override
  bool operator ==(Object other) {
    return UserPlaylistMapper.ensureInitialized()
        .equalsValue(this as UserPlaylist, other);
  }

  @override
  int get hashCode {
    return UserPlaylistMapper.ensureInitialized()
        .hashValue(this as UserPlaylist);
  }
}

extension UserPlaylistValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserPlaylist, $Out> {
  UserPlaylistCopyWith<$R, UserPlaylist, $Out> get $asUserPlaylist =>
      $base.as((v, t, t2) => _UserPlaylistCopyWithImpl(v, t, t2));
}

abstract class UserPlaylistCopyWith<$R, $In extends UserPlaylist, $Out>
    implements PBBaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? name,
      String? userId});
  UserPlaylistCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserPlaylistCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserPlaylist, $Out>
    implements UserPlaylistCopyWith<$R, UserPlaylist, $Out> {
  _UserPlaylistCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserPlaylist> $mapper =
      UserPlaylistMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          String? name,
          String? userId}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (name != null) #name: name,
        if (userId != null) #userId: userId
      }));
  @override
  UserPlaylist $make(CopyWithData data) => UserPlaylist(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      name: data.get(#name, or: $value.name),
      userId: data.get(#userId, or: $value.userId));

  @override
  UserPlaylistCopyWith<$R2, UserPlaylist, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserPlaylistCopyWithImpl($value, $cast, t);
}

class UserPlaylistItemMapper extends ClassMapperBase<UserPlaylistItem> {
  UserPlaylistItemMapper._();

  static UserPlaylistItemMapper? _instance;
  static UserPlaylistItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserPlaylistItemMapper._());
      PBBaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserPlaylistItem';

  static String _$id(UserPlaylistItem v) => v.id;
  static const Field<UserPlaylistItem, String> _f$id = Field('id', _$id);
  static DateTime _$created(UserPlaylistItem v) => v.created;
  static const Field<UserPlaylistItem, DateTime> _f$created =
      Field('created', _$created);
  static DateTime _$updated(UserPlaylistItem v) => v.updated;
  static const Field<UserPlaylistItem, DateTime> _f$updated =
      Field('updated', _$updated);
  static bool _$deleted(UserPlaylistItem v) => v.deleted;
  static const Field<UserPlaylistItem, bool> _f$deleted =
      Field('deleted', _$deleted);
  static bool _$synced(UserPlaylistItem v) => v.synced;
  static const Field<UserPlaylistItem, bool> _f$synced =
      Field('synced', _$synced);
  static bool _$fresh(UserPlaylistItem v) => v.fresh;
  static const Field<UserPlaylistItem, bool> _f$fresh = Field('fresh', _$fresh);
  static String _$playlistId(UserPlaylistItem v) => v.playlistId;
  static const Field<UserPlaylistItem, String> _f$playlistId =
      Field('playlistId', _$playlistId, key: 'playlist_id');
  static String _$userId(UserPlaylistItem v) => v.userId;
  static const Field<UserPlaylistItem, String> _f$userId =
      Field('userId', _$userId, key: 'user_id');
  static String _$songId(UserPlaylistItem v) => v.songId;
  static const Field<UserPlaylistItem, String> _f$songId =
      Field('songId', _$songId, key: 'song_id');
  static double _$order(UserPlaylistItem v) => v.order;
  static const Field<UserPlaylistItem, double> _f$order =
      Field('order', _$order);

  @override
  final MappableFields<UserPlaylistItem> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #playlistId: _f$playlistId,
    #userId: _f$userId,
    #songId: _f$songId,
    #order: _f$order,
  };

  static UserPlaylistItem _instantiate(DecodingData data) {
    return UserPlaylistItem(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        playlistId: data.dec(_f$playlistId),
        userId: data.dec(_f$userId),
        songId: data.dec(_f$songId),
        order: data.dec(_f$order));
  }

  @override
  final Function instantiate = _instantiate;

  static UserPlaylistItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserPlaylistItem>(map);
  }

  static UserPlaylistItem fromJson(String json) {
    return ensureInitialized().decodeJson<UserPlaylistItem>(json);
  }
}

mixin UserPlaylistItemMappable {
  String toJson() {
    return UserPlaylistItemMapper.ensureInitialized()
        .encodeJson<UserPlaylistItem>(this as UserPlaylistItem);
  }

  Map<String, dynamic> toMap() {
    return UserPlaylistItemMapper.ensureInitialized()
        .encodeMap<UserPlaylistItem>(this as UserPlaylistItem);
  }

  UserPlaylistItemCopyWith<UserPlaylistItem, UserPlaylistItem, UserPlaylistItem>
      get copyWith => _UserPlaylistItemCopyWithImpl(
          this as UserPlaylistItem, $identity, $identity);
  @override
  String toString() {
    return UserPlaylistItemMapper.ensureInitialized()
        .stringifyValue(this as UserPlaylistItem);
  }

  @override
  bool operator ==(Object other) {
    return UserPlaylistItemMapper.ensureInitialized()
        .equalsValue(this as UserPlaylistItem, other);
  }

  @override
  int get hashCode {
    return UserPlaylistItemMapper.ensureInitialized()
        .hashValue(this as UserPlaylistItem);
  }
}

extension UserPlaylistItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserPlaylistItem, $Out> {
  UserPlaylistItemCopyWith<$R, UserPlaylistItem, $Out>
      get $asUserPlaylistItem =>
          $base.as((v, t, t2) => _UserPlaylistItemCopyWithImpl(v, t, t2));
}

abstract class UserPlaylistItemCopyWith<$R, $In extends UserPlaylistItem, $Out>
    implements PBBaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? playlistId,
      String? userId,
      String? songId,
      double? order});
  UserPlaylistItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserPlaylistItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserPlaylistItem, $Out>
    implements UserPlaylistItemCopyWith<$R, UserPlaylistItem, $Out> {
  _UserPlaylistItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserPlaylistItem> $mapper =
      UserPlaylistItemMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          String? playlistId,
          String? userId,
          String? songId,
          double? order}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (playlistId != null) #playlistId: playlistId,
        if (userId != null) #userId: userId,
        if (songId != null) #songId: songId,
        if (order != null) #order: order
      }));
  @override
  UserPlaylistItem $make(CopyWithData data) => UserPlaylistItem(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      playlistId: data.get(#playlistId, or: $value.playlistId),
      userId: data.get(#userId, or: $value.userId),
      songId: data.get(#songId, or: $value.songId),
      order: data.get(#order, or: $value.order));

  @override
  UserPlaylistItemCopyWith<$R2, UserPlaylistItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserPlaylistItemCopyWithImpl($value, $cast, t);
}

class SongMapper extends ClassMapperBase<Song> {
  SongMapper._();

  static SongMapper? _instance;
  static SongMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SongMapper._());
      PBBaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Song';

  static String _$id(Song v) => v.id;
  static const Field<Song, String> _f$id = Field('id', _$id);
  static DateTime _$created(Song v) => v.created;
  static const Field<Song, DateTime> _f$created = Field('created', _$created);
  static DateTime _$updated(Song v) => v.updated;
  static const Field<Song, DateTime> _f$updated = Field('updated', _$updated);
  static bool _$deleted(Song v) => v.deleted;
  static const Field<Song, bool> _f$deleted = Field('deleted', _$deleted);
  static bool _$synced(Song v) => v.synced;
  static const Field<Song, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(Song v) => v.fresh;
  static const Field<Song, bool> _f$fresh = Field('fresh', _$fresh);
  static String _$name(Song v) => v.name;
  static const Field<Song, String> _f$name = Field('name', _$name);
  static String? _$downloadLink(Song v) => v.downloadLink;
  static const Field<Song, String> _f$downloadLink =
      Field('downloadLink', _$downloadLink, key: 'download_link', opt: true);
  static String? _$artistId(Song v) => v.artistId;
  static const Field<Song, String> _f$artistId =
      Field('artistId', _$artistId, key: 'artist_id', opt: true);

  @override
  final MappableFields<Song> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #name: _f$name,
    #downloadLink: _f$downloadLink,
    #artistId: _f$artistId,
  };

  static Song _instantiate(DecodingData data) {
    return Song(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        name: data.dec(_f$name),
        downloadLink: data.dec(_f$downloadLink),
        artistId: data.dec(_f$artistId));
  }

  @override
  final Function instantiate = _instantiate;

  static Song fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Song>(map);
  }

  static Song fromJson(String json) {
    return ensureInitialized().decodeJson<Song>(json);
  }
}

mixin SongMappable {
  String toJson() {
    return SongMapper.ensureInitialized().encodeJson<Song>(this as Song);
  }

  Map<String, dynamic> toMap() {
    return SongMapper.ensureInitialized().encodeMap<Song>(this as Song);
  }

  SongCopyWith<Song, Song, Song> get copyWith =>
      _SongCopyWithImpl(this as Song, $identity, $identity);
  @override
  String toString() {
    return SongMapper.ensureInitialized().stringifyValue(this as Song);
  }

  @override
  bool operator ==(Object other) {
    return SongMapper.ensureInitialized().equalsValue(this as Song, other);
  }

  @override
  int get hashCode {
    return SongMapper.ensureInitialized().hashValue(this as Song);
  }
}

extension SongValueCopy<$R, $Out> on ObjectCopyWith<$R, Song, $Out> {
  SongCopyWith<$R, Song, $Out> get $asSong =>
      $base.as((v, t, t2) => _SongCopyWithImpl(v, t, t2));
}

abstract class SongCopyWith<$R, $In extends Song, $Out>
    implements PBBaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? name,
      String? downloadLink,
      String? artistId});
  SongCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SongCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Song, $Out>
    implements SongCopyWith<$R, Song, $Out> {
  _SongCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Song> $mapper = SongMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          String? name,
          Object? downloadLink = $none,
          Object? artistId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (name != null) #name: name,
        if (downloadLink != $none) #downloadLink: downloadLink,
        if (artistId != $none) #artistId: artistId
      }));
  @override
  Song $make(CopyWithData data) => Song(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      name: data.get(#name, or: $value.name),
      downloadLink: data.get(#downloadLink, or: $value.downloadLink),
      artistId: data.get(#artistId, or: $value.artistId));

  @override
  SongCopyWith<$R2, Song, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SongCopyWithImpl($value, $cast, t);
}

class ArtistMapper extends ClassMapperBase<Artist> {
  ArtistMapper._();

  static ArtistMapper? _instance;
  static ArtistMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArtistMapper._());
      PBAuthMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Artist';

  static String _$id(Artist v) => v.id;
  static const Field<Artist, String> _f$id = Field('id', _$id);
  static DateTime _$created(Artist v) => v.created;
  static const Field<Artist, DateTime> _f$created = Field('created', _$created);
  static DateTime _$updated(Artist v) => v.updated;
  static const Field<Artist, DateTime> _f$updated = Field('updated', _$updated);
  static bool _$deleted(Artist v) => v.deleted;
  static const Field<Artist, bool> _f$deleted = Field('deleted', _$deleted);
  static bool _$synced(Artist v) => v.synced;
  static const Field<Artist, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(Artist v) => v.fresh;
  static const Field<Artist, bool> _f$fresh = Field('fresh', _$fresh);
  static String? _$username(Artist v) => v.username;
  static const Field<Artist, String> _f$username =
      Field('username', _$username);
  static String? _$email(Artist v) => v.email;
  static const Field<Artist, String> _f$email = Field('email', _$email);
  static bool? _$emailVisibility(Artist v) => v.emailVisibility;
  static const Field<Artist, bool> _f$emailVisibility =
      Field('emailVisibility', _$emailVisibility);
  static bool? _$verified(Artist v) => v.verified;
  static const Field<Artist, bool> _f$verified = Field('verified', _$verified);

  @override
  final MappableFields<Artist> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #username: _f$username,
    #email: _f$email,
    #emailVisibility: _f$emailVisibility,
    #verified: _f$verified,
  };

  static Artist _instantiate(DecodingData data) {
    return Artist(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        username: data.dec(_f$username),
        email: data.dec(_f$email),
        emailVisibility: data.dec(_f$emailVisibility),
        verified: data.dec(_f$verified));
  }

  @override
  final Function instantiate = _instantiate;

  static Artist fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Artist>(map);
  }

  static Artist fromJson(String json) {
    return ensureInitialized().decodeJson<Artist>(json);
  }
}

mixin ArtistMappable {
  String toJson() {
    return ArtistMapper.ensureInitialized().encodeJson<Artist>(this as Artist);
  }

  Map<String, dynamic> toMap() {
    return ArtistMapper.ensureInitialized().encodeMap<Artist>(this as Artist);
  }

  ArtistCopyWith<Artist, Artist, Artist> get copyWith =>
      _ArtistCopyWithImpl(this as Artist, $identity, $identity);
  @override
  String toString() {
    return ArtistMapper.ensureInitialized().stringifyValue(this as Artist);
  }

  @override
  bool operator ==(Object other) {
    return ArtistMapper.ensureInitialized().equalsValue(this as Artist, other);
  }

  @override
  int get hashCode {
    return ArtistMapper.ensureInitialized().hashValue(this as Artist);
  }
}

extension ArtistValueCopy<$R, $Out> on ObjectCopyWith<$R, Artist, $Out> {
  ArtistCopyWith<$R, Artist, $Out> get $asArtist =>
      $base.as((v, t, t2) => _ArtistCopyWithImpl(v, t, t2));
}

abstract class ArtistCopyWith<$R, $In extends Artist, $Out>
    implements PBAuthCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? username,
      String? email,
      bool? emailVisibility,
      bool? verified});
  ArtistCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ArtistCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Artist, $Out>
    implements ArtistCopyWith<$R, Artist, $Out> {
  _ArtistCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Artist> $mapper = ArtistMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          Object? username = $none,
          Object? email = $none,
          Object? emailVisibility = $none,
          Object? verified = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (username != $none) #username: username,
        if (email != $none) #email: email,
        if (emailVisibility != $none) #emailVisibility: emailVisibility,
        if (verified != $none) #verified: verified
      }));
  @override
  Artist $make(CopyWithData data) => Artist(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      username: data.get(#username, or: $value.username),
      email: data.get(#email, or: $value.email),
      emailVisibility: data.get(#emailVisibility, or: $value.emailVisibility),
      verified: data.get(#verified, or: $value.verified));

  @override
  ArtistCopyWith<$R2, Artist, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ArtistCopyWithImpl($value, $cast, t);
}

class UserActivityMapper extends ClassMapperBase<UserActivity> {
  UserActivityMapper._();

  static UserActivityMapper? _instance;
  static UserActivityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserActivityMapper._());
      PBBaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserActivity';

  static String _$id(UserActivity v) => v.id;
  static const Field<UserActivity, String> _f$id = Field('id', _$id);
  static DateTime _$created(UserActivity v) => v.created;
  static const Field<UserActivity, DateTime> _f$created =
      Field('created', _$created);
  static DateTime _$updated(UserActivity v) => v.updated;
  static const Field<UserActivity, DateTime> _f$updated =
      Field('updated', _$updated);
  static bool _$deleted(UserActivity v) => v.deleted;
  static const Field<UserActivity, bool> _f$deleted =
      Field('deleted', _$deleted);
  static bool _$synced(UserActivity v) => v.synced;
  static const Field<UserActivity, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(UserActivity v) => v.fresh;
  static const Field<UserActivity, bool> _f$fresh = Field('fresh', _$fresh);
  static String _$userId(UserActivity v) => v.userId;
  static const Field<UserActivity, String> _f$userId =
      Field('userId', _$userId, key: 'user_id');
  static String _$collectionId(UserActivity v) => v.collectionId;
  static const Field<UserActivity, String> _f$collectionId =
      Field('collectionId', _$collectionId, key: 'collection_id');
  static String _$recordId(UserActivity v) => v.recordId;
  static const Field<UserActivity, String> _f$recordId =
      Field('recordId', _$recordId, key: 'record_id');
  static String _$recordData(UserActivity v) => v.recordData;
  static const Field<UserActivity, String> _f$recordData =
      Field('recordData', _$recordData, key: 'record_data');
  static String _$type(UserActivity v) => v.type;
  static const Field<UserActivity, String> _f$type = Field('type', _$type);
  static bool? _$private(UserActivity v) => v.private;
  static const Field<UserActivity, bool> _f$private =
      Field('private', _$private, opt: true);

  @override
  final MappableFields<UserActivity> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #userId: _f$userId,
    #collectionId: _f$collectionId,
    #recordId: _f$recordId,
    #recordData: _f$recordData,
    #type: _f$type,
    #private: _f$private,
  };

  static UserActivity _instantiate(DecodingData data) {
    return UserActivity(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        userId: data.dec(_f$userId),
        collectionId: data.dec(_f$collectionId),
        recordId: data.dec(_f$recordId),
        recordData: data.dec(_f$recordData),
        type: data.dec(_f$type),
        private: data.dec(_f$private));
  }

  @override
  final Function instantiate = _instantiate;

  static UserActivity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserActivity>(map);
  }

  static UserActivity fromJson(String json) {
    return ensureInitialized().decodeJson<UserActivity>(json);
  }
}

mixin UserActivityMappable {
  String toJson() {
    return UserActivityMapper.ensureInitialized()
        .encodeJson<UserActivity>(this as UserActivity);
  }

  Map<String, dynamic> toMap() {
    return UserActivityMapper.ensureInitialized()
        .encodeMap<UserActivity>(this as UserActivity);
  }

  UserActivityCopyWith<UserActivity, UserActivity, UserActivity> get copyWith =>
      _UserActivityCopyWithImpl(this as UserActivity, $identity, $identity);
  @override
  String toString() {
    return UserActivityMapper.ensureInitialized()
        .stringifyValue(this as UserActivity);
  }

  @override
  bool operator ==(Object other) {
    return UserActivityMapper.ensureInitialized()
        .equalsValue(this as UserActivity, other);
  }

  @override
  int get hashCode {
    return UserActivityMapper.ensureInitialized()
        .hashValue(this as UserActivity);
  }
}

extension UserActivityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserActivity, $Out> {
  UserActivityCopyWith<$R, UserActivity, $Out> get $asUserActivity =>
      $base.as((v, t, t2) => _UserActivityCopyWithImpl(v, t, t2));
}

abstract class UserActivityCopyWith<$R, $In extends UserActivity, $Out>
    implements PBBaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? userId,
      String? collectionId,
      String? recordId,
      String? recordData,
      String? type,
      bool? private});
  UserActivityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserActivityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserActivity, $Out>
    implements UserActivityCopyWith<$R, UserActivity, $Out> {
  _UserActivityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserActivity> $mapper =
      UserActivityMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          String? userId,
          String? collectionId,
          String? recordId,
          String? recordData,
          String? type,
          Object? private = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (userId != null) #userId: userId,
        if (collectionId != null) #collectionId: collectionId,
        if (recordId != null) #recordId: recordId,
        if (recordData != null) #recordData: recordData,
        if (type != null) #type: type,
        if (private != $none) #private: private
      }));
  @override
  UserActivity $make(CopyWithData data) => UserActivity(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      userId: data.get(#userId, or: $value.userId),
      collectionId: data.get(#collectionId, or: $value.collectionId),
      recordId: data.get(#recordId, or: $value.recordId),
      recordData: data.get(#recordData, or: $value.recordData),
      type: data.get(#type, or: $value.type),
      private: data.get(#private, or: $value.private));

  @override
  UserActivityCopyWith<$R2, UserActivity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserActivityCopyWithImpl($value, $cast, t);
}

class DeletedRecordMapper extends ClassMapperBase<DeletedRecord> {
  DeletedRecordMapper._();

  static DeletedRecordMapper? _instance;
  static DeletedRecordMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeletedRecordMapper._());
      PBBaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DeletedRecord';

  static String _$id(DeletedRecord v) => v.id;
  static const Field<DeletedRecord, String> _f$id = Field('id', _$id);
  static DateTime _$created(DeletedRecord v) => v.created;
  static const Field<DeletedRecord, DateTime> _f$created =
      Field('created', _$created);
  static DateTime _$updated(DeletedRecord v) => v.updated;
  static const Field<DeletedRecord, DateTime> _f$updated =
      Field('updated', _$updated);
  static bool _$deleted(DeletedRecord v) => v.deleted;
  static const Field<DeletedRecord, bool> _f$deleted =
      Field('deleted', _$deleted);
  static bool _$synced(DeletedRecord v) => v.synced;
  static const Field<DeletedRecord, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(DeletedRecord v) => v.fresh;
  static const Field<DeletedRecord, bool> _f$fresh = Field('fresh', _$fresh);
  static String _$collectionId(DeletedRecord v) => v.collectionId;
  static const Field<DeletedRecord, String> _f$collectionId =
      Field('collectionId', _$collectionId, key: 'collection_id');
  static String _$recordId(DeletedRecord v) => v.recordId;
  static const Field<DeletedRecord, String> _f$recordId =
      Field('recordId', _$recordId, key: 'record_id');
  static String _$recordData(DeletedRecord v) => v.recordData;
  static const Field<DeletedRecord, String> _f$recordData =
      Field('recordData', _$recordData, key: 'record_data');

  @override
  final MappableFields<DeletedRecord> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #collectionId: _f$collectionId,
    #recordId: _f$recordId,
    #recordData: _f$recordData,
  };

  static DeletedRecord _instantiate(DecodingData data) {
    return DeletedRecord(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        collectionId: data.dec(_f$collectionId),
        recordId: data.dec(_f$recordId),
        recordData: data.dec(_f$recordData));
  }

  @override
  final Function instantiate = _instantiate;

  static DeletedRecord fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DeletedRecord>(map);
  }

  static DeletedRecord fromJson(String json) {
    return ensureInitialized().decodeJson<DeletedRecord>(json);
  }
}

mixin DeletedRecordMappable {
  String toJson() {
    return DeletedRecordMapper.ensureInitialized()
        .encodeJson<DeletedRecord>(this as DeletedRecord);
  }

  Map<String, dynamic> toMap() {
    return DeletedRecordMapper.ensureInitialized()
        .encodeMap<DeletedRecord>(this as DeletedRecord);
  }

  DeletedRecordCopyWith<DeletedRecord, DeletedRecord, DeletedRecord>
      get copyWith => _DeletedRecordCopyWithImpl(
          this as DeletedRecord, $identity, $identity);
  @override
  String toString() {
    return DeletedRecordMapper.ensureInitialized()
        .stringifyValue(this as DeletedRecord);
  }

  @override
  bool operator ==(Object other) {
    return DeletedRecordMapper.ensureInitialized()
        .equalsValue(this as DeletedRecord, other);
  }

  @override
  int get hashCode {
    return DeletedRecordMapper.ensureInitialized()
        .hashValue(this as DeletedRecord);
  }
}

extension DeletedRecordValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DeletedRecord, $Out> {
  DeletedRecordCopyWith<$R, DeletedRecord, $Out> get $asDeletedRecord =>
      $base.as((v, t, t2) => _DeletedRecordCopyWithImpl(v, t, t2));
}

abstract class DeletedRecordCopyWith<$R, $In extends DeletedRecord, $Out>
    implements PBBaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? collectionId,
      String? recordId,
      String? recordData});
  DeletedRecordCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DeletedRecordCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DeletedRecord, $Out>
    implements DeletedRecordCopyWith<$R, DeletedRecord, $Out> {
  _DeletedRecordCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DeletedRecord> $mapper =
      DeletedRecordMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          String? collectionId,
          String? recordId,
          String? recordData}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (collectionId != null) #collectionId: collectionId,
        if (recordId != null) #recordId: recordId,
        if (recordData != null) #recordData: recordData
      }));
  @override
  DeletedRecord $make(CopyWithData data) => DeletedRecord(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      collectionId: data.get(#collectionId, or: $value.collectionId),
      recordId: data.get(#recordId, or: $value.recordId),
      recordData: data.get(#recordData, or: $value.recordData));

  @override
  DeletedRecordCopyWith<$R2, DeletedRecord, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DeletedRecordCopyWithImpl($value, $cast, t);
}

class UserLikedSongMapper extends ClassMapperBase<UserLikedSong> {
  UserLikedSongMapper._();

  static UserLikedSongMapper? _instance;
  static UserLikedSongMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserLikedSongMapper._());
      PBBaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserLikedSong';

  static String _$id(UserLikedSong v) => v.id;
  static const Field<UserLikedSong, String> _f$id = Field('id', _$id);
  static DateTime _$created(UserLikedSong v) => v.created;
  static const Field<UserLikedSong, DateTime> _f$created =
      Field('created', _$created);
  static DateTime _$updated(UserLikedSong v) => v.updated;
  static const Field<UserLikedSong, DateTime> _f$updated =
      Field('updated', _$updated);
  static bool _$deleted(UserLikedSong v) => v.deleted;
  static const Field<UserLikedSong, bool> _f$deleted =
      Field('deleted', _$deleted);
  static bool _$synced(UserLikedSong v) => v.synced;
  static const Field<UserLikedSong, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(UserLikedSong v) => v.fresh;
  static const Field<UserLikedSong, bool> _f$fresh = Field('fresh', _$fresh);
  static String _$userId(UserLikedSong v) => v.userId;
  static const Field<UserLikedSong, String> _f$userId =
      Field('userId', _$userId, key: 'user_id');
  static String _$songId(UserLikedSong v) => v.songId;
  static const Field<UserLikedSong, String> _f$songId =
      Field('songId', _$songId, key: 'song_id');

  @override
  final MappableFields<UserLikedSong> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #userId: _f$userId,
    #songId: _f$songId,
  };

  static UserLikedSong _instantiate(DecodingData data) {
    return UserLikedSong(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        userId: data.dec(_f$userId),
        songId: data.dec(_f$songId));
  }

  @override
  final Function instantiate = _instantiate;

  static UserLikedSong fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserLikedSong>(map);
  }

  static UserLikedSong fromJson(String json) {
    return ensureInitialized().decodeJson<UserLikedSong>(json);
  }
}

mixin UserLikedSongMappable {
  String toJson() {
    return UserLikedSongMapper.ensureInitialized()
        .encodeJson<UserLikedSong>(this as UserLikedSong);
  }

  Map<String, dynamic> toMap() {
    return UserLikedSongMapper.ensureInitialized()
        .encodeMap<UserLikedSong>(this as UserLikedSong);
  }

  UserLikedSongCopyWith<UserLikedSong, UserLikedSong, UserLikedSong>
      get copyWith => _UserLikedSongCopyWithImpl(
          this as UserLikedSong, $identity, $identity);
  @override
  String toString() {
    return UserLikedSongMapper.ensureInitialized()
        .stringifyValue(this as UserLikedSong);
  }

  @override
  bool operator ==(Object other) {
    return UserLikedSongMapper.ensureInitialized()
        .equalsValue(this as UserLikedSong, other);
  }

  @override
  int get hashCode {
    return UserLikedSongMapper.ensureInitialized()
        .hashValue(this as UserLikedSong);
  }
}

extension UserLikedSongValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserLikedSong, $Out> {
  UserLikedSongCopyWith<$R, UserLikedSong, $Out> get $asUserLikedSong =>
      $base.as((v, t, t2) => _UserLikedSongCopyWithImpl(v, t, t2));
}

abstract class UserLikedSongCopyWith<$R, $In extends UserLikedSong, $Out>
    implements PBBaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? userId,
      String? songId});
  UserLikedSongCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserLikedSongCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserLikedSong, $Out>
    implements UserLikedSongCopyWith<$R, UserLikedSong, $Out> {
  _UserLikedSongCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserLikedSong> $mapper =
      UserLikedSongMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          String? userId,
          String? songId}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (userId != null) #userId: userId,
        if (songId != null) #songId: songId
      }));
  @override
  UserLikedSong $make(CopyWithData data) => UserLikedSong(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      userId: data.get(#userId, or: $value.userId),
      songId: data.get(#songId, or: $value.songId));

  @override
  UserLikedSongCopyWith<$R2, UserLikedSong, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserLikedSongCopyWithImpl($value, $cast, t);
}

class UserFollowerMapper extends ClassMapperBase<UserFollower> {
  UserFollowerMapper._();

  static UserFollowerMapper? _instance;
  static UserFollowerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserFollowerMapper._());
      PBBaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserFollower';

  static String _$id(UserFollower v) => v.id;
  static const Field<UserFollower, String> _f$id = Field('id', _$id);
  static DateTime _$created(UserFollower v) => v.created;
  static const Field<UserFollower, DateTime> _f$created =
      Field('created', _$created);
  static DateTime _$updated(UserFollower v) => v.updated;
  static const Field<UserFollower, DateTime> _f$updated =
      Field('updated', _$updated);
  static bool _$deleted(UserFollower v) => v.deleted;
  static const Field<UserFollower, bool> _f$deleted =
      Field('deleted', _$deleted);
  static bool _$synced(UserFollower v) => v.synced;
  static const Field<UserFollower, bool> _f$synced = Field('synced', _$synced);
  static bool _$fresh(UserFollower v) => v.fresh;
  static const Field<UserFollower, bool> _f$fresh = Field('fresh', _$fresh);
  static String _$userId(UserFollower v) => v.userId;
  static const Field<UserFollower, String> _f$userId =
      Field('userId', _$userId, key: 'user_id');
  static String _$targetUserId(UserFollower v) => v.targetUserId;
  static const Field<UserFollower, String> _f$targetUserId =
      Field('targetUserId', _$targetUserId, key: 'target_user_id');

  @override
  final MappableFields<UserFollower> fields = const {
    #id: _f$id,
    #created: _f$created,
    #updated: _f$updated,
    #deleted: _f$deleted,
    #synced: _f$synced,
    #fresh: _f$fresh,
    #userId: _f$userId,
    #targetUserId: _f$targetUserId,
  };

  static UserFollower _instantiate(DecodingData data) {
    return UserFollower(
        id: data.dec(_f$id),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        deleted: data.dec(_f$deleted),
        synced: data.dec(_f$synced),
        fresh: data.dec(_f$fresh),
        userId: data.dec(_f$userId),
        targetUserId: data.dec(_f$targetUserId));
  }

  @override
  final Function instantiate = _instantiate;

  static UserFollower fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserFollower>(map);
  }

  static UserFollower fromJson(String json) {
    return ensureInitialized().decodeJson<UserFollower>(json);
  }
}

mixin UserFollowerMappable {
  String toJson() {
    return UserFollowerMapper.ensureInitialized()
        .encodeJson<UserFollower>(this as UserFollower);
  }

  Map<String, dynamic> toMap() {
    return UserFollowerMapper.ensureInitialized()
        .encodeMap<UserFollower>(this as UserFollower);
  }

  UserFollowerCopyWith<UserFollower, UserFollower, UserFollower> get copyWith =>
      _UserFollowerCopyWithImpl(this as UserFollower, $identity, $identity);
  @override
  String toString() {
    return UserFollowerMapper.ensureInitialized()
        .stringifyValue(this as UserFollower);
  }

  @override
  bool operator ==(Object other) {
    return UserFollowerMapper.ensureInitialized()
        .equalsValue(this as UserFollower, other);
  }

  @override
  int get hashCode {
    return UserFollowerMapper.ensureInitialized()
        .hashValue(this as UserFollower);
  }
}

extension UserFollowerValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserFollower, $Out> {
  UserFollowerCopyWith<$R, UserFollower, $Out> get $asUserFollower =>
      $base.as((v, t, t2) => _UserFollowerCopyWithImpl(v, t, t2));
}

abstract class UserFollowerCopyWith<$R, $In extends UserFollower, $Out>
    implements PBBaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      DateTime? created,
      DateTime? updated,
      bool? deleted,
      bool? synced,
      bool? fresh,
      String? userId,
      String? targetUserId});
  UserFollowerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserFollowerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserFollower, $Out>
    implements UserFollowerCopyWith<$R, UserFollower, $Out> {
  _UserFollowerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserFollower> $mapper =
      UserFollowerMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          DateTime? created,
          DateTime? updated,
          bool? deleted,
          bool? synced,
          bool? fresh,
          String? userId,
          String? targetUserId}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (deleted != null) #deleted: deleted,
        if (synced != null) #synced: synced,
        if (fresh != null) #fresh: fresh,
        if (userId != null) #userId: userId,
        if (targetUserId != null) #targetUserId: targetUserId
      }));
  @override
  UserFollower $make(CopyWithData data) => UserFollower(
      id: data.get(#id, or: $value.id),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      deleted: data.get(#deleted, or: $value.deleted),
      synced: data.get(#synced, or: $value.synced),
      fresh: data.get(#fresh, or: $value.fresh),
      userId: data.get(#userId, or: $value.userId),
      targetUserId: data.get(#targetUserId, or: $value.targetUserId));

  @override
  UserFollowerCopyWith<$R2, UserFollower, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserFollowerCopyWithImpl($value, $cast, t);
}
