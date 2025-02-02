import 'package:flutter/material.dart';

void main() {
  runApp(const CSTech());
}

class CSTech extends StatelessWidget {
  const CSTech({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneAuth(),
    );
  }
}

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.amber,
    );
  }
}
