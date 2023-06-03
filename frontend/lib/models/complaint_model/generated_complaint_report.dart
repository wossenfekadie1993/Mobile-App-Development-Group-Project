// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      complaintId: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,

      reporter: User.fromJson(json['reporter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      '_id': instance.complaintId,
      'title': instance.title,
      'description': instance.description,
       'status':instance.status,
      'reporter': instance.reporter.toJson(),
    };