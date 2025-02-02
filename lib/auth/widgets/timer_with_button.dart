import 'dart:async';
import 'package:flutter/material.dart';

class TimerWithButton extends StatefulWidget {
  const TimerWithButton({super.key});

  @override
  State<TimerWithButton> createState() => _TimerWithButtonState();
}

class _TimerWithButtonState extends State<TimerWithButton> {
  late Timer _timer;
  int _remainingSeconds = 120;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _isButtonEnabled = true;
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          _formatTime(_remainingSeconds),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 16),
        TextButton(
          onPressed: _isButtonEnabled
              ? () {
                  setState(() {
                    _remainingSeconds = 120;
                    _isButtonEnabled = false;
                    _startTimer();
                  });
                }
              : null,
          child: const Text("Send Again"),
        ),
      ],
    );
  }
}
