// bloc.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'manager_event.dart';

class AdminBloc extends Bloc<AdminEvent, List<String>> {
  AdminBloc() : super([]);

  @override
  Stream<List<String>> mapEventToState(AdminEvent event) async* {
    if (event is UpdateManagerEvent) {
    } else if (event is DeleteManagerEvent) {
    } else if (event is AddManagerEvent) {
    }

    yield state; // Return the updated list of managers
  }
}
