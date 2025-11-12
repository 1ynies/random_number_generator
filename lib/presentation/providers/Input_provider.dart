import 'package:flutter/foundation.dart';

class InputProvider extends ChangeNotifier {
  String _minValue = '';
  String _maxValue = '';

  String get minValue => _minValue;
  String get maxValue => _maxValue;

  void updateMinValue(String newValue) {
    _minValue = newValue;
    notifyListeners();
  }

  void updateMaxValue(String newValue) {
    _maxValue = newValue;
    notifyListeners();
  }

  bool isValid() {
    if (_minValue.isEmpty || _maxValue.isEmpty) {
      return false;
    }

    final min = int.tryParse(_minValue);
    final max = int.tryParse(_maxValue);

    if (min == null || max == null) {
      return false;
    }

    return min < max;
  }

  int? getMinValueAsInt() {
    return int.tryParse(_minValue);
  }

  int? getMaxValueAsInt() {
    return int.tryParse(_maxValue);
  }

  String? getValidationError() {
    if (_minValue.isEmpty || _maxValue.isEmpty) {
      return 'Please enter both minimum and maximum values';
    }

    final min = int.tryParse(_minValue);
    final max = int.tryParse(_maxValue);

    if (min == null || max == null) {
      return 'Please enter valid numbers';
    }

    if (min >= max) {
      return 'Minimum value must be less than maximum value';
    }

    return null;
  }
}
