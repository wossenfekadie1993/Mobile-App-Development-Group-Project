import 'package:students_voice/application/user/bloc/user_bloc.dart';
import 'package:students_voice/infrastructure/repository/user_repo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UserRepository userRepository;
  group('userbloc', () {
    test('supports value comparisons', () {
      expect(UserblocInitial(), UserblocInitial());
    });

    test("returns same object when no properties are passed", () {
      expect(UserblocInitial().props, []);
    });

  });
}