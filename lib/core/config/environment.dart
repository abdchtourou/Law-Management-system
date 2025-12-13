import 'package:flutter/material.dart';

enum Environment {
  production('prod', 'production.env', 'LMS', null),
  development('dev', 'staging.env', 'LMS Dev', Colors.green),
  audit('aud', 'audit.env', 'LMS Audit', Colors.orange);

  const Environment(
    this.value,
    this.envFile,
    this.appName,
    this.bannerColor,
  );

  final String value;

  final String envFile;

  final String appName;

  final Color? bannerColor;

  bool get isProduction => this == Environment.production;

  @override
  String toString() => value;
}
