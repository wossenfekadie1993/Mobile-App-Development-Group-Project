import 'dart:html';

import 'package:students_voice/application/user/bloc/user_bloc.dart';
import 'package:students_voice/infrastructure/repository/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart';

class MockAuthenticationRepository extends Mock implements UserRepository {}

void main() {
  late UserRepository authenticationRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
  });

  test('initial state is userbloc', () {
    final userblocBloc = UserblocBloc();
    expect(userblocBloc.state, UserblocInitial());
  });

  group('Bloc test', () {
    blocTest<UserblocBloc, UserblocState>(
      'emits sample found for complaint',
      setUp: () {
        when(
          () => authenticationRepository.getSamplecomplaint(),
        ).thenAnswer((_) async {});
      },
      build: () => UserblocBloc(),
      act: (bloc) {
        bloc..add(GetSample());
      },
      expect: () => SampleFound(),
    );

    
    

  
  });
}