import 'package:students_voice/application/manager/bloc/manager_bloc.dart';
import 'package:students_voice/infrastructure/repository/manager_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart';

class MockAuthenticationRepository extends Mock implements ManagerRepository {}

void main() {
  late ManagerRepository authenticationRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
  });

  test('initial state is userbloc', () {
    final userblocBloc = managerblocBloc();
    expect(userblocBloc.state, managerblocBloc());
  });

  group('Bloc test', () {
    blocTest<managerblocBloc, managerblocState>(
      'emits sample found for complaint',
      setUp: () {
        when(
          () => authenticationRepository.getReportedcomplaints("id"),
        ).thenAnswer((_) async {});
      },
      build: () => managerblocBloc(),
      act: (bloc) {
        bloc..add(GetOngoing("id"));
      },
      expect: () => GetReportedSucessful(complaintList: null),
    );

    blocTest<managerblocBloc, managerblocState>(
      'select station',
      setUp: () {
        when(
          () => authenticationRepository.getSolvedcomplaints('user'),
        ).thenAnswer((_) async {});
      },
      build: () => managerblocBloc(),
      act: (bloc) {
        ManagerRepository myrepo = ManagerRepository();
        dynamic solved = myrepo.getSolvedcomplaints('user');
        bloc.add(GetSolved(solved));
      },
      expect: () => GetSolvedSucessful(complaintList: null),
    );

    blocTest<managerblocBloc, managerblocState>(
      'select station',
      setUp: () {
        when(
          () => authenticationRepository.getOngoingcomplaints("id"),
        ).thenAnswer((_) async {});
      },
      build: () => managerblocBloc(),
      act: (bloc) {
        bloc..add(GetOngoing("id"));
      },
      expect: () => GetOngoingSucessful(complaintList: null),
    );
  });
}