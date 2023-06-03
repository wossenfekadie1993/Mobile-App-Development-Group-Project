import 'package:equatable/equatable.dart';
abstract class NewManagerEvent {}

class AddManagerEvent extends NewManagerEvent {
  final String name;
  final String phoneNumber;
  final String emailAddress;
  final String password;

  AddManagerEvent({
    required this.name,
    required this.phoneNumber,
    required this.emailAddress,
    required this.password,
  });
}