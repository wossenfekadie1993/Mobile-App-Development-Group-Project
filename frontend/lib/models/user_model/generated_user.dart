// GENERATED CODE - DO NOT MODIFY BY HAND

import 'user.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['_id'] as String,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.userId,
      'fullname': instance.fullname,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
    
    };