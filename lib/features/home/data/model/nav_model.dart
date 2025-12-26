import 'package:flutter/cupertino.dart';

class NavModel{
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavModel({required this.page, required this.navKey});



}
class HomeModel {
  LegalCasesStats? legalCasesStats;
  TasksStats? tasksStats;
  UsersStats? usersStats;
  List<RecentTasks>? recentTasks;

  HomeModel(
      {this.legalCasesStats,
        this.tasksStats,
        this.usersStats,
        this.recentTasks});

  HomeModel.fromJson(Map<String, dynamic> json) {
    legalCasesStats = json['legal_cases_stats'] != null
        ? LegalCasesStats.fromJson(json['legal_cases_stats'])
        : null;
    tasksStats = json['tasks_stats'] != null
        ? TasksStats.fromJson(json['tasks_stats'])
        : null;
    usersStats = json['users_stats'] != null
        ? UsersStats.fromJson(json['users_stats'])
        : null;
    if (json['recent_tasks'] != null) {
      recentTasks = <RecentTasks>[];
      json['recent_tasks'].forEach((v) {
        recentTasks!.add(RecentTasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (legalCasesStats != null) {
      data['legal_cases_stats'] = legalCasesStats!.toJson();
    }
    if (tasksStats != null) {
      data['tasks_stats'] = tasksStats!.toJson();
    }
    if (usersStats != null) {
      data['users_stats'] = usersStats!.toJson();
    }
    if (recentTasks != null) {
      data['recent_tasks'] = recentTasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LegalCasesStats {
  int? total;
  int? completionRate;

  LegalCasesStats({this.total, this.completionRate});

  LegalCasesStats.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    completionRate = json['completion_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['completion_rate'] = completionRate;
    return data;
  }
}

class TasksStats {
  int? total;
  double? completedCount;
  double? completionRate;

  TasksStats({this.total, this.completedCount, this.completionRate});

  TasksStats.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    completedCount = json['completed_count'];
    completionRate = json['completion_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['completed_count'] = completedCount;
    data['completion_rate'] = completionRate;
    return data;
  }
}

class UsersStats {
  int? total;
  int? maleCount;
  int? femaleCount;
  double? malePercentage;

  UsersStats(
      {this.total, this.maleCount, this.femaleCount, this.malePercentage});

  UsersStats.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    maleCount = json['male_count'];
    femaleCount = json['female_count'];
    malePercentage = json['male_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['male_count'] = maleCount;
    data['female_count'] = femaleCount;
    data['male_percentage'] = malePercentage;
    return data;
  }
}

class RecentTasks {
  int? taskId;
  String? title;
  String? assigneeName;
  String? statusName;
  String? createdAt;

  RecentTasks(
      {this.taskId,
        this.title,
        this.assigneeName,
        this.statusName,
        this.createdAt});

  RecentTasks.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    title = json['title'];
    assigneeName = json['assignee_name'];
    statusName = json['status_name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['task_id'] = taskId;
    data['title'] = title;
    data['assignee_name'] = assigneeName;
    data['status_name'] = statusName;
    data['created_at'] = createdAt;
    return data;
  }
}
