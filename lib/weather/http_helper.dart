import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:semester_work/weather/weather.dart';

class HTTPHelper {
  String domainName = "api.openweathermap.org";
  String path = "data/2.5/weather";
  String apiKey = "5b6d2399ec0b6db3dd3980504ee8ae89";
  String lat = "31.573152";
  String lon = "74.3078585";

  Future<Weather> getWeatherOfGCU() async {
    Map<String, dynamic> parameters = {"lat": lat, "lon": lon, "appid": apiKey};

    Uri apiURL = Uri.https(domainName, path, parameters);

    http.Response response = await http.get(apiURL);

    String responseString = response.body;
    Map<String, dynamic> data = json.decode(responseString);

    Weather obj = Weather.fromJson(data);

    return obj;
  }
}
