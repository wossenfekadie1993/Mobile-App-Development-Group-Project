
import 'admin_register_manager.dart';
AddmanagerDomainRequest _$AddmanagerDomainRequestFromJson(Map<String, dynamic> json) {
  return AddmanagerDomainRequest(
    username: json['username'] as String,
    name: json['name'] as String,
    password: json['password'] as String,
    roles: json['roles'] as String,
  );
}

Map<String, dynamic> _$AddmanagerDomainRequestToJson(AddmanagerDomainRequest instance) => <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'password': instance.password,
      'roles': instance.roles,
    };
