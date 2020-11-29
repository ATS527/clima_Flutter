import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/main.dart';

class WeatherModel {
  dynamic weatherData;

  Future<void> getCurrentLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    //new class for http requests
    Networking networkHelper = new Networking(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=${location.lattitude}&lon=${location.longitude}&appid=8fe38362917ee57e0dca1282c8a8ef47&units=metric');
    await networkHelper.getData(); //getting data
    weatherData = networkHelper.decodedData;
    print(location.lattitude);
    print(location.longitude);
    assignValues();
  }

  void assignValues() {
    temperature = weatherData["main"]["temp"];
    locationCity = weatherData["name"];
    condition = weatherData["weather"][0]["id"];
  }

  String getWeatherIcon() {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (temperature > 25) {
      return 'It\'s 🍦 time';
    } else if (temperature > 20) {
      return 'Time for shorts and 👕';
    } else if (temperature < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
