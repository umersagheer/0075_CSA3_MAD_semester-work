import 'package:flutter/material.dart';
import 'package:semester_work/components/bottom_navigation_bar.dart';

class MeritCalculator extends StatelessWidget {
  const MeritCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(146, 33, 33, 1),
        title: const Text("Merit Calculator"),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Merit Screen")]),
    );
  }
}
