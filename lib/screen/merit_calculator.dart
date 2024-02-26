import 'package:flutter/material.dart';

class MeritCalculator extends StatelessWidget {
  const MeritCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(146, 33, 33, 1),
        title: const Text("Merit Calculator"),
      ),
      body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Merit Screen")]),
    );
  }
}
