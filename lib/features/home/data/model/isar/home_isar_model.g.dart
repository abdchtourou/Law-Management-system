// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHomeIsarModelCollection on Isar {
  IsarCollection<HomeIsarModel> get homeIsarModels => this.collection();
}

const HomeIsarModelSchema = CollectionSchema(
  name: r'HomeIsarModel',
  id: 8948866824653415059,
  properties: {
    r'legalCasesStats': PropertySchema(
      id: 0,
      name: r'legalCasesStats',
      type: IsarType.object,
      target: r'LegalCasesStatsEmbedded',
    ),
    r'recentCases': PropertySchema(
      id: 1,
      name: r'recentCases',
      type: IsarType.objectList,
      target: r'RecentCasesEmbedded',
    ),
    r'recentTasks': PropertySchema(
      id: 2,
      name: r'recentTasks',
      type: IsarType.objectList,
      target: r'RecentTasksEmbedded',
    ),
    r'tasksStats': PropertySchema(
      id: 3,
      name: r'tasksStats',
      type: IsarType.object,
      target: r'TasksStatsEmbedded',
    ),
    r'userId': PropertySchema(
      id: 4,
      name: r'userId',
      type: IsarType.string,
    ),
    r'usersStats': PropertySchema(
      id: 5,
      name: r'usersStats',
      type: IsarType.object,
      target: r'UsersStatsEmbedded',
    )
  },
  estimateSize: _homeIsarModelEstimateSize,
  serialize: _homeIsarModelSerialize,
  deserialize: _homeIsarModelDeserialize,
  deserializeProp: _homeIsarModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'LegalCasesStatsEmbedded': LegalCasesStatsEmbeddedSchema,
    r'TasksStatsEmbedded': TasksStatsEmbeddedSchema,
    r'UsersStatsEmbedded': UsersStatsEmbeddedSchema,
    r'RecentTasksEmbedded': RecentTasksEmbeddedSchema,
    r'RecentCasesEmbedded': RecentCasesEmbeddedSchema
  },
  getId: _homeIsarModelGetId,
  getLinks: _homeIsarModelGetLinks,
  attach: _homeIsarModelAttach,
  version: '3.1.0+1',
);

int _homeIsarModelEstimateSize(
  HomeIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.legalCasesStats;
    if (value != null) {
      bytesCount += 3 +
          LegalCasesStatsEmbeddedSchema.estimateSize(
              value, allOffsets[LegalCasesStatsEmbedded]!, allOffsets);
    }
  }
  {
    final list = object.recentCases;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[RecentCasesEmbedded]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += RecentCasesEmbeddedSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.recentTasks;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[RecentTasksEmbedded]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += RecentTasksEmbeddedSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.tasksStats;
    if (value != null) {
      bytesCount += 3 +
          TasksStatsEmbeddedSchema.estimateSize(
              value, allOffsets[TasksStatsEmbedded]!, allOffsets);
    }
  }
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.usersStats;
    if (value != null) {
      bytesCount += 3 +
          UsersStatsEmbeddedSchema.estimateSize(
              value, allOffsets[UsersStatsEmbedded]!, allOffsets);
    }
  }
  return bytesCount;
}

void _homeIsarModelSerialize(
  HomeIsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<LegalCasesStatsEmbedded>(
    offsets[0],
    allOffsets,
    LegalCasesStatsEmbeddedSchema.serialize,
    object.legalCasesStats,
  );
  writer.writeObjectList<RecentCasesEmbedded>(
    offsets[1],
    allOffsets,
    RecentCasesEmbeddedSchema.serialize,
    object.recentCases,
  );
  writer.writeObjectList<RecentTasksEmbedded>(
    offsets[2],
    allOffsets,
    RecentTasksEmbeddedSchema.serialize,
    object.recentTasks,
  );
  writer.writeObject<TasksStatsEmbedded>(
    offsets[3],
    allOffsets,
    TasksStatsEmbeddedSchema.serialize,
    object.tasksStats,
  );
  writer.writeString(offsets[4], object.userId);
  writer.writeObject<UsersStatsEmbedded>(
    offsets[5],
    allOffsets,
    UsersStatsEmbeddedSchema.serialize,
    object.usersStats,
  );
}

HomeIsarModel _homeIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HomeIsarModel();
  object.id = id;
  object.legalCasesStats = reader.readObjectOrNull<LegalCasesStatsEmbedded>(
    offsets[0],
    LegalCasesStatsEmbeddedSchema.deserialize,
    allOffsets,
  );
  object.recentCases = reader.readObjectList<RecentCasesEmbedded>(
    offsets[1],
    RecentCasesEmbeddedSchema.deserialize,
    allOffsets,
    RecentCasesEmbedded(),
  );
  object.recentTasks = reader.readObjectList<RecentTasksEmbedded>(
    offsets[2],
    RecentTasksEmbeddedSchema.deserialize,
    allOffsets,
    RecentTasksEmbedded(),
  );
  object.tasksStats = reader.readObjectOrNull<TasksStatsEmbedded>(
    offsets[3],
    TasksStatsEmbeddedSchema.deserialize,
    allOffsets,
  );
  object.userId = reader.readStringOrNull(offsets[4]);
  object.usersStats = reader.readObjectOrNull<UsersStatsEmbedded>(
    offsets[5],
    UsersStatsEmbeddedSchema.deserialize,
    allOffsets,
  );
  return object;
}

P _homeIsarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<LegalCasesStatsEmbedded>(
        offset,
        LegalCasesStatsEmbeddedSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectList<RecentCasesEmbedded>(
        offset,
        RecentCasesEmbeddedSchema.deserialize,
        allOffsets,
        RecentCasesEmbedded(),
      )) as P;
    case 2:
      return (reader.readObjectList<RecentTasksEmbedded>(
        offset,
        RecentTasksEmbeddedSchema.deserialize,
        allOffsets,
        RecentTasksEmbedded(),
      )) as P;
    case 3:
      return (reader.readObjectOrNull<TasksStatsEmbedded>(
        offset,
        TasksStatsEmbeddedSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<UsersStatsEmbedded>(
        offset,
        UsersStatsEmbeddedSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _homeIsarModelGetId(HomeIsarModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _homeIsarModelGetLinks(HomeIsarModel object) {
  return [];
}

void _homeIsarModelAttach(
    IsarCollection<dynamic> col, Id id, HomeIsarModel object) {
  object.id = id;
}

extension HomeIsarModelByIndex on IsarCollection<HomeIsarModel> {
  Future<HomeIsarModel?> getByUserId(String? userId) {
    return getByIndex(r'userId', [userId]);
  }

  HomeIsarModel? getByUserIdSync(String? userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String? userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String? userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<HomeIsarModel?>> getAllByUserId(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<HomeIsarModel?> getAllByUserIdSync(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userId', values);
  }

  Future<int> deleteAllByUserId(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userId', values);
  }

  int deleteAllByUserIdSync(List<String?> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userId', values);
  }

  Future<Id> putByUserId(HomeIsarModel object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(HomeIsarModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<HomeIsarModel> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<HomeIsarModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension HomeIsarModelQueryWhereSort
    on QueryBuilder<HomeIsarModel, HomeIsarModel, QWhere> {
  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HomeIsarModelQueryWhere
    on QueryBuilder<HomeIsarModel, HomeIsarModel, QWhereClause> {
  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterWhereClause> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [null],
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterWhereClause>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterWhereClause> userIdEqualTo(
      String? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterWhereClause>
      userIdNotEqualTo(String? userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension HomeIsarModelQueryFilter
    on QueryBuilder<HomeIsarModel, HomeIsarModel, QFilterCondition> {
  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      legalCasesStatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'legalCasesStats',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      legalCasesStatsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'legalCasesStats',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentCasesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recentCases',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentCasesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recentCases',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentCasesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCases',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentCasesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCases',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentCasesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCases',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentCasesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCases',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentCasesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCases',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentCasesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentCases',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentTasksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recentTasks',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentTasksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recentTasks',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentTasksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentTasks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentTasksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentTasks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentTasksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentTasks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentTasksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentTasks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentTasksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentTasks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentTasksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recentTasks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      tasksStatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tasksStats',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      tasksStatsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tasksStats',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      usersStatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usersStats',
      ));
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      usersStatsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usersStats',
      ));
    });
  }
}

extension HomeIsarModelQueryObject
    on QueryBuilder<HomeIsarModel, HomeIsarModel, QFilterCondition> {
  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      legalCasesStats(FilterQuery<LegalCasesStatsEmbedded> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'legalCasesStats');
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentCasesElement(FilterQuery<RecentCasesEmbedded> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'recentCases');
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition>
      recentTasksElement(FilterQuery<RecentTasksEmbedded> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'recentTasks');
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition> tasksStats(
      FilterQuery<TasksStatsEmbedded> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tasksStats');
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterFilterCondition> usersStats(
      FilterQuery<UsersStatsEmbedded> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'usersStats');
    });
  }
}

extension HomeIsarModelQueryLinks
    on QueryBuilder<HomeIsarModel, HomeIsarModel, QFilterCondition> {}

extension HomeIsarModelQuerySortBy
    on QueryBuilder<HomeIsarModel, HomeIsarModel, QSortBy> {
  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension HomeIsarModelQuerySortThenBy
    on QueryBuilder<HomeIsarModel, HomeIsarModel, QSortThenBy> {
  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<HomeIsarModel, HomeIsarModel, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension HomeIsarModelQueryWhereDistinct
    on QueryBuilder<HomeIsarModel, HomeIsarModel, QDistinct> {
  QueryBuilder<HomeIsarModel, HomeIsarModel, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension HomeIsarModelQueryProperty
    on QueryBuilder<HomeIsarModel, HomeIsarModel, QQueryProperty> {
  QueryBuilder<HomeIsarModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HomeIsarModel, LegalCasesStatsEmbedded?, QQueryOperations>
      legalCasesStatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'legalCasesStats');
    });
  }

  QueryBuilder<HomeIsarModel, List<RecentCasesEmbedded>?, QQueryOperations>
      recentCasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recentCases');
    });
  }

  QueryBuilder<HomeIsarModel, List<RecentTasksEmbedded>?, QQueryOperations>
      recentTasksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recentTasks');
    });
  }

  QueryBuilder<HomeIsarModel, TasksStatsEmbedded?, QQueryOperations>
      tasksStatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tasksStats');
    });
  }

  QueryBuilder<HomeIsarModel, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<HomeIsarModel, UsersStatsEmbedded?, QQueryOperations>
      usersStatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usersStats');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LegalCasesStatsEmbeddedSchema = Schema(
  name: r'LegalCasesStatsEmbedded',
  id: -8877155887236446386,
  properties: {
    r'completionRate': PropertySchema(
      id: 0,
      name: r'completionRate',
      type: IsarType.double,
    ),
    r'open': PropertySchema(
      id: 1,
      name: r'open',
      type: IsarType.long,
    ),
    r'resolved': PropertySchema(
      id: 2,
      name: r'resolved',
      type: IsarType.long,
    ),
    r'total': PropertySchema(
      id: 3,
      name: r'total',
      type: IsarType.long,
    )
  },
  estimateSize: _legalCasesStatsEmbeddedEstimateSize,
  serialize: _legalCasesStatsEmbeddedSerialize,
  deserialize: _legalCasesStatsEmbeddedDeserialize,
  deserializeProp: _legalCasesStatsEmbeddedDeserializeProp,
);

int _legalCasesStatsEmbeddedEstimateSize(
  LegalCasesStatsEmbedded object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _legalCasesStatsEmbeddedSerialize(
  LegalCasesStatsEmbedded object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.completionRate);
  writer.writeLong(offsets[1], object.open);
  writer.writeLong(offsets[2], object.resolved);
  writer.writeLong(offsets[3], object.total);
}

LegalCasesStatsEmbedded _legalCasesStatsEmbeddedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LegalCasesStatsEmbedded();
  object.completionRate = reader.readDoubleOrNull(offsets[0]);
  object.open = reader.readLongOrNull(offsets[1]);
  object.resolved = reader.readLongOrNull(offsets[2]);
  object.total = reader.readLongOrNull(offsets[3]);
  return object;
}

P _legalCasesStatsEmbeddedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LegalCasesStatsEmbeddedQueryFilter on QueryBuilder<
    LegalCasesStatsEmbedded, LegalCasesStatsEmbedded, QFilterCondition> {
  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> completionRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completionRate',
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> completionRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completionRate',
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> completionRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> completionRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> completionRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> completionRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completionRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> openIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'open',
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> openIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'open',
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> openEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'open',
        value: value,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> openGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'open',
        value: value,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> openLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'open',
        value: value,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> openBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'open',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> resolvedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resolved',
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> resolvedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resolved',
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> resolvedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolved',
        value: value,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> resolvedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolved',
        value: value,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> resolvedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolved',
        value: value,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> resolvedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> totalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> totalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> totalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<LegalCasesStatsEmbedded, LegalCasesStatsEmbedded,
      QAfterFilterCondition> totalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LegalCasesStatsEmbeddedQueryObject on QueryBuilder<
    LegalCasesStatsEmbedded, LegalCasesStatsEmbedded, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TasksStatsEmbeddedSchema = Schema(
  name: r'TasksStatsEmbedded',
  id: 516755210301221302,
  properties: {
    r'completedCount': PropertySchema(
      id: 0,
      name: r'completedCount',
      type: IsarType.long,
    ),
    r'completionRate': PropertySchema(
      id: 1,
      name: r'completionRate',
      type: IsarType.double,
    ),
    r'total': PropertySchema(
      id: 2,
      name: r'total',
      type: IsarType.long,
    )
  },
  estimateSize: _tasksStatsEmbeddedEstimateSize,
  serialize: _tasksStatsEmbeddedSerialize,
  deserialize: _tasksStatsEmbeddedDeserialize,
  deserializeProp: _tasksStatsEmbeddedDeserializeProp,
);

int _tasksStatsEmbeddedEstimateSize(
  TasksStatsEmbedded object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _tasksStatsEmbeddedSerialize(
  TasksStatsEmbedded object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.completedCount);
  writer.writeDouble(offsets[1], object.completionRate);
  writer.writeLong(offsets[2], object.total);
}

TasksStatsEmbedded _tasksStatsEmbeddedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TasksStatsEmbedded();
  object.completedCount = reader.readLongOrNull(offsets[0]);
  object.completionRate = reader.readDoubleOrNull(offsets[1]);
  object.total = reader.readLongOrNull(offsets[2]);
  return object;
}

P _tasksStatsEmbeddedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TasksStatsEmbeddedQueryFilter
    on QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QFilterCondition> {
  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completedCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedCount',
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completedCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedCount',
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completedCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completedCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completedCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedCount',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completedCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completionRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completionRate',
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completionRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completionRate',
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completionRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completionRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completionRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      completionRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completionRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      totalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      totalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      totalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QAfterFilterCondition>
      totalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TasksStatsEmbeddedQueryObject
    on QueryBuilder<TasksStatsEmbedded, TasksStatsEmbedded, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const UsersStatsEmbeddedSchema = Schema(
  name: r'UsersStatsEmbedded',
  id: -4421581855406901898,
  properties: {
    r'femaleCount': PropertySchema(
      id: 0,
      name: r'femaleCount',
      type: IsarType.long,
    ),
    r'maleCount': PropertySchema(
      id: 1,
      name: r'maleCount',
      type: IsarType.long,
    ),
    r'malePercentage': PropertySchema(
      id: 2,
      name: r'malePercentage',
      type: IsarType.double,
    ),
    r'total': PropertySchema(
      id: 3,
      name: r'total',
      type: IsarType.long,
    )
  },
  estimateSize: _usersStatsEmbeddedEstimateSize,
  serialize: _usersStatsEmbeddedSerialize,
  deserialize: _usersStatsEmbeddedDeserialize,
  deserializeProp: _usersStatsEmbeddedDeserializeProp,
);

int _usersStatsEmbeddedEstimateSize(
  UsersStatsEmbedded object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _usersStatsEmbeddedSerialize(
  UsersStatsEmbedded object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.femaleCount);
  writer.writeLong(offsets[1], object.maleCount);
  writer.writeDouble(offsets[2], object.malePercentage);
  writer.writeLong(offsets[3], object.total);
}

UsersStatsEmbedded _usersStatsEmbeddedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UsersStatsEmbedded();
  object.femaleCount = reader.readLongOrNull(offsets[0]);
  object.maleCount = reader.readLongOrNull(offsets[1]);
  object.malePercentage = reader.readDoubleOrNull(offsets[2]);
  object.total = reader.readLongOrNull(offsets[3]);
  return object;
}

P _usersStatsEmbeddedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension UsersStatsEmbeddedQueryFilter
    on QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QFilterCondition> {
  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      femaleCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'femaleCount',
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      femaleCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'femaleCount',
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      femaleCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'femaleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      femaleCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'femaleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      femaleCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'femaleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      femaleCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'femaleCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      maleCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maleCount',
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      maleCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maleCount',
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      maleCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      maleCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      maleCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      maleCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maleCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      malePercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'malePercentage',
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      malePercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'malePercentage',
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      malePercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'malePercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      malePercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'malePercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      malePercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'malePercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      malePercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'malePercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      totalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      totalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      totalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QAfterFilterCondition>
      totalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UsersStatsEmbeddedQueryObject
    on QueryBuilder<UsersStatsEmbedded, UsersStatsEmbedded, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RecentTasksEmbeddedSchema = Schema(
  name: r'RecentTasksEmbedded',
  id: 8136877904894312794,
  properties: {
    r'assigneeName': PropertySchema(
      id: 0,
      name: r'assigneeName',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.string,
    ),
    r'statusName': PropertySchema(
      id: 2,
      name: r'statusName',
      type: IsarType.string,
    ),
    r'taskId': PropertySchema(
      id: 3,
      name: r'taskId',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _recentTasksEmbeddedEstimateSize,
  serialize: _recentTasksEmbeddedSerialize,
  deserialize: _recentTasksEmbeddedDeserialize,
  deserializeProp: _recentTasksEmbeddedDeserializeProp,
);

int _recentTasksEmbeddedEstimateSize(
  RecentTasksEmbedded object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assigneeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.statusName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _recentTasksEmbeddedSerialize(
  RecentTasksEmbedded object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assigneeName);
  writer.writeString(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.statusName);
  writer.writeLong(offsets[3], object.taskId);
  writer.writeString(offsets[4], object.title);
}

RecentTasksEmbedded _recentTasksEmbeddedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecentTasksEmbedded();
  object.assigneeName = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readStringOrNull(offsets[1]);
  object.statusName = reader.readStringOrNull(offsets[2]);
  object.taskId = reader.readLongOrNull(offsets[3]);
  object.title = reader.readStringOrNull(offsets[4]);
  return object;
}

P _recentTasksEmbeddedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RecentTasksEmbeddedQueryFilter on QueryBuilder<RecentTasksEmbedded,
    RecentTasksEmbedded, QFilterCondition> {
  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assigneeName',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assigneeName',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assigneeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assigneeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assigneeName',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      assigneeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assigneeName',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      createdAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'statusName',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'statusName',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusName',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      statusNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusName',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      taskIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taskId',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      taskIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taskId',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      taskIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      taskIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      taskIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      taskIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentTasksEmbedded, RecentTasksEmbedded, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension RecentTasksEmbeddedQueryObject on QueryBuilder<RecentTasksEmbedded,
    RecentTasksEmbedded, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RecentCasesEmbeddedSchema = Schema(
  name: r'RecentCasesEmbedded',
  id: 1480098113877562319,
  properties: {
    r'assigneeName': PropertySchema(
      id: 0,
      name: r'assigneeName',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.string,
    ),
    r'statusName': PropertySchema(
      id: 2,
      name: r'statusName',
      type: IsarType.string,
    ),
    r'taskId': PropertySchema(
      id: 3,
      name: r'taskId',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _recentCasesEmbeddedEstimateSize,
  serialize: _recentCasesEmbeddedSerialize,
  deserialize: _recentCasesEmbeddedDeserialize,
  deserializeProp: _recentCasesEmbeddedDeserializeProp,
);

int _recentCasesEmbeddedEstimateSize(
  RecentCasesEmbedded object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assigneeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.statusName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _recentCasesEmbeddedSerialize(
  RecentCasesEmbedded object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assigneeName);
  writer.writeString(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.statusName);
  writer.writeLong(offsets[3], object.taskId);
  writer.writeString(offsets[4], object.title);
}

RecentCasesEmbedded _recentCasesEmbeddedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecentCasesEmbedded();
  object.assigneeName = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readStringOrNull(offsets[1]);
  object.statusName = reader.readStringOrNull(offsets[2]);
  object.taskId = reader.readLongOrNull(offsets[3]);
  object.title = reader.readStringOrNull(offsets[4]);
  return object;
}

P _recentCasesEmbeddedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RecentCasesEmbeddedQueryFilter on QueryBuilder<RecentCasesEmbedded,
    RecentCasesEmbedded, QFilterCondition> {
  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assigneeName',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assigneeName',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assigneeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assigneeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assigneeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assigneeName',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      assigneeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assigneeName',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      createdAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'statusName',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'statusName',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusName',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      statusNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusName',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      taskIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taskId',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      taskIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taskId',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      taskIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      taskIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      taskIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      taskIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentCasesEmbedded, RecentCasesEmbedded, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension RecentCasesEmbeddedQueryObject on QueryBuilder<RecentCasesEmbedded,
    RecentCasesEmbedded, QFilterCondition> {}
