import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking {
  String url;
  dynamic decodedData;
  Networking({this.url});

  Future<void> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic data = response.body;
      decodedData = jsonDecode(data);
    } else
      print(response.statusCode);
  }
}
