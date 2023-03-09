// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_base.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class QuoteMainLocalData extends DataClass
    implements Insertable<QuoteMainLocalData> {
  final int id;
  final String client;
  final String address;
  final String quotename;
  final DateTime quotedate;
  QuoteMainLocalData(
      {@required this.id,
      @required this.client,
      @required this.address,
      @required this.quotename,
      @required this.quotedate});
  factory QuoteMainLocalData.fromData(Map<String, dynamic> data,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return QuoteMainLocalData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      client: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}client']),
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      quotename: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quotename']),
      quotedate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quotedate']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || client != null) {
      map['client'] = Variable<String>(client);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || quotename != null) {
      map['quotename'] = Variable<String>(quotename);
    }
    if (!nullToAbsent || quotedate != null) {
      map['quotedate'] = Variable<DateTime>(quotedate);
    }
    return map;
  }

  QuoteMainLocalDatasourceImplCompanion toCompanion(bool nullToAbsent) {
    return QuoteMainLocalDatasourceImplCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      client:
          client == null && nullToAbsent ? const Value.absent() : Value(client),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      quotename: quotename == null && nullToAbsent
          ? const Value.absent()
          : Value(quotename),
      quotedate: quotedate == null && nullToAbsent
          ? const Value.absent()
          : Value(quotedate),
    );
  }

  factory QuoteMainLocalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuoteMainLocalData(
      id: serializer.fromJson<int>(json['id']),
      client: serializer.fromJson<String>(json['client']),
      address: serializer.fromJson<String>(json['address']),
      quotename: serializer.fromJson<String>(json['quotename']),
      quotedate: serializer.fromJson<DateTime>(json['quotedate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'client': serializer.toJson<String>(client),
      'address': serializer.toJson<String>(address),
      'quotename': serializer.toJson<String>(quotename),
      'quotedate': serializer.toJson<DateTime>(quotedate),
    };
  }

  QuoteMainLocalData copyWith(
          {int id,
          String client,
          String address,
          String quotename,
          DateTime quotedate}) =>
      QuoteMainLocalData(
        id: id ?? this.id,
        client: client ?? this.client,
        address: address ?? this.address,
        quotename: quotename ?? this.quotename,
        quotedate: quotedate ?? this.quotedate,
      );
  @override
  String toString() {
    return (StringBuffer('QuoteMainLocalData(')
          ..write('id: $id, ')
          ..write('client: $client, ')
          ..write('address: $address, ')
          ..write('quotename: $quotename, ')
          ..write('quotedate: $quotedate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, client, address, quotename, quotedate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuoteMainLocalData &&
          other.id == this.id &&
          other.client == this.client &&
          other.address == this.address &&
          other.quotename == this.quotename &&
          other.quotedate == this.quotedate);
}

class QuoteMainLocalDatasourceImplCompanion
    extends UpdateCompanion<QuoteMainLocalData> {
  final Value<int> id;
  final Value<String> client;
  final Value<String> address;
  final Value<String> quotename;
  final Value<DateTime> quotedate;
  const QuoteMainLocalDatasourceImplCompanion({
    this.id = const Value.absent(),
    this.client = const Value.absent(),
    this.address = const Value.absent(),
    this.quotename = const Value.absent(),
    this.quotedate = const Value.absent(),
  });
  QuoteMainLocalDatasourceImplCompanion.insert({
    this.id = const Value.absent(),
    @required String client,
    @required String address,
    @required String quotename,
    this.quotedate = const Value.absent(),
  })  : client = Value(client),
        address = Value(address),
        quotename = Value(quotename);
  static Insertable<QuoteMainLocalData> custom({
    Expression<int> id,
    Expression<String> client,
    Expression<String> address,
    Expression<String> quotename,
    Expression<DateTime> quotedate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (client != null) 'client': client,
      if (address != null) 'address': address,
      if (quotename != null) 'quotename': quotename,
      if (quotedate != null) 'quotedate': quotedate,
    });
  }

  QuoteMainLocalDatasourceImplCompanion copyWith(
      {Value<int> id,
      Value<String> client,
      Value<String> address,
      Value<String> quotename,
      Value<DateTime> quotedate}) {
    return QuoteMainLocalDatasourceImplCompanion(
      id: id ?? this.id,
      client: client ?? this.client,
      address: address ?? this.address,
      quotename: quotename ?? this.quotename,
      quotedate: quotedate ?? this.quotedate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (client.present) {
      map['client'] = Variable<String>(client.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (quotename.present) {
      map['quotename'] = Variable<String>(quotename.value);
    }
    if (quotedate.present) {
      map['quotedate'] = Variable<DateTime>(quotedate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuoteMainLocalDatasourceImplCompanion(')
          ..write('id: $id, ')
          ..write('client: $client, ')
          ..write('address: $address, ')
          ..write('quotename: $quotename, ')
          ..write('quotedate: $quotedate')
          ..write(')'))
        .toString();
  }
}

class $QuoteMainLocalDatasourceImplTable extends QuoteMainLocalDatasourceImpl
    with TableInfo<$QuoteMainLocalDatasourceImplTable, QuoteMainLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String _alias;
  $QuoteMainLocalDatasourceImplTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _clientMeta = const VerificationMeta('client');
  GeneratedColumn<String> _client;
  @override
  GeneratedColumn<String> get client => _client ??= GeneratedColumn<String>(
      'client', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedColumn<String> _address;
  @override
  GeneratedColumn<String> get address => _address ??= GeneratedColumn<String>(
      'address', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _quotenameMeta = const VerificationMeta('quotename');
  GeneratedColumn<String> _quotename;
  @override
  GeneratedColumn<String> get quotename =>
      _quotename ??= GeneratedColumn<String>('quotename', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 50),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _quotedateMeta = const VerificationMeta('quotedate');
  GeneratedColumn<DateTime> _quotedate;
  @override
  GeneratedColumn<DateTime> get quotedate =>
      _quotedate ??= GeneratedColumn<DateTime>('quotedate', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [id, client, address, quotename, quotedate];
  @override
  String get aliasedName => _alias ?? 'quote_main_local_datasource_impl';
  @override
  String get actualTableName => 'quote_main_local_datasource_impl';
  @override
  VerificationContext validateIntegrity(Insertable<QuoteMainLocalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('client')) {
      context.handle(_clientMeta,
          client.isAcceptableOrUnknown(data['client'], _clientMeta));
    } else if (isInserting) {
      context.missing(_clientMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('quotename')) {
      context.handle(_quotenameMeta,
          quotename.isAcceptableOrUnknown(data['quotename'], _quotenameMeta));
    } else if (isInserting) {
      context.missing(_quotenameMeta);
    }
    if (data.containsKey('quotedate')) {
      context.handle(_quotedateMeta,
          quotedate.isAcceptableOrUnknown(data['quotedate'], _quotedateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuoteMainLocalData map(Map<String, dynamic> data, {String tablePrefix}) {
    return QuoteMainLocalData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $QuoteMainLocalDatasourceImplTable createAlias(String alias) {
    return $QuoteMainLocalDatasourceImplTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $QuoteMainLocalDatasourceImplTable _quoteMainLocalDatasourceImpl;
  $QuoteMainLocalDatasourceImplTable get quoteMainLocalDatasourceImpl =>
      _quoteMainLocalDatasourceImpl ??=
          $QuoteMainLocalDatasourceImplTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [quoteMainLocalDatasourceImpl];
}
