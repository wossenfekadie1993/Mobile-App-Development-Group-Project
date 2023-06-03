// State
abstract class NewManagerState {}

class NewManagerInitialState extends NewManagerState {}

class NewManagerLoadingState extends NewManagerState {}

class NewManagerSuccessState extends NewManagerState {}

class NewManagerErrorState extends NewManagerState {
  final String errorMessage;

  NewManagerErrorState(this.errorMessage);
}