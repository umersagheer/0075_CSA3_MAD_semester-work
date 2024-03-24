import 'package:flutter/material.dart';
import 'package:semester_work/screen/home.dart';
import 'package:semester_work/screen/merit_calculator.dart';
import 'package:semester_work/screen/weather.dart';
import 'package:semester_work/utils/buil_header.dart';
import 'package:semester_work/utils/build_items.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildHeader(),
          buildItem(
              icon: Icons.home_rounded,
              title: 'Home',
              onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Home()),
                    )
                  }),
          buildItem(
              icon: Icons.calculate,
              title: 'Merit Calculator',
              onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const MeritCalculator()),
                    )
                  }),
          buildItem(
              icon: Icons.sunny_snowing,
              title: 'Weather',
              onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const WeatherScreen()),
                    )
                  }),
          buildItem(
              icon: Icons.settings,
              title: 'Setting',
              onTap: () => Navigator.pushNamed(context, 'Setting'))
        ],
      ),
    );
  }
}
