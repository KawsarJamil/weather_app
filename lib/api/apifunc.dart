import 'dart:convert';

import 'key.dart';
import 'package:http/http.dart';

Future<Map<String, dynamic>> getdata(String lat, String long) async {
  final Response response = await get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&exclude=minutely,alerts&appid=$apikey&units=metric"));
  Map<String, dynamic> ret = {};
  if (response.statusCode == 200) {
    ret = json.decode(response.body);
  }
  //print(json.encode(ret));
  return ret;
}
