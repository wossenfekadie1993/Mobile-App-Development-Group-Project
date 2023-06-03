part of 'announcement.dart';

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) => Announcement(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      author: json['author'] as dynamic,
      createdAt:json['date'] as DateTime,
      updatedAt:json['date'] as DateTime,
    );

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'createdAt':instance.createdAt,
      'updatedAt':instance.updatedAt,
      'author':instance.author,
    };

