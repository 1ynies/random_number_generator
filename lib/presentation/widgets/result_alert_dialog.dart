import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ResultAlertDialog extends StatefulWidget {
  final int result;
  final int min;
  final int max;

  const ResultAlertDialog({
    super.key,
    required this.result,
    required this.min,
    required this.max,
  });

  @override
  State<ResultAlertDialog> createState() => _ResultAlertDialogState();
}

class _ResultAlertDialogState extends State<ResultAlertDialog> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    // Start confetti animation when dialog opens
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AlertDialog(
          title: Text(
            '🎉 Success!',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'The random number between ${widget.min} and ${widget.max} is:',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepPurple.shade300),
                ),
                child: Text(
                  '${widget.result}',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
        // Confetti widget
        ConfettiWidget(
          confettiController: _confettiController,
          blastDirection: 3.14 / 2, // radians - down
          emissionFrequency: 0.05,
          numberOfParticles: 30,
          gravity: 0.1,
          shouldLoop: false,
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple,
            Colors.red,
            Colors.yellow,
          ],
        ),
      ],
    );
  }
}
