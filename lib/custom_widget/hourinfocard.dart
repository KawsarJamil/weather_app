import 'package:flutter/material.dart';
import 'package:weather_app/api/cache.dart';
import 'package:weather_app/api/function.dart';

class hourinfocard extends StatelessWidget {
  const hourinfocard({
    this.primary = false,
    required this.tempo,
    required this.time,
    Key? key,
  }) : super(key: key);
  final bool primary;
  final String time;
  final String tempo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        width: 92,
        height: 132,
        decoration: BoxDecoration(
            color: primary ? null : Colors.white,
            gradient: primary
                ? const LinearGradient(colors: [
                    Color(0xff4B3EAE),
                    Color(0xff766CC1),
                    Color(0xff4B3EAE),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                : null,
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //DateTime.fromMillisecondsSinceEpoch(cache["hourly"][i]["dt"])
              time,
              //"6.00 AM",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: primary ? Colors.white : Colors.black),
            ),
            Image.asset(
              "assets/moon_cloud_fast_wind.png",
              scale: 4,
            ),
            Text(
              tempo,
              style: TextStyle(
                  fontSize: 18,
                  color: primary ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
