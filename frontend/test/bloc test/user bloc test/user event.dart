import 'package:students_voice/application/user/bloc/user_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('userblocevent', () {
    group('Userbloc', () {
      test('supports value equality', () {
        expect(UserblocBloc().state, UserblocInitial());
      });
    });
  });
}