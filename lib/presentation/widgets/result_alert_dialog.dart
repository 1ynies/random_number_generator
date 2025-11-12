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
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            '🎉 Success!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'The random number between ${widget.min} and ${widget.max} is:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.indigo.shade300),
                ),
                child: Text(
                  '${widget.result}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Close',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
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
