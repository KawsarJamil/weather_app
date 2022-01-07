import 'package:flutter/material.dart';
import 'package:weather_app/details.dart';
import 'package:weather_app/home.dart';

void main() {
  runApp(
    Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      //home: details(),
      initialRoute: home.path,
      routes: {
        home.path:(context)=>home(),
        details.path:(context)=>details(),
      },
    );
  }
}
