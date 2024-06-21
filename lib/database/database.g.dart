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
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT (newId())',
      defaultValue: const CustomExpression('newId()'));
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        username,
        email,
        emailVisibility,
        verified,
        name,
        avatar,
        created,
        updated,
        deleted,
        synced,
        fresh
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
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
  Value<String?> username;
  Value<String> email;
  Value<bool?> emailVisibility;
  Value<bool?> verified;
  Value<String?> name;
  Value<String?> avatar;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<int> rowid;
  UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.emailVisibility = const Value.absent(),
    this.verified = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    required String email,
    this.emailVisibility = const Value.absent(),
    this.verified = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : email = Value(email),
        created = Value(created),
        updated = Value(updated);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? email,
    Expression<bool>? emailVisibility,
    Expression<bool>? verified,
    Expression<String>? name,
    Expression<String>? avatar,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (emailVisibility != null) 'emailVisibility': emailVisibility,
      if (verified != null) 'verified': verified,
      if (name != null) 'name': name,
      if (avatar != null) 'avatar': avatar,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String?>? username,
      Value<String>? email,
      Value<bool?>? emailVisibility,
      Value<bool?>? verified,
      Value<String?>? name,
      Value<String?>? avatar,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      emailVisibility: emailVisibility ?? this.emailVisibility,
      verified: verified ?? this.verified,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('emailVisibility: $emailVisibility, ')
          ..write('verified: $verified, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT (newId())',
      defaultValue: const CustomExpression('newId()'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, created, updated, deleted, synced, fresh];
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
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Album map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Album(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
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
  Value<String> name;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<int> rowid;
  AlbumsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlbumsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Album> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlbumsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<int>? rowid}) {
    return AlbumsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlbumsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT (newId())',
      defaultValue: const CustomExpression('newId()'));
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        username,
        email,
        emailVisibility,
        verified,
        created,
        updated,
        deleted,
        synced,
        fresh
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Artist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Artist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      emailVisibility: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}emailVisibility']),
      verified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}verified']),
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
  Value<String?> username;
  Value<String> email;
  Value<bool?> emailVisibility;
  Value<bool?> verified;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<int> rowid;
  ArtistsCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.emailVisibility = const Value.absent(),
    this.verified = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArtistsCompanion.insert({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    required String email,
    this.emailVisibility = const Value.absent(),
    this.verified = const Value.absent(),
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : email = Value(email),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Artist> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? email,
    Expression<bool>? emailVisibility,
    Expression<bool>? verified,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (emailVisibility != null) 'emailVisibility': emailVisibility,
      if (verified != null) 'verified': verified,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArtistsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? username,
      Value<String>? email,
      Value<bool?>? emailVisibility,
      Value<bool?>? verified,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<int>? rowid}) {
    return ArtistsCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      emailVisibility: emailVisibility ?? this.emailVisibility,
      verified: verified ?? this.verified,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtistsCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('emailVisibility: $emailVisibility, ')
          ..write('verified: $verified, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT (newId())',
      defaultValue: const CustomExpression('newId()'));
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        downloadLink,
        artistId,
        created,
        updated,
        deleted,
        synced,
        fresh
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Song map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Song(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      downloadLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}download_link']),
      artistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist_id']),
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
  Value<String> name;
  Value<String?> downloadLink;
  Value<String?> artistId;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<int> rowid;
  SongsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.downloadLink = const Value.absent(),
    this.artistId = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SongsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.downloadLink = const Value.absent(),
    this.artistId = const Value.absent(),
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Song> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? downloadLink,
    Expression<String>? artistId,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (downloadLink != null) 'download_link': downloadLink,
      if (artistId != null) 'artist_id': artistId,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SongsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? downloadLink,
      Value<String?>? artistId,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<int>? rowid}) {
    return SongsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      downloadLink: downloadLink ?? this.downloadLink,
      artistId: artistId ?? this.artistId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('downloadLink: $downloadLink, ')
          ..write('artistId: $artistId, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT (newId())',
      defaultValue: const CustomExpression('newId()'));
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, albumId, songId, order, created, updated, deleted, synced, fresh];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AlbumTrack map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlbumTrack(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      albumId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}album_id'])!,
      songId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}order'])!,
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
  Value<String> albumId;
  Value<String> songId;
  Value<double> order;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<int> rowid;
  AlbumTracksCompanion({
    this.id = const Value.absent(),
    this.albumId = const Value.absent(),
    this.songId = const Value.absent(),
    this.order = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlbumTracksCompanion.insert({
    this.id = const Value.absent(),
    required String albumId,
    required String songId,
    required double order,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : albumId = Value(albumId),
        songId = Value(songId),
        order = Value(order),
        created = Value(created),
        updated = Value(updated);
  static Insertable<AlbumTrack> custom({
    Expression<String>? id,
    Expression<String>? albumId,
    Expression<String>? songId,
    Expression<double>? order,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (albumId != null) 'album_id': albumId,
      if (songId != null) 'song_id': songId,
      if (order != null) 'order': order,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlbumTracksCompanion copyWith(
      {Value<String>? id,
      Value<String>? albumId,
      Value<String>? songId,
      Value<double>? order,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<int>? rowid}) {
    return AlbumTracksCompanion(
      id: id ?? this.id,
      albumId: albumId ?? this.albumId,
      songId: songId ?? this.songId,
      order: order ?? this.order,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlbumTracksCompanion(')
          ..write('id: $id, ')
          ..write('albumId: $albumId, ')
          ..write('songId: $songId, ')
          ..write('order: $order, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT (newId())',
      defaultValue: const CustomExpression('newId()'));
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, userId, created, updated, deleted, synced, fresh];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserPlaylist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPlaylist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
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
  Value<String> name;
  Value<String> userId;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<int> rowid;
  UserPlaylistsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userId = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserPlaylistsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String userId,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        userId = Value(userId),
        created = Value(created),
        updated = Value(updated);
  static Insertable<UserPlaylist> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? userId,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userId != null) 'user_id': userId,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserPlaylistsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? userId,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<int>? rowid}) {
    return UserPlaylistsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPlaylistsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT (newId())',
      defaultValue: const CustomExpression('newId()'));
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        playlistId,
        userId,
        songId,
        order,
        created,
        updated,
        deleted,
        synced,
        fresh
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserPlaylistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPlaylistItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playlist_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      songId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}order'])!,
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
  Value<String> playlistId;
  Value<String> userId;
  Value<String> songId;
  Value<double> order;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<int> rowid;
  UserPlaylistItemsCompanion({
    this.id = const Value.absent(),
    this.playlistId = const Value.absent(),
    this.userId = const Value.absent(),
    this.songId = const Value.absent(),
    this.order = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserPlaylistItemsCompanion.insert({
    this.id = const Value.absent(),
    required String playlistId,
    required String userId,
    required String songId,
    required double order,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : playlistId = Value(playlistId),
        userId = Value(userId),
        songId = Value(songId),
        order = Value(order),
        created = Value(created),
        updated = Value(updated);
  static Insertable<UserPlaylistItem> custom({
    Expression<String>? id,
    Expression<String>? playlistId,
    Expression<String>? userId,
    Expression<String>? songId,
    Expression<double>? order,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playlistId != null) 'playlist_id': playlistId,
      if (userId != null) 'user_id': userId,
      if (songId != null) 'song_id': songId,
      if (order != null) 'order': order,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserPlaylistItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? playlistId,
      Value<String>? userId,
      Value<String>? songId,
      Value<double>? order,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<int>? rowid}) {
    return UserPlaylistItemsCompanion(
      id: id ?? this.id,
      playlistId: playlistId ?? this.playlistId,
      userId: userId ?? this.userId,
      songId: songId ?? this.songId,
      order: order ?? this.order,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPlaylistItemsCompanion(')
          ..write('id: $id, ')
          ..write('playlistId: $playlistId, ')
          ..write('userId: $userId, ')
          ..write('songId: $songId, ')
          ..write('order: $order, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT (newId())',
      defaultValue: const CustomExpression('newId()'));
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, songId, created, updated, deleted, synced, fresh];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserLikedSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserLikedSong(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      songId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}song_id'])!,
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
  Value<String> userId;
  Value<String> songId;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<int> rowid;
  UserLikedSongsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.songId = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserLikedSongsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String songId,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        songId = Value(songId),
        created = Value(created),
        updated = Value(updated);
  static Insertable<UserLikedSong> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? songId,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (songId != null) 'song_id': songId,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserLikedSongsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? songId,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<int>? rowid}) {
    return UserLikedSongsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      songId: songId ?? this.songId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<String>(songId.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserLikedSongsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('songId: $songId, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT (newId())',
      defaultValue: const CustomExpression('newId()'));
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, targetUserId, created, updated, deleted, synced, fresh];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserFollower map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserFollower(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      targetUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target_user_id'])!,
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
  Value<String> userId;
  Value<String> targetUserId;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<int> rowid;
  UserFollowersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.targetUserId = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserFollowersCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String targetUserId,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        targetUserId = Value(targetUserId),
        created = Value(created),
        updated = Value(updated);
  static Insertable<UserFollower> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? targetUserId,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (targetUserId != null) 'target_user_id': targetUserId,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserFollowersCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? targetUserId,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<int>? rowid}) {
    return UserFollowersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      targetUserId: targetUserId ?? this.targetUserId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (targetUserId.present) {
      map['target_user_id'] = Variable<String>(targetUserId.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFollowersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('targetUserId: $targetUserId, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Changes extends Table with TableInfo<Changes, Chang> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Changes(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY DEFAULT (newId())',
      defaultValue: const CustomExpression('newId()'));
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _collectionNameMeta =
      const VerificationMeta('collectionName');
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
      'collection_name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
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
      'record_data', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        collectionId,
        collectionName,
        recordId,
        recordData,
        action,
        created,
        updated,
        deleted,
        synced,
        fresh
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'changes';
  @override
  VerificationContext validateIntegrity(Insertable<Chang> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('collection_name')) {
      context.handle(
          _collectionNameMeta,
          collectionName.isAcceptableOrUnknown(
              data['collection_name']!, _collectionNameMeta));
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
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chang map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chang(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      collectionName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_name']),
      recordId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_id'])!,
      recordData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_data']),
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
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
    );
  }

  @override
  Changes createAlias(String alias) {
    return Changes(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ChangesCompanion extends UpdateCompanion<Chang> {
  Value<String> id;
  Value<String> collectionId;
  Value<String?> collectionName;
  Value<String> recordId;
  Value<String?> recordData;
  Value<String> action;
  Value<DateTime> created;
  Value<DateTime> updated;
  Value<bool> deleted;
  Value<bool> synced;
  Value<bool> fresh;
  Value<int> rowid;
  ChangesCompanion({
    this.id = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.collectionName = const Value.absent(),
    this.recordId = const Value.absent(),
    this.recordData = const Value.absent(),
    this.action = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChangesCompanion.insert({
    this.id = const Value.absent(),
    required String collectionId,
    this.collectionName = const Value.absent(),
    required String recordId,
    this.recordData = const Value.absent(),
    required String action,
    required DateTime created,
    required DateTime updated,
    this.deleted = const Value.absent(),
    this.synced = const Value.absent(),
    this.fresh = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : collectionId = Value(collectionId),
        recordId = Value(recordId),
        action = Value(action),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Chang> custom({
    Expression<String>? id,
    Expression<String>? collectionId,
    Expression<String>? collectionName,
    Expression<String>? recordId,
    Expression<String>? recordData,
    Expression<String>? action,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
    Expression<bool>? deleted,
    Expression<bool>? synced,
    Expression<bool>? fresh,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (collectionId != null) 'collection_id': collectionId,
      if (collectionName != null) 'collection_name': collectionName,
      if (recordId != null) 'record_id': recordId,
      if (recordData != null) 'record_data': recordData,
      if (action != null) 'action': action,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
      if (deleted != null) 'deleted': deleted,
      if (synced != null) 'synced': synced,
      if (fresh != null) 'fresh': fresh,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChangesCompanion copyWith(
      {Value<String>? id,
      Value<String>? collectionId,
      Value<String?>? collectionName,
      Value<String>? recordId,
      Value<String?>? recordData,
      Value<String>? action,
      Value<DateTime>? created,
      Value<DateTime>? updated,
      Value<bool>? deleted,
      Value<bool>? synced,
      Value<bool>? fresh,
      Value<int>? rowid}) {
    return ChangesCompanion(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      recordId: recordId ?? this.recordId,
      recordData: recordData ?? this.recordData,
      action: action ?? this.action,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      synced: synced ?? this.synced,
      fresh: fresh ?? this.fresh,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (collectionName.present) {
      map['collection_name'] = Variable<String>(collectionName.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (recordData.present) {
      map['record_data'] = Variable<String>(recordData.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChangesCompanion(')
          ..write('id: $id, ')
          ..write('collectionId: $collectionId, ')
          ..write('collectionName: $collectionName, ')
          ..write('recordId: $recordId, ')
          ..write('recordData: $recordData, ')
          ..write('action: $action, ')
          ..write('created: $created, ')
          ..write('updated: $updated, ')
          ..write('deleted: $deleted, ')
          ..write('synced: $synced, ')
          ..write('fresh: $fresh, ')
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
  late final UserLikedSongs userLikedSongs = UserLikedSongs(this);
  late final UserFollowers userFollowers = UserFollowers(this);
  late final Changes changes = Changes(this);
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
      {String? username,
      required String email,
      bool? emailVisibility,
      bool? verified,
      String? name,
      String? avatar}) {
    return customWriteReturning(
        'INSERT INTO users (username, email, emailVisibility, verified, name, avatar, synced, fresh, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, ?6, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
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

  Future<List<User>> usersInsertWithId(
      {required String id,
      String? username,
      required String email,
      bool? emailVisibility,
      bool? verified,
      String? name,
      String? avatar}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO users (id, username, email, emailVisibility, verified, name, avatar, synced, fresh, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(id),
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

  Future<int> usersUpdate(
      {String? username,
      required String email,
      bool? emailVisibility,
      bool? verified,
      String? name,
      String? avatar,
      required String id}) {
    return customUpdate(
      'UPDATE users SET username = ?1, email = ?2, emailVisibility = ?3, verified = ?4, name = ?5, avatar = ?6, synced = FALSE, fresh = FALSE, updated = now() WHERE id = ?7',
      variables: [
        Variable<String>(username),
        Variable<String>(email),
        Variable<bool>(emailVisibility),
        Variable<bool>(verified),
        Variable<String>(name),
        Variable<String>(avatar),
        Variable<String>(id)
      ],
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

  Future<List<Album>> albumsInsert({required String name}) {
    return customWriteReturning(
        'INSERT INTO albums (name, synced, fresh, created, updated) VALUES (?1, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(name)
        ],
        updates: {
          albums
        }).then((rows) => Future.wait(rows.map(albums.mapFromRow)));
  }

  Future<List<Album>> albumsInsertWithId(
      {required String id, required String name}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO albums (id, name, synced, fresh, created, updated) VALUES (?1, ?2, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(name)
        ],
        updates: {
          albums
        }).then((rows) => Future.wait(rows.map(albums.mapFromRow)));
  }

  Future<int> albumsUpdate({required String name, required String id}) {
    return customUpdate(
      'UPDATE albums SET name = ?1, synced = FALSE, fresh = FALSE, updated = now() WHERE id = ?2',
      variables: [Variable<String>(name), Variable<String>(id)],
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
      {required String albumId,
      required String songId,
      required double order}) {
    return customWriteReturning(
        'INSERT INTO album_tracks (album_id, song_id, "order", synced, fresh, created, updated) VALUES (?1, ?2, ?3, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(albumId),
          Variable<String>(songId),
          Variable<double>(order)
        ],
        updates: {
          albumTracks
        }).then((rows) => Future.wait(rows.map(albumTracks.mapFromRow)));
  }

  Future<List<AlbumTrack>> albumTracksInsertWithId(
      {required String id,
      required String albumId,
      required String songId,
      required double order}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO album_tracks (id, album_id, song_id, "order", synced, fresh, created, updated) VALUES (?1, ?2, ?3, ?4, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(albumId),
          Variable<String>(songId),
          Variable<double>(order)
        ],
        updates: {
          albumTracks
        }).then((rows) => Future.wait(rows.map(albumTracks.mapFromRow)));
  }

  Future<int> albumTracksUpdate(
      {required String albumId,
      required String songId,
      required double order,
      required String id}) {
    return customUpdate(
      'UPDATE album_tracks SET album_id = ?1, song_id = ?2, "order" = ?3, synced = FALSE, fresh = FALSE, updated = now() WHERE id = ?4',
      variables: [
        Variable<String>(albumId),
        Variable<String>(songId),
        Variable<double>(order),
        Variable<String>(id)
      ],
      updates: {albumTracks},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<AlbumTrack> albumTracksGetByAlbumId({required String albumId}) {
    return customSelect('SELECT * FROM album_tracks WHERE album_id = ?1',
        variables: [
          Variable<String>(albumId)
        ],
        readsFrom: {
          albumTracks,
        }).asyncMap(albumTracks.mapFromRow);
  }

  Selectable<AlbumTrack> albumTracksGetBySongId({required String songId}) {
    return customSelect('SELECT * FROM album_tracks WHERE song_id = ?1',
        variables: [
          Variable<String>(songId)
        ],
        readsFrom: {
          albumTracks,
        }).asyncMap(albumTracks.mapFromRow);
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
      {required String name, required String userId}) {
    return customWriteReturning(
        'INSERT INTO user_playlists (name, user_id, synced, fresh, created, updated) VALUES (?1, ?2, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(name),
          Variable<String>(userId)
        ],
        updates: {
          userPlaylists
        }).then((rows) => Future.wait(rows.map(userPlaylists.mapFromRow)));
  }

  Future<List<UserPlaylist>> userPlaylistsInsertWithId(
      {required String id, required String name, required String userId}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO user_playlists (id, name, user_id, synced, fresh, created, updated) VALUES (?1, ?2, ?3, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(name),
          Variable<String>(userId)
        ],
        updates: {
          userPlaylists
        }).then((rows) => Future.wait(rows.map(userPlaylists.mapFromRow)));
  }

  Future<int> userPlaylistsUpdate(
      {required String name, required String userId, required String id}) {
    return customUpdate(
      'UPDATE user_playlists SET name = ?1, user_id = ?2, synced = FALSE, fresh = FALSE, updated = now() WHERE id = ?3',
      variables: [
        Variable<String>(name),
        Variable<String>(userId),
        Variable<String>(id)
      ],
      updates: {userPlaylists},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<UserPlaylist> userPlaylistsGetByUserId({required String userId}) {
    return customSelect('SELECT * FROM user_playlists WHERE user_id = ?1',
        variables: [
          Variable<String>(userId)
        ],
        readsFrom: {
          userPlaylists,
        }).asyncMap(userPlaylists.mapFromRow);
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
      {required String playlistId,
      required String userId,
      required String songId,
      required double order}) {
    return customWriteReturning(
        'INSERT INTO user_playlist_items (playlist_id, user_id, song_id, "order", synced, fresh, created, updated) VALUES (?1, ?2, ?3, ?4, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(playlistId),
          Variable<String>(userId),
          Variable<String>(songId),
          Variable<double>(order)
        ],
        updates: {
          userPlaylistItems
        }).then((rows) => Future.wait(rows.map(userPlaylistItems.mapFromRow)));
  }

  Future<List<UserPlaylistItem>> userPlaylistItemsInsertWithId(
      {required String id,
      required String playlistId,
      required String userId,
      required String songId,
      required double order}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO user_playlist_items (id, playlist_id, user_id, song_id, "order", synced, fresh, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(playlistId),
          Variable<String>(userId),
          Variable<String>(songId),
          Variable<double>(order)
        ],
        updates: {
          userPlaylistItems
        }).then((rows) => Future.wait(rows.map(userPlaylistItems.mapFromRow)));
  }

  Future<int> userPlaylistItemsUpdate(
      {required String playlistId,
      required String userId,
      required String songId,
      required double order,
      required String id}) {
    return customUpdate(
      'UPDATE user_playlist_items SET playlist_id = ?1, user_id = ?2, song_id = ?3, "order" = ?4, synced = FALSE, fresh = FALSE, updated = now() WHERE id = ?5',
      variables: [
        Variable<String>(playlistId),
        Variable<String>(userId),
        Variable<String>(songId),
        Variable<double>(order),
        Variable<String>(id)
      ],
      updates: {userPlaylistItems},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<UserPlaylistItem> userPlaylistItemsGetByPlaylistId(
      {required String playlistId}) {
    return customSelect(
        'SELECT * FROM user_playlist_items WHERE playlist_id = ?1',
        variables: [
          Variable<String>(playlistId)
        ],
        readsFrom: {
          userPlaylistItems,
        }).asyncMap(userPlaylistItems.mapFromRow);
  }

  Selectable<UserPlaylistItem> userPlaylistItemsGetByUserId(
      {required String userId}) {
    return customSelect('SELECT * FROM user_playlist_items WHERE user_id = ?1',
        variables: [
          Variable<String>(userId)
        ],
        readsFrom: {
          userPlaylistItems,
        }).asyncMap(userPlaylistItems.mapFromRow);
  }

  Selectable<UserPlaylistItem> userPlaylistItemsGetBySongId(
      {required String songId}) {
    return customSelect('SELECT * FROM user_playlist_items WHERE song_id = ?1',
        variables: [
          Variable<String>(songId)
        ],
        readsFrom: {
          userPlaylistItems,
        }).asyncMap(userPlaylistItems.mapFromRow);
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
      {required String name, String? downloadLink, String? artistId}) {
    return customWriteReturning(
        'INSERT INTO songs (name, download_link, artist_id, synced, fresh, created, updated) VALUES (?1, ?2, ?3, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(name),
          Variable<String>(downloadLink),
          Variable<String>(artistId)
        ],
        updates: {
          songs
        }).then((rows) => Future.wait(rows.map(songs.mapFromRow)));
  }

  Future<List<Song>> songsInsertWithId(
      {required String id,
      required String name,
      String? downloadLink,
      String? artistId}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO songs (id, name, download_link, artist_id, synced, fresh, created, updated) VALUES (?1, ?2, ?3, ?4, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(name),
          Variable<String>(downloadLink),
          Variable<String>(artistId)
        ],
        updates: {
          songs
        }).then((rows) => Future.wait(rows.map(songs.mapFromRow)));
  }

  Future<int> songsUpdate(
      {required String name,
      String? downloadLink,
      String? artistId,
      required String id}) {
    return customUpdate(
      'UPDATE songs SET name = ?1, download_link = ?2, artist_id = ?3, synced = FALSE, fresh = FALSE, updated = now() WHERE id = ?4',
      variables: [
        Variable<String>(name),
        Variable<String>(downloadLink),
        Variable<String>(artistId),
        Variable<String>(id)
      ],
      updates: {songs},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<Song> songsGetByArtistId({String? artistId}) {
    return customSelect('SELECT * FROM songs WHERE artist_id = ?1', variables: [
      Variable<String>(artistId)
    ], readsFrom: {
      songs,
    }).asyncMap(songs.mapFromRow);
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
      {String? username,
      required String email,
      bool? emailVisibility,
      bool? verified}) {
    return customWriteReturning(
        'INSERT INTO artists (username, email, emailVisibility, verified, synced, fresh, created, updated) VALUES (?1, ?2, ?3, ?4, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(username),
          Variable<String>(email),
          Variable<bool>(emailVisibility),
          Variable<bool>(verified)
        ],
        updates: {
          artists
        }).then((rows) => Future.wait(rows.map(artists.mapFromRow)));
  }

  Future<List<Artist>> artistsInsertWithId(
      {required String id,
      String? username,
      required String email,
      bool? emailVisibility,
      bool? verified}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO artists (id, username, email, emailVisibility, verified, synced, fresh, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(username),
          Variable<String>(email),
          Variable<bool>(emailVisibility),
          Variable<bool>(verified)
        ],
        updates: {
          artists
        }).then((rows) => Future.wait(rows.map(artists.mapFromRow)));
  }

  Future<int> artistsUpdate(
      {String? username,
      required String email,
      bool? emailVisibility,
      bool? verified,
      required String id}) {
    return customUpdate(
      'UPDATE artists SET username = ?1, email = ?2, emailVisibility = ?3, verified = ?4, synced = FALSE, fresh = FALSE, updated = now() WHERE id = ?5',
      variables: [
        Variable<String>(username),
        Variable<String>(email),
        Variable<bool>(emailVisibility),
        Variable<bool>(verified),
        Variable<String>(id)
      ],
      updates: {artists},
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
      {required String userId, required String songId}) {
    return customWriteReturning(
        'INSERT INTO user_liked_songs (user_id, song_id, synced, fresh, created, updated) VALUES (?1, ?2, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(userId),
          Variable<String>(songId)
        ],
        updates: {
          userLikedSongs
        }).then((rows) => Future.wait(rows.map(userLikedSongs.mapFromRow)));
  }

  Future<List<UserLikedSong>> userLikedSongsInsertWithId(
      {required String id, required String userId, required String songId}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO user_liked_songs (id, user_id, song_id, synced, fresh, created, updated) VALUES (?1, ?2, ?3, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(userId),
          Variable<String>(songId)
        ],
        updates: {
          userLikedSongs
        }).then((rows) => Future.wait(rows.map(userLikedSongs.mapFromRow)));
  }

  Future<int> userLikedSongsUpdate(
      {required String userId, required String songId, required String id}) {
    return customUpdate(
      'UPDATE user_liked_songs SET user_id = ?1, song_id = ?2, synced = FALSE, fresh = FALSE, updated = now() WHERE id = ?3',
      variables: [
        Variable<String>(userId),
        Variable<String>(songId),
        Variable<String>(id)
      ],
      updates: {userLikedSongs},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<UserLikedSong> userLikedSongsGetByUserId(
      {required String userId}) {
    return customSelect('SELECT * FROM user_liked_songs WHERE user_id = ?1',
        variables: [
          Variable<String>(userId)
        ],
        readsFrom: {
          userLikedSongs,
        }).asyncMap(userLikedSongs.mapFromRow);
  }

  Selectable<UserLikedSong> userLikedSongsGetBySongId(
      {required String songId}) {
    return customSelect('SELECT * FROM user_liked_songs WHERE song_id = ?1',
        variables: [
          Variable<String>(songId)
        ],
        readsFrom: {
          userLikedSongs,
        }).asyncMap(userLikedSongs.mapFromRow);
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
      {required String userId, required String targetUserId}) {
    return customWriteReturning(
        'INSERT INTO user_followers (user_id, target_user_id, synced, fresh, created, updated) VALUES (?1, ?2, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(userId),
          Variable<String>(targetUserId)
        ],
        updates: {
          userFollowers
        }).then((rows) => Future.wait(rows.map(userFollowers.mapFromRow)));
  }

  Future<List<UserFollower>> userFollowersInsertWithId(
      {required String id,
      required String userId,
      required String targetUserId}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO user_followers (id, user_id, target_user_id, synced, fresh, created, updated) VALUES (?1, ?2, ?3, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(userId),
          Variable<String>(targetUserId)
        ],
        updates: {
          userFollowers
        }).then((rows) => Future.wait(rows.map(userFollowers.mapFromRow)));
  }

  Future<int> userFollowersUpdate(
      {required String userId,
      required String targetUserId,
      required String id}) {
    return customUpdate(
      'UPDATE user_followers SET user_id = ?1, target_user_id = ?2, synced = FALSE, fresh = FALSE, updated = now() WHERE id = ?3',
      variables: [
        Variable<String>(userId),
        Variable<String>(targetUserId),
        Variable<String>(id)
      ],
      updates: {userFollowers},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<UserFollower> userFollowersGetByUserId({required String userId}) {
    return customSelect('SELECT * FROM user_followers WHERE user_id = ?1',
        variables: [
          Variable<String>(userId)
        ],
        readsFrom: {
          userFollowers,
        }).asyncMap(userFollowers.mapFromRow);
  }

  Selectable<UserFollower> userFollowersGetByTargetUserId(
      {required String targetUserId}) {
    return customSelect(
        'SELECT * FROM user_followers WHERE target_user_id = ?1',
        variables: [
          Variable<String>(targetUserId)
        ],
        readsFrom: {
          userFollowers,
        }).asyncMap(userFollowers.mapFromRow);
  }

  Selectable<Chang> changesGetAll() {
    return customSelect('SELECT * FROM changes', variables: [], readsFrom: {
      changes,
    }).asyncMap(changes.mapFromRow);
  }

  Selectable<Chang> changesGetOne({required String id}) {
    return customSelect('SELECT * FROM changes WHERE id = ?1', variables: [
      Variable<String>(id)
    ], readsFrom: {
      changes,
    }).asyncMap(changes.mapFromRow);
  }

  Selectable<Chang> changesGetUnsynced() {
    return customSelect('SELECT * FROM changes WHERE synced = FALSE',
        variables: [],
        readsFrom: {
          changes,
        }).asyncMap(changes.mapFromRow);
  }

  Future<int> changesHardDeleteOne({required String id}) {
    return customUpdate(
      'DELETE FROM changes WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {changes},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> changesSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE changes SET deleted = TRUE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {changes},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> changesRestoreSoftDeleteOne({required String id}) {
    return customUpdate(
      'UPDATE changes SET deleted = FALSE, synced = FALSE WHERE id = ?1',
      variables: [Variable<String>(id)],
      updates: {changes},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> changesHardDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'DELETE FROM changes WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {changes},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> changesSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE changes SET deleted = TRUE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {changes},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> changesRestoreSoftDeleteMulti({required List<String> ids}) {
    var $arrayStartIndex = 1;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE changes SET deleted = FALSE, synced = FALSE WHERE id IN ($expandedids)',
      variables: [for (var $ in ids) Variable<String>($)],
      updates: {changes},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> changesSetSyncStatusOne(
      {required bool value, required String id}) {
    return customUpdate(
      'UPDATE changes SET synced = ?1 WHERE id = ?2',
      variables: [Variable<bool>(value), Variable<String>(id)],
      updates: {changes},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> changesSetSyncStatusMulti(
      {required bool value, required List<String> ids}) {
    var $arrayStartIndex = 2;
    final expandedids = $expandVar($arrayStartIndex, ids.length);
    $arrayStartIndex += ids.length;
    return customUpdate(
      'UPDATE changes SET synced = ?1 WHERE id IN ($expandedids)',
      variables: [
        Variable<bool>(value),
        for (var $ in ids) Variable<String>($)
      ],
      updates: {changes},
      updateKind: UpdateKind.update,
    );
  }

  Future<List<Chang>> changesInsert(
      {required String collectionId,
      String? collectionName,
      required String recordId,
      String? recordData,
      required String action}) {
    return customWriteReturning(
        'INSERT INTO changes (collection_id, collection_name, record_id, record_data, "action", synced, fresh, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(collectionId),
          Variable<String>(collectionName),
          Variable<String>(recordId),
          Variable<String>(recordData),
          Variable<String>(action)
        ],
        updates: {
          changes
        }).then((rows) => Future.wait(rows.map(changes.mapFromRow)));
  }

  Future<List<Chang>> changesInsertWithId(
      {required String id,
      required String collectionId,
      String? collectionName,
      required String recordId,
      String? recordData,
      required String action}) {
    return customWriteReturning(
        'INSERT OR REPLACE INTO changes (id, collection_id, collection_name, record_id, record_data, "action", synced, fresh, created, updated) VALUES (?1, ?2, ?3, ?4, ?5, ?6, FALSE, TRUE, now(), now()) RETURNING *',
        variables: [
          Variable<String>(id),
          Variable<String>(collectionId),
          Variable<String>(collectionName),
          Variable<String>(recordId),
          Variable<String>(recordData),
          Variable<String>(action)
        ],
        updates: {
          changes
        }).then((rows) => Future.wait(rows.map(changes.mapFromRow)));
  }

  Future<int> changesUpdate(
      {required String collectionId,
      String? collectionName,
      required String recordId,
      String? recordData,
      required String action,
      required String id}) {
    return customUpdate(
      'UPDATE changes SET collection_id = ?1, collection_name = ?2, record_id = ?3, record_data = ?4, "action" = ?5, synced = FALSE, fresh = FALSE, updated = now() WHERE id = ?6',
      variables: [
        Variable<String>(collectionId),
        Variable<String>(collectionName),
        Variable<String>(recordId),
        Variable<String>(recordData),
        Variable<String>(action),
        Variable<String>(id)
      ],
      updates: {changes},
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
        userLikedSongs,
        userFollowers,
        changes
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
