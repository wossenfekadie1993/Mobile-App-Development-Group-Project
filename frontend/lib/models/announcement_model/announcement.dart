// import 'dart:convert';
import 'package:students_voice/models/user_model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated_announcement.dart';

@JsonSerializable(explicitToJson: true)
class Announcement {
  @JsonKey(name: "_id")
  String id;
  String title;
  String description;
  User author;
  DateTime createdAt;
  DateTime updatedAt;

  
  Announcement({
  required this.id,
  required this.title,
  required this.description,
  required this.author,
  required DateTime createdAt,
  required DateTime updatedAt,
})  : createdAt = createdAt,
      updatedAt = updatedAt;

  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);

  get reporter => null;
  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);
}
