import 'dart:convert';
import 'package:http/http.dart' as http;
import 'location.dart';

class Networking {
  String url;
  double temp;
  int condition;
  String cityName;

  Location location = new Location();

  Networking({this.url});

  Future<void> getData() async {
    await location.getCurrentLocation();
    http.Response response = await http.get(url);
    // print("status code = ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.body);
      dynamic data = response.body;
      dynamic decodedData = jsonDecode(data);
      temp = decodedData["main"]["temp"];
      condition = decodedData["weather"][0]["id"];
      cityName = decodedData["name"];
    } else
      print(response.statusCode);
  }
}
