import 'package:isar/isar.dart';
import '../nav_model.dart';

part 'home_isar_model.g.dart';

@collection
class HomeIsarModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String?
      userId; // Adding a unique ID mostly for single user app or replace capability

  LegalCasesStatsEmbedded? legalCasesStats;
  TasksStatsEmbedded? tasksStats;
  UsersStatsEmbedded? usersStats;
  List<RecentTasksEmbedded>? recentTasks;
  List<RecentCasesEmbedded>? recentCases;

  HomeModel toEntity() {
    return HomeModel(
      legalCasesStats: legalCasesStats?.toEntity(),
      tasksStats: tasksStats?.toEntity(),
      usersStats: usersStats?.toEntity(),
      recentTasks: recentTasks?.map((e) => e.toEntity()).toList(),
      recentCases: recentCases?.map((e) => e.toEntity()).toList(),
    );
  }

  static HomeIsarModel fromEntity(HomeModel model,
      {String userId = 'currentUser'}) {
    return HomeIsarModel()
      ..userId = userId
      ..legalCasesStats = model.legalCasesStats != null
          ? LegalCasesStatsEmbedded.fromEntity(model.legalCasesStats!)
          : null
      ..tasksStats = model.tasksStats != null
          ? TasksStatsEmbedded.fromEntity(model.tasksStats!)
          : null
      ..usersStats = model.usersStats != null
          ? UsersStatsEmbedded.fromEntity(model.usersStats!)
          : null
      ..recentTasks = model.recentTasks
          ?.map((e) => RecentTasksEmbedded.fromEntity(e))
          .toList()
      ..recentCases = model.recentCases
          ?.map((e) => RecentCasesEmbedded.fromEntity(e))
          .toList();
  }
}

@embedded
class LegalCasesStatsEmbedded {
  int? total;
  double? completionRate;
  int? open;
  int? resolved;

  LegalCasesStats toEntity() => LegalCasesStats(
      total: total,
      completionRate: completionRate,
      open: open,
      resolved: resolved);

  static LegalCasesStatsEmbedded fromEntity(LegalCasesStats entity) =>
      LegalCasesStatsEmbedded()
        ..total = entity.total
        ..completionRate = entity.completionRate
        ..open = entity.open
        ..resolved = entity.resolved;
}

@embedded
class TasksStatsEmbedded {
  int? total;
  int? completedCount;
  double? completionRate;

  TasksStats toEntity() => TasksStats(
        total: total,
        completedCount: completedCount,
        completionRate: completionRate,
      );

  static TasksStatsEmbedded fromEntity(TasksStats entity) =>
      TasksStatsEmbedded()
        ..total = entity.total
        ..completedCount = entity.completedCount
        ..completionRate = entity.completionRate;
}

@embedded
class UsersStatsEmbedded {
  int? total;
  int? maleCount;
  int? femaleCount;
  double? malePercentage;

  UsersStats toEntity() => UsersStats(
        total: total,
        maleCount: maleCount,
        femaleCount: femaleCount,
        malePercentage: malePercentage,
      );

  static UsersStatsEmbedded fromEntity(UsersStats entity) =>
      UsersStatsEmbedded()
        ..total = entity.total
        ..maleCount = entity.maleCount
        ..femaleCount = entity.femaleCount
        ..malePercentage = entity.malePercentage;
}

@embedded
class RecentTasksEmbedded {
  int? taskId;
  String? title;
  String? assigneeName;
  String? statusName;
  String? createdAt;

  RecentTasks toEntity() => RecentTasks(
        taskId: taskId,
        title: title,
        assigneeName: assigneeName,
        statusName: statusName,
        createdAt: createdAt,
      );

  static RecentTasksEmbedded fromEntity(RecentTasks entity) =>
      RecentTasksEmbedded()
        ..taskId = entity.taskId
        ..title = entity.title
        ..assigneeName = entity.assigneeName
        ..statusName = entity.statusName
        ..createdAt = entity.createdAt;
}

@embedded
class RecentCasesEmbedded {
  int? taskId;
  String? title;
  String? assigneeName;
  String? statusName;
  String? createdAt;

  RecentCases toEntity() => RecentCases(
        taskId: taskId,
        title: title,
        assigneeName: assigneeName,
        statusName: statusName,
        createdAt: createdAt,
      );

  static RecentCasesEmbedded fromEntity(RecentCases entity) =>
      RecentCasesEmbedded()
        ..taskId = entity.taskId
        ..title = entity.title
        ..assigneeName = entity.assigneeName
        ..statusName = entity.statusName
        ..createdAt = entity.createdAt;
}
