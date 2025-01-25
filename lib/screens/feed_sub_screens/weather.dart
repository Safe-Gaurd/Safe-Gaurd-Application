import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:safegaurd/backend/models/weather.dart';
import 'package:safegaurd/screens/widgets/appbar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  // Async function to fetch weather data
  Future<void> fetchWeather() async {
    const String apiKey = "36b222ee5cc0a2ccd4163f903bf8b1f8";
    const String latitude = "16.5681";
    const String longitude = "81.815221";

    final Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final weather = WeatherModel.fromJson(json);

        // Debugging the weather data
        print(weather.maxTemperature);

        // Optional: Process or store the fetched data here
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      // Logging the error
      debugPrint("Error fetching weather data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        label: "Weather",
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchWeather,
          child: const Text("Fetch Weather"),
        ),
      ),
    );
  }
}
