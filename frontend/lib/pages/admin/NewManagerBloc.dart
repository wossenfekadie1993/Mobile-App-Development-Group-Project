import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'NewManagerEvent.dart';
import 'NewManagerState.dart';
class NewManagerBloc extends Bloc<NewManagerEvent, NewManagerState> {
  NewManagerBloc() : super(NewManagerInitialState());

  @override
  Stream<NewManagerState> mapEventToState(NewManagerEvent event) async* {
    if (event is AddManagerEvent) {
      yield NewManagerLoadingState();

      try {
        // Add your logic here to handle manager creation

        // Simulate an asynchronous operation
        await Future.delayed(Duration(seconds: 2));

        yield NewManagerSuccessState();
      } catch (e) {
        yield NewManagerErrorState(e.toString());
      }
    }
  }
}