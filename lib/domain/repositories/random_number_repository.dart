import 'package:random_num_generator/domain/entities/random_number.dart';

abstract class RandomNumberRepository {
  Future<RandomNumber> generate(int min, int max);
}