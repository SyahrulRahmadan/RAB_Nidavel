import 'package:flutter/material.dart';

class PagesModel {
  final String title;
  final Widget body;

  PagesModel({
    required this.body,
    required this.title,
  });

  PagesModel copyWith({
    String? title,
    Widget? body,
  }) {
    return PagesModel(
      body: body ?? this.body,
      title: title ?? this.title,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagesModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          body.runtimeType == other.body.runtimeType;

  @override
  int get hashCode => title.hashCode ^ body.runtimeType.hashCode;

  @override
  String toString() => 'PagesModel(title: $title, body: ${body.runtimeType})';
}