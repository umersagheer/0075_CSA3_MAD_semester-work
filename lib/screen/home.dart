import 'package:flutter/material.dart';
// import 'package:semester_work/components/bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:semester_work/components/drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(146, 33, 33, 1),
        title: const Text(
          "GCU Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const DrawerMenu(),
      // bottomNavigationBar: const BottomNavigation(),
      body: Expanded(
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to GCU",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'vectors/home.svg',
                  width: 250,
                  height: 250,
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
