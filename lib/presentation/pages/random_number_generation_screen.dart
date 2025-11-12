import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_num_generator/presentation/providers/Input_provider.dart';
import 'package:random_num_generator/presentation/providers/random_number_provider.dart';
import 'package:random_num_generator/presentation/widgets/Input_widget.dart';
import 'package:random_num_generator/presentation/widgets/generate_button_widget.dart';
import 'package:random_num_generator/presentation/widgets/result_alert_dialog.dart';

class RandomNumberGenerationScreen extends StatelessWidget {
  const RandomNumberGenerationScreen({super.key});

  void _generateRandomNumber(BuildContext context) async {
    final inputProvider = Provider.of<InputProvider>(context, listen: false);
    final randomNumberProvider = Provider.of<RandomNumberProvider>(
      context,
      listen: false,
    );

    // Validate inputs
    final validationError = inputProvider.getValidationError();
    if (validationError != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(validationError)));
      return;
    }

    // Get min and max values
    final min = inputProvider.getMinValueAsInt()!;
    final max = inputProvider.getMaxValueAsInt()!;

    // Generate random number
    await randomNumberProvider.generate(min, max);

    // Check for errors
    if (randomNumberProvider.error != null) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(randomNumberProvider.error!)));
      }
      return;
    }

    // Show result dialog with confetti
    if (randomNumberProvider.result != null && context.mounted) {
      showDialog(
        context: context,
        builder: (context) => ResultAlertDialog(
          result: randomNumberProvider.result!.value,
          min: min,
          max: max,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);
    final randomNumberProvider = Provider.of<RandomNumberProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Random Number Generator")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter Range',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            InputWidget(
              labelText: 'Minimum Value',
              onChanged: (value) => inputProvider.updateMinValue(value),
            ),
            const SizedBox(height: 16),
            InputWidget(
              labelText: 'Maximum Value',
              onChanged: (value) => inputProvider.updateMaxValue(value),
            ),
            const SizedBox(height: 32),
            randomNumberProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : GenerateButtonWidget(
                    text: 'Generate Random Number',
                    onPressed: () => _generateRandomNumber(context),
                  ),
          ],
        ),
      ),
    );
  }
}
