import 'package:flutter/foundation.dart';
import 'package:random_num_generator/domain/entities/random_number.dart';
import 'package:random_num_generator/domain/usecases/generate_random_number.dart';

class RandomNumberProvider extends ChangeNotifier {
  final GenerateRandomNumber generateRandomNumber;

  RandomNumberProvider(this.generateRandomNumber);

  RandomNumber? _result;
  bool _isLoading = false;
  String? _error;

  RandomNumber? get result => _result;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> generate(int min, int max) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _result = await generateRandomNumber(min, max);
      _error = null;
    } catch (e) {
      _error = 'Failed to generate random number: $e';
      _result = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearResult() {
    _result = null;
    _error = null;
    notifyListeners();
  }
}
