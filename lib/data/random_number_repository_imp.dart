import 'dart:math';

import 'package:random_num_generator/domain/entities/random_number.dart';
import 'package:random_num_generator/domain/repositories/random_number_repository.dart';

class RandomNumberRepositoryImpl implements RandomNumberRepository {
  @override
  Future<RandomNumber> generate(int min, int max) async {
    await Future.delayed(Duration(milliseconds: 500));  // Simulate delay
    final random = Random();
    final value = min + random.nextInt(max - min + 1);
    return RandomNumber(value);
  }
}