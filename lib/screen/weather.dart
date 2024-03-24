import 'package:flutter/material.dart';
import 'package:semester_work/components/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:semester_work/weather/http_helper.dart';
import 'package:semester_work/weather/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherStateScreen();
}

class _WeatherStateScreen extends State<WeatherScreen> {
  HTTPHelper httpHelper = HTTPHelper();
  String weatherInfo = "";
  Weather weatherData = Weather(0, 0, 0, "", 0, "");

  @override
  void initState() {
    super.initState();

    httpHelper.getWeatherOfGCU().then((weatherObj) {
      weatherData = weatherObj;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 146, 33, 33),
        title: const Text("Weather",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      drawer: const DrawerMenu(),
      body: Expanded(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(
                  'vectors/weather_app.svg',
                  width: 100,
                  height: 100,
                ),
              ),
            ]),
            const SizedBox(
              height: 30.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Weather",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            WeatherRow(
                icon: Icons.thermostat,
                label: "Temperature",
                value: weatherData.temperature.toStringAsFixed(3)),
            const SizedBox(
              height: 10.0,
            ),
            WeatherRow(
                icon: Icons.description_outlined,
                label: "Description",
                value: weatherData.description),
            const SizedBox(
              height: 10.0,
            ),
            WeatherRow(
                icon: Icons.cloud,
                label: "Clouds",
                value: weatherData.cloudCover.toStringAsFixed(3)),
            const SizedBox(
              height: 10.0,
            ),
            WeatherRow(
                icon: Icons.wind_power_outlined,
                label: "Wind Speed",
                value: weatherData.windSpeed.toStringAsFixed(3)),
            const SizedBox(
              height: 10.0,
            ),
            WeatherRow(
                icon: Icons.water_drop_outlined,
                label: "Humidity",
                value: weatherData.humidity.toStringAsFixed(3)),
            const SizedBox(
              height: 10.0,
            ),
            WeatherRow(
                icon: Icons.location_city_outlined,
                label: "City Name",
                value: weatherData.cityName),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherRow extends StatelessWidget {
  const WeatherRow({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Icon(
            icon,
            size: 25,
            color: const Color.fromARGB(255, 146, 33, 33),
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 146, 33, 33),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(200, 146, 33, 33)),
          ),
        ),
      ],
    );
  }
}
