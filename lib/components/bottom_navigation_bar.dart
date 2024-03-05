import 'package:flutter/material.dart';
import 'package:semester_work/screen/home.dart';
import 'package:semester_work/screen/merit_calculator.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;

            index == 1
                ? {
                    Navigator.of(context).pop(),
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MeritCalculator()))
                  }
                : {
                    Navigator.of(context).pop(),
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Home()))
                  };
          });
        },
        items: [
          BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? Icons.calculate
                  : Icons.calculate_outlined),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 2 ? Icons.person : Icons.person_2_outlined),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? Icons.settings
                  : Icons.settings_outlined),
              label: ''),
        ]);
  }
}
