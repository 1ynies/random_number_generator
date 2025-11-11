import 'package:random_num_generator/domain/entities/random_number.dart';
import 'package:random_num_generator/domain/repositories/random_number_repository.dart';

class GenerateRandomNumber {
  final RandomNumberRepository repository;

  GenerateRandomNumber(this.repository);

  Future<RandomNumber> call(int min, int max) async {
    return await repository.generate(min, max);
  }
}