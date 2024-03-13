import 'package:flutter/material.dart';
import 'package:semester_work/components/drawer.dart';

class MeritCalculator extends StatefulWidget {
  const MeritCalculator({super.key});

  @override
  State<MeritCalculator> createState() => _MeritCalculatorState();
}

class _MeritCalculatorState extends State<MeritCalculator> {
  bool isInterSelected = true;
  bool isOLevelSelected = false;
  String labelForInterOLev = '';
  String computedMerit = '';

  final interOLevelController = TextEditingController();
  final entryTestController = TextEditingController();
  late List<bool> isSelectedFlags;

  @override
  void initState() {
    isSelectedFlags = [isInterSelected, isOLevelSelected];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isInterSelected) {
      labelForInterOLev = "Intermediate Marks";
    } else {
      labelForInterOLev = "O-Level Percentage";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(146, 33, 33, 1),
        title: const Text("Merit Calculator"),
      ),
      drawer: const DrawerMenu(),
      // bottomNavigationBar: const BottomNavigation(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(5.0),
                  isSelected: isSelectedFlags,
                  onPressed: (index) {
                    switch (index) {
                      case 0:
                        isInterSelected = true;
                        isOLevelSelected = false;
                        break;
                      case 1:
                        isInterSelected = false;
                        isOLevelSelected = true;
                      default:
                    }

                    setState(() {
                      isSelectedFlags = [isInterSelected, isOLevelSelected];
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Intermediate"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("O-Level"),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: interOLevelController,
              decoration: InputDecoration(
                labelText: labelForInterOLev,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: entryTestController,
              decoration: const InputDecoration(
                labelText: "Entry Test Marks",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: onMeritButtonPress,
              child: const Text("Calculate"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              computedMerit,
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void onMeritButtonPress() {
    double merit = 0;
    if (isInterSelected) {
      double interMarks = double.tryParse(interOLevelController.text) ?? 0;
      double entryTest = double.tryParse(entryTestController.text) ?? 0;

      merit = (((interMarks / 1100) * .6) + ((entryTest / 30) * .4)) * 100.0;
    } else {
      double olevelPercentage =
          double.tryParse(interOLevelController.text) ?? 0;
      double entryTest = double.tryParse(entryTestController.text) ?? 0;

      merit =
          (((olevelPercentage / 100) * .6) + ((entryTest / 30) * .4)) * 100.0;
    }

    setState(() {
      computedMerit = "Merit Score: ${merit.toStringAsFixed(3)}";
    });
  }
}
