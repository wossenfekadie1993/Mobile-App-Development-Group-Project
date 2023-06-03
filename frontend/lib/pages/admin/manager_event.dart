import 'package:equatable/equatable.dart';

abstract class AdminEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateManagerEvent extends AdminEvent {
  final String managerName;

  UpdateManagerEvent(this.managerName);

  @override
  List<Object?> get props => [managerName];
}

class DeleteManagerEvent extends AdminEvent {
  final String managerName;

  DeleteManagerEvent(this.managerName);

  @override
  List<Object?> get props => [managerName];
}

class AddManagerEvent extends AdminEvent {
  final String managerName;

  AddManagerEvent(this.managerName);

  @override
  List<Object?> get props => [managerName];
}
