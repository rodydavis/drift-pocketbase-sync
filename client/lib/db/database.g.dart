// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class KeyValue extends Table with TableInfo<KeyValue, KeyValueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  KeyValue(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'key_value';
  @override
  VerificationContext validateIntegrity(Insertable<KeyValueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {key},
      ];
  @override
  KeyValueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KeyValueData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value']),
    );
  }

  @override
  KeyValue createAlias(String alias) {
    return KeyValue(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE("key")'];
  @override
  bool get dontWriteConstraints => true;
}

class KeyValueData extends DataClass implements Insertable<KeyValueData> {
  String key;
  String? value;
  KeyValueData({required this.key, this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  KeyValueCompanion toCompanion(bool nullToAbsent) {
    return KeyValueCompanion(
      key: Value(key),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory KeyValueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KeyValueData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String?>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String?>(value),
    };
  }

  KeyValueData copyWith(
          {String? key, Value<String?> value = const Value.absent()}) =>
      KeyValueData(
        key: key ?? this.key,
        value: value.present ? value.value : this.value,
      );
  @override
  String toString() {
    return (StringBuffer('KeyValueData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KeyValueData &&
          other.key == this.key &&
          other.value == this.value);
}

class KeyValueCompanion extends UpdateCompanion<KeyValueData> {
  Value<String> key;
  Value<String?> value;
  Value<int> rowid;
  KeyValueCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KeyValueCompanion.insert({
    required String key,
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key);
  static Insertable<KeyValueData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KeyValueCompanion copyWith(
      {Value<String>? key, Value<String?>? value, Value<int>? rowid}) {
    return KeyValueCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeyValueCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Users extends Table with TableInfo<Users, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _emailVisibilityMeta =
      const VerificationMeta('emailVisibility');
  late final GeneratedColumn<bool> emailVisibility = GeneratedColumn<bool>(
      'emailVisibility', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _verifiedMeta =
      const VerificationMeta('verified');
  late final GeneratedColumn<bool> verified = GeneratedColumn<bool>(
      'verified', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
      'avatar', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        created,
        updated,
        deleted,
        synced,
        fresh,
        username,
        email,
        emailVisibility,
        verified,
        name,
        avatar
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('emailVisibility')) {
      context.handle(
          _emailVisibilityMeta,
          emailVisibility.isAcceptableOrUnknown(
              data['emailVisibility']!, _emailVisibilityMeta));
    }
    if (data.containsKey('verified')) {
      context.handle(_verifiedMeta,
          verified.isAcceptableOrUnknown(data['verified']!, _verifiedMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      emailVisibility: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}emailVisibility']),
      verified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}verified']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      avatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar']),
    );
  }

  @override
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UsersCompanion extends UpdateCompanion<User> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String?> username;
  Value<String> email;
  Value<bool?> emailVisibility;
  Value<bool?> verified;
  Value<String?> name;
  Value<String?> avatar;
  Value<int> rowid;
  UsersCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.emailVisibility = const Value.absent(),
    this.verified = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.username = const Value.absent(),
    required String email,
    this.emailVisibility = const Value.absent(),
    this.verified = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        email = Value(email);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? username,
    Expression<String>? email,
    Expression<bool>? emailVisibility,
    Expression<bool>? verified,
    Expression<String>? name,
    Expression<String>? avatar,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (emailVisibility != null) 'emailVisibility': emailVisibility,
      if (verified != null) 'verified': verified,
      if (name != null) 'name': name,
      if (avatar != null) 'avatar': avatar,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String?>? username,
      Value<String>? email,
      Value<bool?>? emailVisibility,
      Value<bool?>? verified,
      Value<String?>? name,
      Value<String?>? avatar,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      username: username ?? this.username,
      email: email ?? this.email,
      emailVisibility: emailVisibility ?? this.emailVisibility,
      verified: verified ?? this.verified,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (emailVisibility.present) {
      map['emailVisibility'] = Variable<bool>(emailVisibility.value);
    }
    if (verified.present) {
      map['verified'] = Variable<bool>(verified.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('emailVisibility: $emailVisibility, ')
          ..write('verified: $verified, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Albums extends Table with TableInfo<Albums, Album> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Albums(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, created, updated, deleted, synced, fresh, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'albums';
  @override
  VerificationContext validateIntegrity(Insertable<Album> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Album map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Album(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  Albums createAlias(String alias) {
    return Albums(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AlbumsCompanion extends UpdateCompanion<Album> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String> name;
  Value<int> rowid;
  AlbumsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlbumsCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    required String name,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        name = Value(name);
  static Insertable<Album> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlbumsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String>? name,
      Value<int>? rowid}) {
    return AlbumsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlbumsCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Artists extends Table with TableInfo<Artists, Artist> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Artists(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _emailVisibilityMeta =
      const VerificationMeta('emailVisibility');
  late final GeneratedColumn<bool> emailVisibility = GeneratedColumn<bool>(
      'emailVisibility', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _verifiedMeta =
      const VerificationMeta('verified');
  late final GeneratedColumn<bool> verified = GeneratedColumn<bool>(
      'verified', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        created,
        updated,
        deleted,
        synced,
        fresh,
        username,
        email,
        emailVisibility,
        verified
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'artists';
  @override
  VerificationContext validateIntegrity(Insertable<Artist> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('emailVisibility')) {
      context.handle(
          _emailVisibilityMeta,
          emailVisibility.isAcceptableOrUnknown(
              data['emailVisibility']!, _emailVisibilityMeta));
    }
    if (data.containsKey('verified')) {
      context.handle(_verifiedMeta,
          verified.isAcceptableOrUnknown(data['verified']!, _verifiedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Artist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Artist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      emailVisibility: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}emailVisibility']),
      verified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}verified']),
    );
  }

  @override
  Artists createAlias(String alias) {
    return Artists(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ArtistsCompanion extends UpdateCompanion<Artist> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String?> username;
  Value<String> email;
  Value<bool?> emailVisibility;
  Value<bool?> verified;
  Value<int> rowid;
  ArtistsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.emailVisibility = const Value.absent(),
    this.verified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArtistsCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.username = const Value.absent(),
    required String email,
    this.emailVisibility = const Value.absent(),
    this.verified = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        email = Value(email);
  static Insertable<Artist> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? username,
    Expression<String>? email,
    Expression<bool>? emailVisibility,
    Expression<bool>? verified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (emailVisibility != null) 'emailVisibility': emailVisibility,
      if (verified != null) 'verified': verified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArtistsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String?>? username,
      Value<String>? email,
      Value<bool?>? emailVisibility,
      Value<bool?>? verified,
      Value<int>? rowid}) {
    return ArtistsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      username: username ?? this.username,
      email: email ?? this.email,
      emailVisibility: emailVisibility ?? this.emailVisibility,
      verified: verified ?? this.verified,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (emailVisibility.present) {
      map['emailVisibility'] = Variable<bool>(emailVisibility.value);
    }
    if (verified.present) {
      map['verified'] = Variable<bool>(verified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtistsCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('emailVisibility: $emailVisibility, ')
          ..write('verified: $verified, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Songs extends Table with TableInfo<Songs, Song> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Songs(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _downloadLinkMeta =
      const VerificationMeta('downloadLink');
  late final GeneratedColumn<String> downloadLink = GeneratedColumn<String>(
      'download_link', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _artistIdMeta =
      const VerificationMeta('artistId');
  late final GeneratedColumn<String> artistId = GeneratedColumn<String>(
      'artist_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES artists(id)');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        created,
        updated,
        deleted,
        synced,
        fresh,
        name,
        downloadLink,
        artistId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'songs';
  @override
  VerificationContext validateIntegrity(Insertable<Song> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('download_link')) {
      context.handle(
          _downloadLinkMeta,
          downloadLink.isAcceptableOrUnknown(
              data['download_link']!, _downloadLinkMeta));
    }
    if (data.containsKey('artist_id')) {
      context.handle(_artistIdMeta,
          artistId.isAcceptableOrUnknown(data['artist_id']!, _artistIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Song map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Song(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      downloadLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}download_link']),
      artistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist_id']),
    );
  }

  @override
  Songs createAlias(String alias) {
    return Songs(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SongsCompanion extends UpdateCompanion<Song> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String> name;
  Value<String?> downloadLink;
  Value<String?> artistId;
  Value<int> rowid;
  SongsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.name = const Value.absent(),
    this.downloadLink = const Value.absent(),
    this.artistId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SongsCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    required String name,
    this.downloadLink = const Value.absent(),
    this.artistId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        name = Value(name);
  static Insertable<Song> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? name,
    Expression<String>? downloadLink,
    Expression<String>? artistId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (name != null) 'name': name,
      if (downloadLink != null) 'download_link': downloadLink,
      if (artistId != null) 'artist_id': artistId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SongsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String>? name,
      Value<String?>? downloadLink,
      Value<String?>? artistId,
      Value<int>? rowid}) {
    return SongsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      name: name ?? this.name,
      downloadLink: downloadLink ?? this.downloadLink,
      artistId: artistId ?? this.artistId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (downloadLink.present) {
      map['download_link'] = Variable<String>(downloadLink.value);
    }
    if (artistId.present) {
      map['artist_id'] = Variable<String>(artistId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongsCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('name: $name, ')
          ..write('downloadLink: $downloadLink, ')
          ..write('artistId: $artistId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class AlbumTracks extends Table with TableInfo<AlbumTracks, AlbumTrack> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AlbumTracks(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _albumIdMeta =
      const VerificationMeta('albumId');
  late final GeneratedColumn<String> albumId = GeneratedColumn<String>(
      'album_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES albums(id)ON UPDATE CASCADE ON DELETE CASCADE');
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  late final GeneratedColumn<String> songId = GeneratedColumn<String>(
      'song_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES songs(id)ON UPDATE CASCADE ON DELETE CASCADE');
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<double> order = GeneratedColumn<double>(
      'order', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, created, updated, deleted, synced, fresh, albumId, songId, order];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'album_tracks';
  @override
  VerificationContext validateIntegrity(Insertable<AlbumTrack> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('album_id')) {
      context.handle(_albumIdMeta,
          albumId.isAcceptableOrUnknown(data['album_id']!, _albumIdMeta));
    } else if (isInserting) {
      context.missing(_albumIdMeta);
    }
    if (data.containsKey('song_id')) {
      context.handle(_songIdMeta,
          songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta));
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AlbumTrack map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlbumTrack(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      albumId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}album_id'])!,
      songId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}order'])!,
    );
  }

  @override
  AlbumTracks createAlias(String alias) {
    return AlbumTracks(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AlbumTracksCompanion extends UpdateCompanion<AlbumTrack> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String> albumId;
  Value<String> songId;
  Value<double> order;
  Value<int> rowid;
  AlbumTracksCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.albumId = const Value.absent(),
    this.songId = const Value.absent(),
    this.order = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlbumTracksCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    required String albumId,
    required String songId,
    required double order,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        albumId = Value(albumId),
        songId = Value(songId),
        order = Value(order);
  static Insertable<AlbumTrack> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? albumId,
    Expression<String>? songId,
    Expression<double>? order,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (albumId != null) 'album_id': albumId,
      if (songId != null) 'song_id': songId,
      if (order != null) 'order': order,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlbumTracksCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String>? albumId,
      Value<String>? songId,
      Value<double>? order,
      Value<int>? rowid}) {
    return AlbumTracksCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      albumId: albumId ?? this.albumId,
      songId: songId ?? this.songId,
      order: order ?? this.order,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (albumId.present) {
      map['album_id'] = Variable<String>(albumId.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<String>(songId.value);
    }
    if (order.present) {
      map['order'] = Variable<double>(order.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlbumTracksCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('albumId: $albumId, ')
          ..write('songId: $songId, ')
          ..write('order: $order, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class UserPlaylists extends Table with TableInfo<UserPlaylists, UserPlaylist> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserPlaylists(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES users(id)ON UPDATE CASCADE ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns =>
      [id, created, updated, deleted, synced, fresh, name, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_playlists';
  @override
  VerificationContext validateIntegrity(Insertable<UserPlaylist> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserPlaylist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPlaylist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  UserPlaylists createAlias(String alias) {
    return UserPlaylists(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserPlaylistsCompanion extends UpdateCompanion<UserPlaylist> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String> name;
  Value<String> userId;
  Value<int> rowid;
  UserPlaylistsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.name = const Value.absent(),
    this.userId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserPlaylistsCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    required String name,
    required String userId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        name = Value(name),
        userId = Value(userId);
  static Insertable<UserPlaylist> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? name,
    Expression<String>? userId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (name != null) 'name': name,
      if (userId != null) 'user_id': userId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserPlaylistsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String>? name,
      Value<String>? userId,
      Value<int>? rowid}) {
    return UserPlaylistsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPlaylistsCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('name: $name, ')
          ..write('userId: $userId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class UserPlaylistItems extends Table
    with TableInfo<UserPlaylistItems, UserPlaylistItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserPlaylistItems(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _playlistIdMeta =
      const VerificationMeta('playlistId');
  late final GeneratedColumn<String> playlistId = GeneratedColumn<String>(
      'playlist_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES user_playlists(id)ON UPDATE CASCADE ON DELETE CASCADE');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES users(id)ON UPDATE CASCADE ON DELETE CASCADE');
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  late final GeneratedColumn<String> songId = GeneratedColumn<String>(
      'song_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES songs(id)ON UPDATE CASCADE ON DELETE CASCADE');
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<double> order = GeneratedColumn<double>(
      'order', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        created,
        updated,
        deleted,
        synced,
        fresh,
        playlistId,
        userId,
        songId,
        order
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_playlist_items';
  @override
  VerificationContext validateIntegrity(Insertable<UserPlaylistItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
          _playlistIdMeta,
          playlistId.isAcceptableOrUnknown(
              data['playlist_id']!, _playlistIdMeta));
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('song_id')) {
      context.handle(_songIdMeta,
          songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta));
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserPlaylistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPlaylistItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playlist_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      songId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}order'])!,
    );
  }

  @override
  UserPlaylistItems createAlias(String alias) {
    return UserPlaylistItems(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserPlaylistItemsCompanion extends UpdateCompanion<UserPlaylistItem> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String> playlistId;
  Value<String> userId;
  Value<String> songId;
  Value<double> order;
  Value<int> rowid;
  UserPlaylistItemsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.userId = const Value.absent(),
    this.songId = const Value.absent(),
    this.order = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserPlaylistItemsCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    required String playlistId,
    required String userId,
    required String songId,
    required double order,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        playlistId = Value(playlistId),
        userId = Value(userId),
        songId = Value(songId),
        order = Value(order);
  static Insertable<UserPlaylistItem> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? playlistId,
    Expression<String>? userId,
    Expression<String>? songId,
    Expression<double>? order,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (playlistId != null) 'playlist_id': playlistId,
      if (userId != null) 'user_id': userId,
      if (songId != null) 'song_id': songId,
      if (order != null) 'order': order,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserPlaylistItemsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String>? playlistId,
      Value<String>? userId,
      Value<String>? songId,
      Value<double>? order,
      Value<int>? rowid}) {
    return UserPlaylistItemsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      playlistId: playlistId ?? this.playlistId,
      userId: userId ?? this.userId,
      songId: songId ?? this.songId,
      order: order ?? this.order,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<String>(playlistId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<String>(songId.value);
    }
    if (order.present) {
      map['order'] = Variable<double>(order.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPlaylistItemsCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('playlistId: $playlistId, ')
          ..write('userId: $userId, ')
          ..write('songId: $songId, ')
          ..write('order: $order, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class UserActivityTable extends Table
    with TableInfo<UserActivityTable, UserActivity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserActivityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES users(id)');
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _recordIdMeta =
      const VerificationMeta('recordId');
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
      'record_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _recordDataMeta =
      const VerificationMeta('recordData');
  late final GeneratedColumn<String> recordData = GeneratedColumn<String>(
      'record_data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _privateMeta =
      const VerificationMeta('private');
  late final GeneratedColumn<bool> private = GeneratedColumn<bool>(
      'private', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        created,
        updated,
        deleted,
        synced,
        fresh,
        userId,
        collectionId,
        recordId,
        recordData,
        type,
        private
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_activity';
  @override
  VerificationContext validateIntegrity(Insertable<UserActivity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(_recordIdMeta,
          recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta));
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('record_data')) {
      context.handle(
          _recordDataMeta,
          recordData.isAcceptableOrUnknown(
              data['record_data']!, _recordDataMeta));
    } else if (isInserting) {
      context.missing(_recordDataMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('private')) {
      context.handle(_privateMeta,
          private.isAcceptableOrUnknown(data['private']!, _privateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserActivity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserActivity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      recordId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_id'])!,
      recordData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_data'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      private: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}private']),
    );
  }

  @override
  UserActivityTable createAlias(String alias) {
    return UserActivityTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserActivityCompanion extends UpdateCompanion<UserActivity> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String> userId;
  Value<String> collectionId;
  Value<String> recordId;
  Value<String> recordData;
  Value<String> type;
  Value<bool?> private;
  Value<int> rowid;
  UserActivityCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.userId = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.recordId = const Value.absent(),
    this.recordData = const Value.absent(),
    this.type = const Value.absent(),
    this.private = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserActivityCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    required String userId,
    required String collectionId,
    required String recordId,
    required String recordData,
    required String type,
    this.private = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        userId = Value(userId),
        collectionId = Value(collectionId),
        recordId = Value(recordId),
        recordData = Value(recordData),
        type = Value(type);
  static Insertable<UserActivity> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? userId,
    Expression<String>? collectionId,
    Expression<String>? recordId,
    Expression<String>? recordData,
    Expression<String>? type,
    Expression<bool>? private,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (userId != null) 'user_id': userId,
      if (collectionId != null) 'collection_id': collectionId,
      if (recordId != null) 'record_id': recordId,
      if (recordData != null) 'record_data': recordData,
      if (type != null) 'type': type,
      if (private != null) 'private': private,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserActivityCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String>? userId,
      Value<String>? collectionId,
      Value<String>? recordId,
      Value<String>? recordData,
      Value<String>? type,
      Value<bool?>? private,
      Value<int>? rowid}) {
    return UserActivityCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      userId: userId ?? this.userId,
      collectionId: collectionId ?? this.collectionId,
      recordId: recordId ?? this.recordId,
      recordData: recordData ?? this.recordData,
      type: type ?? this.type,
      private: private ?? this.private,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (recordData.present) {
      map['record_data'] = Variable<String>(recordData.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (private.present) {
      map['private'] = Variable<bool>(private.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserActivityCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('userId: $userId, ')
          ..write('collectionId: $collectionId, ')
          ..write('recordId: $recordId, ')
          ..write('recordData: $recordData, ')
          ..write('type: $type, ')
          ..write('private: $private, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DeletedRecords extends Table
    with TableInfo<DeletedRecords, DeletedRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DeletedRecords(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _recordIdMeta =
      const VerificationMeta('recordId');
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
      'record_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _recordDataMeta =
      const VerificationMeta('recordData');
  late final GeneratedColumn<String> recordData = GeneratedColumn<String>(
      'record_data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        created,
        updated,
        deleted,
        synced,
        fresh,
        collectionId,
        recordId,
        recordData
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deleted_records';
  @override
  VerificationContext validateIntegrity(Insertable<DeletedRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(_recordIdMeta,
          recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta));
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('record_data')) {
      context.handle(
          _recordDataMeta,
          recordData.isAcceptableOrUnknown(
              data['record_data']!, _recordDataMeta));
    } else if (isInserting) {
      context.missing(_recordDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DeletedRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeletedRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      recordId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_id'])!,
      recordData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_data'])!,
    );
  }

  @override
  DeletedRecords createAlias(String alias) {
    return DeletedRecords(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DeletedRecordsCompanion extends UpdateCompanion<DeletedRecord> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String> collectionId;
  Value<String> recordId;
  Value<String> recordData;
  Value<int> rowid;
  DeletedRecordsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.recordId = const Value.absent(),
    this.recordData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeletedRecordsCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    required String collectionId,
    required String recordId,
    required String recordData,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        collectionId = Value(collectionId),
        recordId = Value(recordId),
        recordData = Value(recordData);
  static Insertable<DeletedRecord> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? collectionId,
    Expression<String>? recordId,
    Expression<String>? recordData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (collectionId != null) 'collection_id': collectionId,
      if (recordId != null) 'record_id': recordId,
      if (recordData != null) 'record_data': recordData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeletedRecordsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String>? collectionId,
      Value<String>? recordId,
      Value<String>? recordData,
      Value<int>? rowid}) {
    return DeletedRecordsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      collectionId: collectionId ?? this.collectionId,
      recordId: recordId ?? this.recordId,
      recordData: recordData ?? this.recordData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (recordData.present) {
      map['record_data'] = Variable<String>(recordData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeletedRecordsCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('collectionId: $collectionId, ')
          ..write('recordId: $recordId, ')
          ..write('recordData: $recordData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class UserLikedSongs extends Table
    with TableInfo<UserLikedSongs, UserLikedSong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserLikedSongs(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES users(id)ON UPDATE CASCADE ON DELETE CASCADE');
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  late final GeneratedColumn<String> songId = GeneratedColumn<String>(
      'song_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES songs(id)ON UPDATE CASCADE ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns =>
      [id, created, updated, deleted, synced, fresh, userId, songId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_liked_songs';
  @override
  VerificationContext validateIntegrity(Insertable<UserLikedSong> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('song_id')) {
      context.handle(_songIdMeta,
          songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta));
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserLikedSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserLikedSong(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      songId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_id'])!,
    );
  }

  @override
  UserLikedSongs createAlias(String alias) {
    return UserLikedSongs(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserLikedSongsCompanion extends UpdateCompanion<UserLikedSong> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String> userId;
  Value<String> songId;
  Value<int> rowid;
  UserLikedSongsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.userId = const Value.absent(),
    this.songId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserLikedSongsCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    required String userId,
    required String songId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        userId = Value(userId),
        songId = Value(songId);
  static Insertable<UserLikedSong> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? userId,
    Expression<String>? songId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (userId != null) 'user_id': userId,
      if (songId != null) 'song_id': songId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserLikedSongsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String>? userId,
      Value<String>? songId,
      Value<int>? rowid}) {
    return UserLikedSongsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      userId: userId ?? this.userId,
      songId: songId ?? this.songId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<String>(songId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserLikedSongsCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('userId: $userId, ')
          ..write('songId: $songId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class UserFollowers extends Table with TableInfo<UserFollowers, UserFollower> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserFollowers(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _freshMeta = const VerificationMeta('fresh');
  late final GeneratedColumn<bool> fresh = GeneratedColumn<bool>(
      'fresh', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES users(id)ON UPDATE CASCADE ON DELETE CASCADE');
  static const VerificationMeta _targetUserIdMeta =
      const VerificationMeta('targetUserId');
  late final GeneratedColumn<String> targetUserId = GeneratedColumn<String>(
      'target_user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES users(id)ON UPDATE CASCADE ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns =>
      [id, created, updated, deleted, synced, fresh, userId, targetUserId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_followers';
  @override
  VerificationContext validateIntegrity(Insertable<UserFollower> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    if (data.containsKey('fresh')) {
      context.handle(
          _freshMeta, fresh.isAcceptableOrUnknown(data['fresh']!, _freshMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('target_user_id')) {
      context.handle(
          _targetUserIdMeta,
          targetUserId.isAcceptableOrUnknown(
              data['target_user_id']!, _targetUserIdMeta));
    } else if (isInserting) {
      context.missing(_targetUserIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserFollower map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserFollower(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
      fresh: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fresh'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      targetUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target_user_id'])!,
    );
  }

  @override
  UserFollowers createAlias(String alias) {
    return UserFollowers(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserFollowersCompanion extends UpdateCompanion<UserFollower> {
  Value<String> id;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<String> userId;
  Value<String> targetUserId;
  Value<int> rowid;
  UserFollowersCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.userId = const Value.absent(),
    this.targetUserId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserFollowersCompanion.insert({
    required String id,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    required String userId,
    required String targetUserId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        created = Value(created),
        updated = Value(updated),
        userId = Value(userId),
        targetUserId = Value(targetUserId);
  static Insertable<UserFollower> custom({
    Expression<String>? id,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<String>? userId,
    Expression<String>? targetUserId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (userId != null) 'user_id': userId,
      if (targetUserId != null) 'target_user_id': targetUserId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserFollowersCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<String>? userId,
      Value<String>? targetUserId,
      Value<int>? rowid}) {
    return UserFollowersCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      userId: userId ?? this.userId,
      targetUserId: targetUserId ?? this.targetUserId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (fresh.present) {
      map['fresh'] = Variable<bool>(fresh.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (targetUserId.present) {
      map['target_user_id'] = Variable<String>(targetUserId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFollowersCompanion(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('userId: $userId, ')
          ..write('targetUserId: $targetUserId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  _$DatabaseManager get managers => _$DatabaseManager(this);
  late final KeyValue keyValue = KeyValue(this);
  late final Users users = Users(this);
  late final Albums albums = Albums(this);
  late final Artists artists = Artists(this);
  late final Songs songs = Songs(this);
  late final AlbumTracks albumTracks = AlbumTracks(this);
  late final UserPlaylists userPlaylists = UserPlaylists(this);
  late final UserPlaylistItems userPlaylistItems = UserPlaylistItems(this);
  late final UserActivityTable userActivity = UserActivityTable(this);
  late final DeletedRecords deletedRecords = DeletedRecords(this);
  late final UserLikedSongs userLikedSongs = UserLikedSongs(this);
  late final UserFollowers userFollowers = UserFollowers(this);
  late final Index idxWrCdI3h = Index('idx_wrCdI3h',
      'CREATE INDEX idx_wrCdI3h ON user_activity (collection_id, record_id)');
  Future<List<KeyValueData>> setItem({required String key, String? value}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO key_value ("key", value) VALUES (?1, ?2) RETURNING *',
        variables: [
          Variable<String>(key),
          Variable<String>(value)
        ],
        updates: {
          keyValue
        }).then((rows) => Future.wait(rows.map(keyValue.mapFromRow)));
  }

  Selectable<String?> getItem({required String key}) {
    return customSelect('SELECT value FROM key_value WHERE "key" = ?1',
        variables: [
          Variable<String>(key)
        ],
        readsFrom: {
          keyValue,
        }).map((QueryRow row) => row.readNullable<String>('value'));
  }

  Future<int> deleteItem({required String key}) {
    return customUpdate(
      'DELETE FROM key_value WHERE "key" = ?1',
      variables: [Variable<String>(key)],
      updates: {keyValue},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<KeyValueData> searchItem({required String query}) {
    return customSelect(
        'SELECT "key", value FROM key_value WHERE "key" LIKE ?1 OR value LIKE ?1',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          keyValue,
        }).asyncMap(keyValue.mapFromRow);
  }

  Selectable<User> usersGetAll() {
    return customSelect('SELECT * FROM users', variables: [], readsFrom: {
      users,
    }).asyncMap(users.mapFromRow);
  }

  Selectable<User> usersGetOne({required String id}) {
    return customSelect('SELECT * FROM users WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      users,
    }).asyncMap(users.mapFromRow);
  }

  Future<int> usersHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM users WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {users},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> usersSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE users SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {users},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> usersRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE users SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {users},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> usersHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM users WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {users},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> usersSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE users SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {users},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> usersRestoreSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE users SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {users},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> usersSetSyncStatusOne({required bool value, required String id}) {
    return customUpdate(
      'UPDATE users SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {users},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> usersSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE users SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {users},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<User>> usersInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      String? username,
      required String email,
      bool? emailVisibility,
      bool? verified,
      String? name,
      String? avatar}) {
    return customWriteReturning(
        'INSERT INTO users (id, created, updated, deleted, synced, fresh, username, email, emailVisibility, verified, name, avatar) VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5, ?6, ?7, ?8, ?9, ?10) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(username),
          Variable<String>(email),
          Variable<bool>(emailVisibility),
          Variable<bool>(verified),
          Variable<String>(name),
          Variable<String>(avatar)
        ],
        updates: {
          users
        }).then((rows) => Future.wait(rows.map(users.mapFromRow)));
  }

  Future<List<User>> usersInsertRecord({required String data}) {
    return customWriteReturning(
        'INSERT INTO users (id, created, updated, deleted, synced, fresh, username, email, emailVisibility, verified, name, avatar) VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.username\'), json_extract(?1, \'\$.email\'), json_extract(?1, \'\$.emailVisibility\'), json_extract(?1, \'\$.verified\'), json_extract(?1, \'\$.name\'), json_extract(?1, \'\$.avatar\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          users
        }).then((rows) => Future.wait(rows.map(users.mapFromRow)));
  }

  Future<int> usersUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      String? username,
      required String email,
      bool? emailVisibility,
      bool? verified,
      String? name,
      String? avatar}) {
    return customUpdate(
      'UPDATE users SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, username = ?6, email = ?7, emailVisibility = ?8, verified = ?9, name = ?10, avatar = ?11 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(username),
        Variable<String>(email),
        Variable<bool>(emailVisibility),
        Variable<bool>(verified),
        Variable<String>(name),
        Variable<String>(avatar)
      ],
      updates: {users},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> usersUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE users SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), username = json_extract(?1, \'\$.username\'), email = json_extract(?1, \'\$.email\'), emailVisibility = json_extract(?1, \'\$.emailVisibility\'), verified = json_extract(?1, \'\$.verified\'), name = json_extract(?1, \'\$.name\'), avatar = json_extract(?1, \'\$.avatar\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {users},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<Album> albumsGetAll() {
    return customSelect('SELECT * FROM albums', variables: [], readsFrom: {
      albums,
    }).asyncMap(albums.mapFromRow);
  }

  Selectable<Album> albumsGetOne({required String id}) {
    return customSelect('SELECT * FROM albums WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      albums,
    }).asyncMap(albums.mapFromRow);
  }

  Selectable<Album> albumsGetUnsynced() {
    return customSelect('SELECT * FROM albums WHERE synced = FALSE',
        variables: [],
        readsFrom: {
          albums,
        }).asyncMap(albums.mapFromRow);
  }

  Selectable<Album> albumsGetFreshest() {
    return customSelect(
        'SELECT * FROM albums WHERE synced = TRUE ORDER BY updated DESC LIMIT 1',
        variables: [],
        readsFrom: {
          albums,
        }).asyncMap(albums.mapFromRow);
  }

  Future<int> albumsHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM albums WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {albums},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> albumsSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE albums SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {albums},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumsRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE albums SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {albums},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumsHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM albums WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {albums},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> albumsSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE albums SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {albums},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumsRestoreSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE albums SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {albums},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumsSetSyncStatusOne(
      {required bool value, required String id}) {
    return customUpdate(
      'UPDATE albums SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {albums},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumsSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE albums SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {albums},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<Album>> albumsInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      required String name}) {
    return customWriteReturning(
        'INSERT INTO albums (id, created, updated, deleted, synced, fresh, name) VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(name)
        ],
        updates: {
          albums
        }).then((rows) => Future.wait(rows.map(albums.mapFromRow)));
  }

  Future<List<Album>> albumsInsertRecord({required String data}) {
    return customWriteReturning(
        'INSERT INTO albums (id, created, updated, deleted, synced, fresh, name) VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.name\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          albums
        }).then((rows) => Future.wait(rows.map(albums.mapFromRow)));
  }

  Future<int> albumsUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      required String name}) {
    return customUpdate(
      'UPDATE albums SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, name = ?6 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(name)
      ],
      updates: {albums},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumsUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE albums SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), name = json_extract(?1, \'\$.name\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {albums},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<AlbumTrack> albumTracksGetAll() {
    return customSelect('SELECT * FROM album_tracks',
        variables: [],
        readsFrom: {
          albumTracks,
        }).asyncMap(albumTracks.mapFromRow);
  }

  Selectable<AlbumTrack> albumTracksGetOne({required String id}) {
    return customSelect('SELECT * FROM album_tracks WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      albumTracks,
    }).asyncMap(albumTracks.mapFromRow);
  }

  Selectable<AlbumTrack> albumTracksGetUnsynced() {
    return customSelect('SELECT * FROM album_tracks WHERE synced = FALSE',
        variables: [],
        readsFrom: {
          albumTracks,
        }).asyncMap(albumTracks.mapFromRow);
  }

  Selectable<AlbumTrack> albumTracksGetFreshest() {
    return customSelect(
        'SELECT * FROM album_tracks WHERE synced = TRUE ORDER BY updated DESC LIMIT 1',
        variables: [],
        readsFrom: {
          albumTracks,
        }).asyncMap(albumTracks.mapFromRow);
  }

  Future<int> albumTracksHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM album_tracks WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {albumTracks},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> albumTracksSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE album_tracks SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {albumTracks},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumTracksRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE album_tracks SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {albumTracks},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumTracksHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM album_tracks WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {albumTracks},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> albumTracksSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE album_tracks SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {albumTracks},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumTracksRestoreSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE album_tracks SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {albumTracks},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumTracksSetSyncStatusOne(
      {required bool value, required String id}) {
    return customUpdate(
      'UPDATE album_tracks SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {albumTracks},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumTracksSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE album_tracks SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {albumTracks},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<AlbumTrack>> albumTracksInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      required String albumId,
      required String songId,
      required double order}) {
    return customWriteReturning(
        'INSERT INTO album_tracks (id, created, updated, deleted, synced, fresh, album_id, song_id, "order") VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5, ?6, ?7) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(albumId),
          Variable<String>(songId),
          Variable<double>(order)
        ],
        updates: {
          albumTracks
        }).then((rows) => Future.wait(rows.map(albumTracks.mapFromRow)));
  }

  Future<List<AlbumTrack>> albumTracksInsertRecord({required String data}) {
    return customWriteReturning(
        'INSERT INTO album_tracks (id, created, updated, deleted, synced, fresh, album_id, song_id, "order") VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.album_id\'), json_extract(?1, \'\$.song_id\'), json_extract(?1, \'\$.order\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          albumTracks
        }).then((rows) => Future.wait(rows.map(albumTracks.mapFromRow)));
  }

  Future<int> albumTracksUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      required String albumId,
      required String songId,
      required double order}) {
    return customUpdate(
      'UPDATE album_tracks SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, album_id = ?6, song_id = ?7, "order" = ?8 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(albumId),
        Variable<String>(songId),
        Variable<double>(order)
      ],
      updates: {albumTracks},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> albumTracksUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE album_tracks SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), album_id = json_extract(?1, \'\$.album_id\'), song_id = json_extract(?1, \'\$.song_id\'), "order" = json_extract(?1, \'\$.order\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {albumTracks},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<UserPlaylist> userPlaylistsGetAll() {
    return customSelect('SELECT * FROM user_playlists',
        variables: [],
        readsFrom: {
          userPlaylists,
        }).asyncMap(userPlaylists.mapFromRow);
  }

  Selectable<UserPlaylist> userPlaylistsGetOne({required String id}) {
    return customSelect('SELECT * FROM user_playlists WHERE id = ?1',
        variables: [
          Variable<String>(id)
        ],
        readsFrom: {
          userPlaylists,
        }).asyncMap(userPlaylists.mapFromRow);
  }

  Selectable<UserPlaylist> userPlaylistsGetUnsynced() {
    return customSelect('SELECT * FROM user_playlists WHERE synced = FALSE',
        variables: [],
        readsFrom: {
          userPlaylists,
        }).asyncMap(userPlaylists.mapFromRow);
  }

  Selectable<UserPlaylist> userPlaylistsGetFreshest() {
    return customSelect(
        'SELECT * FROM user_playlists WHERE synced = TRUE ORDER BY updated DESC LIMIT 1',
        variables: [],
        readsFrom: {
          userPlaylists,
        }).asyncMap(userPlaylists.mapFromRow);
  }

  Future<int> userPlaylistsHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM user_playlists WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userPlaylists},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> userPlaylistsSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE user_playlists SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userPlaylists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistsRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE user_playlists SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userPlaylists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistsHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM user_playlists WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userPlaylists},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> userPlaylistsSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_playlists SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userPlaylists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistsRestoreSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_playlists SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userPlaylists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistsSetSyncStatusOne(
      {required bool value, required String id}) {
    return customUpdate(
      'UPDATE user_playlists SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {userPlaylists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistsSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_playlists SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {userPlaylists},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<UserPlaylist>> userPlaylistsInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      required String name,
      required String userId}) {
    return customWriteReturning(
        'INSERT INTO user_playlists (id, created, updated, deleted, synced, fresh, name, user_id) VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5, ?6) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(name),
          Variable<String>(userId)
        ],
        updates: {
          userPlaylists
        }).then((rows) => Future.wait(rows.map(userPlaylists.mapFromRow)));
  }

  Future<List<UserPlaylist>> userPlaylistsInsertRecord({required String data}) {
    return customWriteReturning(
        'INSERT INTO user_playlists (id, created, updated, deleted, synced, fresh, name, user_id) VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.name\'), json_extract(?1, \'\$.user_id\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          userPlaylists
        }).then((rows) => Future.wait(rows.map(userPlaylists.mapFromRow)));
  }

  Future<int> userPlaylistsUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      required String name,
      required String userId}) {
    return customUpdate(
      'UPDATE user_playlists SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, name = ?6, user_id = ?7 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(name),
        Variable<String>(userId)
      ],
      updates: {userPlaylists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistsUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE user_playlists SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), name = json_extract(?1, \'\$.name\'), user_id = json_extract(?1, \'\$.user_id\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {userPlaylists},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<UserPlaylistItem> userPlaylistItemsGetAll() {
    return customSelect('SELECT * FROM user_playlist_items',
        variables: [],
        readsFrom: {
          userPlaylistItems,
        }).asyncMap(userPlaylistItems.mapFromRow);
  }

  Selectable<UserPlaylistItem> userPlaylistItemsGetOne({required String id}) {
    return customSelect('SELECT * FROM user_playlist_items WHERE id = ?1',
        variables: [
          Variable<String>(id)
        ],
        readsFrom: {
          userPlaylistItems,
        }).asyncMap(userPlaylistItems.mapFromRow);
  }

  Selectable<UserPlaylistItem> userPlaylistItemsGetUnsynced() {
    return customSelect(
        'SELECT * FROM user_playlist_items WHERE synced = FALSE',
        variables: [],
        readsFrom: {
          userPlaylistItems,
        }).asyncMap(userPlaylistItems.mapFromRow);
  }

  Selectable<UserPlaylistItem> userPlaylistItemsGetFreshest() {
    return customSelect(
        'SELECT * FROM user_playlist_items WHERE synced = TRUE ORDER BY updated DESC LIMIT 1',
        variables: [],
        readsFrom: {
          userPlaylistItems,
        }).asyncMap(userPlaylistItems.mapFromRow);
  }

  Future<int> userPlaylistItemsHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM user_playlist_items WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> userPlaylistItemsSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE user_playlist_items SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistItemsRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE user_playlist_items SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistItemsHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM user_playlist_items WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> userPlaylistItemsSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_playlist_items SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistItemsRestoreSoftDeleteMulti(
      {required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_playlist_items SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistItemsSetSyncStatusOne(
      {required bool value, required String id}) {
    return customUpdate(
      'UPDATE user_playlist_items SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistItemsSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_playlist_items SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<UserPlaylistItem>> userPlaylistItemsInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      required String playlistId,
      required String userId,
      required String songId,
      required double order}) {
    return customWriteReturning(
        'INSERT INTO user_playlist_items (id, created, updated, deleted, synced, fresh, playlist_id, user_id, song_id, "order") VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5, ?6, ?7, ?8) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(playlistId),
          Variable<String>(userId),
          Variable<String>(songId),
          Variable<double>(order)
        ],
        updates: {
          userPlaylistItems
        }).then((rows) => Future.wait(rows.map(userPlaylistItems.mapFromRow)));
  }

  Future<List<UserPlaylistItem>> userPlaylistItemsInsertRecord(
      {required String data}) {
    return customWriteReturning(
        'INSERT INTO user_playlist_items (id, created, updated, deleted, synced, fresh, playlist_id, user_id, song_id, "order") VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.playlist_id\'), json_extract(?1, \'\$.user_id\'), json_extract(?1, \'\$.song_id\'), json_extract(?1, \'\$.order\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          userPlaylistItems
        }).then((rows) => Future.wait(rows.map(userPlaylistItems.mapFromRow)));
  }

  Future<int> userPlaylistItemsUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      required String playlistId,
      required String userId,
      required String songId,
      required double order}) {
    return customUpdate(
      'UPDATE user_playlist_items SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, playlist_id = ?6, user_id = ?7, song_id = ?8, "order" = ?9 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(playlistId),
        Variable<String>(userId),
        Variable<String>(songId),
        Variable<double>(order)
      ],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userPlaylistItemsUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE user_playlist_items SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), playlist_id = json_extract(?1, \'\$.playlist_id\'), user_id = json_extract(?1, \'\$.user_id\'), song_id = json_extract(?1, \'\$.song_id\'), "order" = json_extract(?1, \'\$.order\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<Song> songsGetAll() {
    return customSelect('SELECT * FROM songs', variables: [], readsFrom: {
      songs,
    }).asyncMap(songs.mapFromRow);
  }

  Selectable<Song> songsGetOne({required String id}) {
    return customSelect('SELECT * FROM songs WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      songs,
    }).asyncMap(songs.mapFromRow);
  }

  Selectable<Song> songsGetUnsynced() {
    return customSelect('SELECT * FROM songs WHERE synced = FALSE',
        variables: [],
        readsFrom: {
          songs,
        }).asyncMap(songs.mapFromRow);
  }

  Selectable<Song> songsGetFreshest() {
    return customSelect(
        'SELECT * FROM songs WHERE synced = TRUE ORDER BY updated DESC LIMIT 1',
        variables: [],
        readsFrom: {
          songs,
        }).asyncMap(songs.mapFromRow);
  }

  Future<int> songsHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM songs WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {songs},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> songsSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE songs SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {songs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> songsRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE songs SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {songs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> songsHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM songs WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {songs},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> songsSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE songs SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {songs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> songsRestoreSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE songs SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {songs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> songsSetSyncStatusOne({required bool value, required String id}) {
    return customUpdate(
      'UPDATE songs SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {songs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> songsSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE songs SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {songs},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<Song>> songsInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      required String name,
      String? downloadLink,
      String? artistId}) {
    return customWriteReturning(
        'INSERT INTO songs (id, created, updated, deleted, synced, fresh, name, download_link, artist_id) VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5, ?6, ?7) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(name),
          Variable<String>(downloadLink),
          Variable<String>(artistId)
        ],
        updates: {
          songs
        }).then((rows) => Future.wait(rows.map(songs.mapFromRow)));
  }

  Future<List<Song>> songsInsertRecord({required String data}) {
    return customWriteReturning(
        'INSERT INTO songs (id, created, updated, deleted, synced, fresh, name, download_link, artist_id) VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.name\'), json_extract(?1, \'\$.download_link\'), json_extract(?1, \'\$.artist_id\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          songs
        }).then((rows) => Future.wait(rows.map(songs.mapFromRow)));
  }

  Future<int> songsUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      required String name,
      String? downloadLink,
      String? artistId}) {
    return customUpdate(
      'UPDATE songs SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, name = ?6, download_link = ?7, artist_id = ?8 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(name),
        Variable<String>(downloadLink),
        Variable<String>(artistId)
      ],
      updates: {songs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> songsUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE songs SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), name = json_extract(?1, \'\$.name\'), download_link = json_extract(?1, \'\$.download_link\'), artist_id = json_extract(?1, \'\$.artist_id\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {songs},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<Artist> artistsGetAll() {
    return customSelect('SELECT * FROM artists', variables: [], readsFrom: {
      artists,
    }).asyncMap(artists.mapFromRow);
  }

  Selectable<Artist> artistsGetOne({required String id}) {
    return customSelect('SELECT * FROM artists WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      artists,
    }).asyncMap(artists.mapFromRow);
  }

  Future<int> artistsHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM artists WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {artists},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> artistsSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE artists SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {artists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> artistsRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE artists SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {artists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> artistsHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM artists WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {artists},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> artistsSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE artists SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {artists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> artistsRestoreSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE artists SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {artists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> artistsSetSyncStatusOne(
      {required bool value, required String id}) {
    return customUpdate(
      'UPDATE artists SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {artists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> artistsSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE artists SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {artists},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<Artist>> artistsInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      String? username,
      required String email,
      bool? emailVisibility,
      bool? verified}) {
    return customWriteReturning(
        'INSERT INTO artists (id, created, updated, deleted, synced, fresh, username, email, emailVisibility, verified) VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5, ?6, ?7, ?8) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(username),
          Variable<String>(email),
          Variable<bool>(emailVisibility),
          Variable<bool>(verified)
        ],
        updates: {
          artists
        }).then((rows) => Future.wait(rows.map(artists.mapFromRow)));
  }

  Future<List<Artist>> artistsInsertRecord({required String data}) {
    return customWriteReturning(
        'INSERT INTO artists (id, created, updated, deleted, synced, fresh, username, email, emailVisibility, verified) VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.username\'), json_extract(?1, \'\$.email\'), json_extract(?1, \'\$.emailVisibility\'), json_extract(?1, \'\$.verified\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          artists
        }).then((rows) => Future.wait(rows.map(artists.mapFromRow)));
  }

  Future<int> artistsUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      String? username,
      required String email,
      bool? emailVisibility,
      bool? verified}) {
    return customUpdate(
      'UPDATE artists SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, username = ?6, email = ?7, emailVisibility = ?8, verified = ?9 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(username),
        Variable<String>(email),
        Variable<bool>(emailVisibility),
        Variable<bool>(verified)
      ],
      updates: {artists},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> artistsUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE artists SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), username = json_extract(?1, \'\$.username\'), email = json_extract(?1, \'\$.email\'), emailVisibility = json_extract(?1, \'\$.emailVisibility\'), verified = json_extract(?1, \'\$.verified\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {artists},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<UserActivity> userActivityGetAll() {
    return customSelect('SELECT * FROM user_activity',
        variables: [],
        readsFrom: {
          userActivity,
        }).asyncMap(userActivity.mapFromRow);
  }

  Selectable<UserActivity> userActivityGetOne({required String id}) {
    return customSelect('SELECT * FROM user_activity WHERE id = ?1',
        variables: [
          Variable<String>(id)
        ],
        readsFrom: {
          userActivity,
        }).asyncMap(userActivity.mapFromRow);
  }

  Selectable<UserActivity> userActivityGetUnsynced() {
    return customSelect('SELECT * FROM user_activity WHERE synced = FALSE',
        variables: [],
        readsFrom: {
          userActivity,
        }).asyncMap(userActivity.mapFromRow);
  }

  Selectable<UserActivity> userActivityGetFreshest() {
    return customSelect(
        'SELECT * FROM user_activity WHERE synced = TRUE ORDER BY updated DESC LIMIT 1',
        variables: [],
        readsFrom: {
          userActivity,
        }).asyncMap(userActivity.mapFromRow);
  }

  Future<int> userActivityHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM user_activity WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userActivity},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> userActivitySoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE user_activity SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userActivity},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userActivityRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE user_activity SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userActivity},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userActivityHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM user_activity WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userActivity},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> userActivitySoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_activity SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userActivity},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userActivityRestoreSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_activity SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userActivity},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userActivitySetSyncStatusOne(
      {required bool value, required String id}) {
    return customUpdate(
      'UPDATE user_activity SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {userActivity},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userActivitySetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_activity SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {userActivity},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<UserActivity>> userActivityInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      required String userId,
      required String collectionId,
      required String recordId,
      required String recordData,
      required String type,
      bool? private}) {
    return customWriteReturning(
        'INSERT INTO user_activity (id, created, updated, deleted, synced, fresh, user_id, collection_id, record_id, record_data, type, private) VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5, ?6, ?7, ?8, ?9, ?10) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(userId),
          Variable<String>(collectionId),
          Variable<String>(recordId),
          Variable<String>(recordData),
          Variable<String>(type),
          Variable<bool>(private)
        ],
        updates: {
          userActivity
        }).then((rows) => Future.wait(rows.map(userActivity.mapFromRow)));
  }

  Future<List<UserActivity>> userActivityInsertRecord({required String data}) {
    return customWriteReturning(
        'INSERT INTO user_activity (id, created, updated, deleted, synced, fresh, user_id, collection_id, record_id, record_data, type, private) VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.user_id\'), json_extract(?1, \'\$.collection_id\'), json_extract(?1, \'\$.record_id\'), json_extract(?1, \'\$.record_data\'), json_extract(?1, \'\$.type\'), json_extract(?1, \'\$.private\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          userActivity
        }).then((rows) => Future.wait(rows.map(userActivity.mapFromRow)));
  }

  Future<int> userActivityUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      required String userId,
      required String collectionId,
      required String recordId,
      required String recordData,
      required String type,
      bool? private}) {
    return customUpdate(
      'UPDATE user_activity SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, user_id = ?6, collection_id = ?7, record_id = ?8, record_data = ?9, type = ?10, private = ?11 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(userId),
        Variable<String>(collectionId),
        Variable<String>(recordId),
        Variable<String>(recordData),
        Variable<String>(type),
        Variable<bool>(private)
      ],
      updates: {userActivity},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userActivityUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE user_activity SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), user_id = json_extract(?1, \'\$.user_id\'), collection_id = json_extract(?1, \'\$.collection_id\'), record_id = json_extract(?1, \'\$.record_id\'), record_data = json_extract(?1, \'\$.record_data\'), type = json_extract(?1, \'\$.type\'), private = json_extract(?1, \'\$.private\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {userActivity},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<DeletedRecord> deletedRecordsGetAll() {
    return customSelect('SELECT * FROM deleted_records',
        variables: [],
        readsFrom: {
          deletedRecords,
        }).asyncMap(deletedRecords.mapFromRow);
  }

  Selectable<DeletedRecord> deletedRecordsGetOne({required String id}) {
    return customSelect('SELECT * FROM deleted_records WHERE id = ?1',
        variables: [
          Variable<String>(id)
        ],
        readsFrom: {
          deletedRecords,
        }).asyncMap(deletedRecords.mapFromRow);
  }

  Selectable<DeletedRecord> deletedRecordsGetUnsynced() {
    return customSelect('SELECT * FROM deleted_records WHERE synced = FALSE',
        variables: [],
        readsFrom: {
          deletedRecords,
        }).asyncMap(deletedRecords.mapFromRow);
  }

  Selectable<DeletedRecord> deletedRecordsGetFreshest() {
    return customSelect(
        'SELECT * FROM deleted_records WHERE synced = TRUE ORDER BY updated DESC LIMIT 1',
        variables: [],
        readsFrom: {
          deletedRecords,
        }).asyncMap(deletedRecords.mapFromRow);
  }

  Future<int> deletedRecordsHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM deleted_records WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {deletedRecords},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deletedRecordsSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE deleted_records SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {deletedRecords},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deletedRecordsRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE deleted_records SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {deletedRecords},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deletedRecordsHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM deleted_records WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {deletedRecords},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deletedRecordsSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE deleted_records SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {deletedRecords},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deletedRecordsRestoreSoftDeleteMulti(
      {required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE deleted_records SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {deletedRecords},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deletedRecordsSetSyncStatusOne(
      {required bool value, required String id}) {
    return customUpdate(
      'UPDATE deleted_records SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {deletedRecords},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deletedRecordsSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE deleted_records SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {deletedRecords},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<DeletedRecord>> deletedRecordsInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      required String collectionId,
      required String recordId,
      required String recordData}) {
    return customWriteReturning(
        'INSERT INTO deleted_records (id, created, updated, deleted, synced, fresh, collection_id, record_id, record_data) VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5, ?6, ?7) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(collectionId),
          Variable<String>(recordId),
          Variable<String>(recordData)
        ],
        updates: {
          deletedRecords
        }).then((rows) => Future.wait(rows.map(deletedRecords.mapFromRow)));
  }

  Future<List<DeletedRecord>> deletedRecordsInsertRecord(
      {required String data}) {
    return customWriteReturning(
        'INSERT INTO deleted_records (id, created, updated, deleted, synced, fresh, collection_id, record_id, record_data) VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.collection_id\'), json_extract(?1, \'\$.record_id\'), json_extract(?1, \'\$.record_data\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          deletedRecords
        }).then((rows) => Future.wait(rows.map(deletedRecords.mapFromRow)));
  }

  Future<int> deletedRecordsUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      required String collectionId,
      required String recordId,
      required String recordData}) {
    return customUpdate(
      'UPDATE deleted_records SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, collection_id = ?6, record_id = ?7, record_data = ?8 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(collectionId),
        Variable<String>(recordId),
        Variable<String>(recordData)
      ],
      updates: {deletedRecords},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deletedRecordsUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE deleted_records SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), collection_id = json_extract(?1, \'\$.collection_id\'), record_id = json_extract(?1, \'\$.record_id\'), record_data = json_extract(?1, \'\$.record_data\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {deletedRecords},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<UserLikedSong> userLikedSongsGetAll() {
    return customSelect('SELECT * FROM user_liked_songs',
        variables: [],
        readsFrom: {
          userLikedSongs,
        }).asyncMap(userLikedSongs.mapFromRow);
  }

  Selectable<UserLikedSong> userLikedSongsGetOne({required String id}) {
    return customSelect('SELECT * FROM user_liked_songs WHERE id = ?1',
        variables: [
          Variable<String>(id)
        ],
        readsFrom: {
          userLikedSongs,
        }).asyncMap(userLikedSongs.mapFromRow);
  }

  Selectable<UserLikedSong> userLikedSongsGetUnsynced() {
    return customSelect('SELECT * FROM user_liked_songs WHERE synced = FALSE',
        variables: [],
        readsFrom: {
          userLikedSongs,
        }).asyncMap(userLikedSongs.mapFromRow);
  }

  Selectable<UserLikedSong> userLikedSongsGetFreshest() {
    return customSelect(
        'SELECT * FROM user_liked_songs WHERE synced = TRUE ORDER BY updated DESC LIMIT 1',
        variables: [],
        readsFrom: {
          userLikedSongs,
        }).asyncMap(userLikedSongs.mapFromRow);
  }

  Future<int> userLikedSongsHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM user_liked_songs WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userLikedSongs},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> userLikedSongsSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE user_liked_songs SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userLikedSongs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userLikedSongsRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE user_liked_songs SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userLikedSongs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userLikedSongsHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM user_liked_songs WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userLikedSongs},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> userLikedSongsSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_liked_songs SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userLikedSongs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userLikedSongsRestoreSoftDeleteMulti(
      {required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_liked_songs SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userLikedSongs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userLikedSongsSetSyncStatusOne(
      {required bool value, required String id}) {
    return customUpdate(
      'UPDATE user_liked_songs SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {userLikedSongs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userLikedSongsSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_liked_songs SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {userLikedSongs},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<UserLikedSong>> userLikedSongsInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      required String userId,
      required String songId}) {
    return customWriteReturning(
        'INSERT INTO user_liked_songs (id, created, updated, deleted, synced, fresh, user_id, song_id) VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5, ?6) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(userId),
          Variable<String>(songId)
        ],
        updates: {
          userLikedSongs
        }).then((rows) => Future.wait(rows.map(userLikedSongs.mapFromRow)));
  }

  Future<List<UserLikedSong>> userLikedSongsInsertRecord(
      {required String data}) {
    return customWriteReturning(
        'INSERT INTO user_liked_songs (id, created, updated, deleted, synced, fresh, user_id, song_id) VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.user_id\'), json_extract(?1, \'\$.song_id\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          userLikedSongs
        }).then((rows) => Future.wait(rows.map(userLikedSongs.mapFromRow)));
  }

  Future<int> userLikedSongsUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      required String userId,
      required String songId}) {
    return customUpdate(
      'UPDATE user_liked_songs SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, user_id = ?6, song_id = ?7 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(userId),
        Variable<String>(songId)
      ],
      updates: {userLikedSongs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userLikedSongsUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE user_liked_songs SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), user_id = json_extract(?1, \'\$.user_id\'), song_id = json_extract(?1, \'\$.song_id\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {userLikedSongs},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<UserFollower> userFollowersGetAll() {
    return customSelect('SELECT * FROM user_followers',
        variables: [],
        readsFrom: {
          userFollowers,
        }).asyncMap(userFollowers.mapFromRow);
  }

  Selectable<UserFollower> userFollowersGetOne({required String id}) {
    return customSelect('SELECT * FROM user_followers WHERE id = ?1',
        variables: [
          Variable<String>(id)
        ],
        readsFrom: {
          userFollowers,
        }).asyncMap(userFollowers.mapFromRow);
  }

  Selectable<UserFollower> userFollowersGetUnsynced() {
    return customSelect('SELECT * FROM user_followers WHERE synced = FALSE',
        variables: [],
        readsFrom: {
          userFollowers,
        }).asyncMap(userFollowers.mapFromRow);
  }

  Selectable<UserFollower> userFollowersGetFreshest() {
    return customSelect(
        'SELECT * FROM user_followers WHERE synced = TRUE ORDER BY updated DESC LIMIT 1',
        variables: [],
        readsFrom: {
          userFollowers,
        }).asyncMap(userFollowers.mapFromRow);
  }

  Future<int> userFollowersHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM user_followers WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userFollowers},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> userFollowersSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE user_followers SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userFollowers},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userFollowersRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE user_followers SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {userFollowers},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userFollowersHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM user_followers WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userFollowers},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> userFollowersSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_followers SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userFollowers},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userFollowersRestoreSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_followers SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {userFollowers},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userFollowersSetSyncStatusOne(
      {required bool value, required String id}) {
    return customUpdate(
      'UPDATE user_followers SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {userFollowers},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userFollowersSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE user_followers SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {userFollowers},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<UserFollower>> userFollowersInsert(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool fresh,
      required String userId,
      required String targetUserId}) {
    return customWriteReturning(
        'INSERT INTO user_followers (id, created, updated, deleted, synced, fresh, user_id, target_user_id) VALUES (?1, ?2, ?3, FALSE, FALSE, ?4, ?5, ?6) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<DateTime>(created),
          Variable<DateTime>(updated),
          Variable<bool>(fresh),
          Variable<String>(userId),
          Variable<String>(targetUserId)
        ],
        updates: {
          userFollowers
        }).then((rows) => Future.wait(rows.map(userFollowers.mapFromRow)));
  }

  Future<List<UserFollower>> userFollowersInsertRecord({required String data}) {
    return customWriteReturning(
        'INSERT INTO user_followers (id, created, updated, deleted, synced, fresh, user_id, target_user_id) VALUES (json_extract(?1, \'\$.id\'), json_extract(?1, \'\$.created\'), json_extract(?1, \'\$.updated\'), FALSE, FALSE, json_extract(?1, \'\$.fresh\'), json_extract(?1, \'\$.user_id\'), json_extract(?1, \'\$.target_user_id\')) RETURNING *',
        variables: [
          Variable<String>(data)
        ],
        updates: {
          userFollowers
        }).then((rows) => Future.wait(rows.map(userFollowers.mapFromRow)));
  }

  Future<int> userFollowersUpdate(
      {required String id,
      required DateTime created,
      required DateTime updated,
      required bool deleted,
      required bool fresh,
      required String userId,
      required String targetUserId}) {
    return customUpdate(
      'UPDATE user_followers SET id = ?1, created = ?2, updated = ?3, deleted = ?4, synced = FALSE, fresh = ?5, user_id = ?6, target_user_id = ?7 WHERE id = ?1',
      variables: [
        Variable<String>(id),
        Variable<DateTime>(created),
        Variable<DateTime>(updated),
        Variable<bool>(deleted),
        Variable<bool>(fresh),
        Variable<String>(userId),
        Variable<String>(targetUserId)
      ],
      updates: {userFollowers},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> userFollowersUpdateRecord({required String data}) {
    return customUpdate(
      'UPDATE user_followers SET id = json_extract(?1, \'\$.id\'), created = json_extract(?1, \'\$.created\'), updated = json_extract(?1, \'\$.updated\'), deleted = json_extract(?1, \'\$.deleted\'), synced = FALSE, fresh = json_extract(?1, \'\$.fresh\'), user_id = json_extract(?1, \'\$.user_id\'), target_user_id = json_extract(?1, \'\$.target_user_id\') WHERE id = json_extract(?1, \'\$.id\')',
      variables: [Variable<String>(data)],
      updates: {userFollowers},
      updateKind: UpdateKind.update,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        keyValue,
        users,
        albums,
        artists,
        songs,
        albumTracks,
        userPlaylists,
        userPlaylistItems,
        userActivity,
        deletedRecords,
        userLikedSongs,
        userFollowers,
        idxWrCdI3h
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('albums',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('album_tracks', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('albums',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('album_tracks', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('songs',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('album_tracks', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('songs',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('album_tracks', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('user_playlists', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('user_playlists', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('user_playlists',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('user_playlist_items', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('user_playlists',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('user_playlist_items', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('user_playlist_items', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('user_playlist_items', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('songs',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('user_playlist_items', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('songs',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('user_playlist_items', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('user_liked_songs', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('user_liked_songs', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('songs',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('user_liked_songs', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('songs',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('user_liked_songs', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('user_followers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('user_followers', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('user_followers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('user_followers', kind: UpdateKind.update),
            ],
          ),
        ],
      );
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $KeyValueInsertCompanionBuilder = KeyValueCompanion Function({
  required String key,
  Value<String?> value,
  Value<int> rowid,
});
typedef $KeyValueUpdateCompanionBuilder = KeyValueCompanion Function({
  Value<String> key,
  Value<String?> value,
  Value<int> rowid,
});

class $KeyValueTableManager extends RootTableManager<
    _$Database,
    KeyValue,
    KeyValueData,
    $KeyValueFilterComposer,
    $KeyValueOrderingComposer,
    $KeyValueProcessedTableManager,
    $KeyValueInsertCompanionBuilder,
    $KeyValueUpdateCompanionBuilder> {
  $KeyValueTableManager(_$Database db, KeyValue table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $KeyValueFilterComposer(ComposerState(db, table)),
          orderingComposer: $KeyValueOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $KeyValueProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> key = const Value.absent(),
            Value<String?> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              KeyValueCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String key,
            Value<String?> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              KeyValueCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
        ));
}

class $KeyValueProcessedTableManager extends ProcessedTableManager<
    _$Database,
    KeyValue,
    KeyValueData,
    $KeyValueFilterComposer,
    $KeyValueOrderingComposer,
    $KeyValueProcessedTableManager,
    $KeyValueInsertCompanionBuilder,
    $KeyValueUpdateCompanionBuilder> {
  $KeyValueProcessedTableManager(super.$state);
}

class $KeyValueFilterComposer extends FilterComposer<_$Database, KeyValue> {
  $KeyValueFilterComposer(super.$state);
  ColumnFilters<String> get key => $state.composableBuilder(
      column: $state.table.key,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $KeyValueOrderingComposer extends OrderingComposer<_$Database, KeyValue> {
  $KeyValueOrderingComposer(super.$state);
  ColumnOrderings<String> get key => $state.composableBuilder(
      column: $state.table.key,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$DatabaseManager {
  final _$Database _db;
  _$DatabaseManager(this._db);
  $KeyValueTableManager get keyValue =>
      $KeyValueTableManager(_db, _db.keyValue);
}
