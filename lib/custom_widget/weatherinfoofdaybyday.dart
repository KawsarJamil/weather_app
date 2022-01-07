import 'package:flutter/material.dart';

class weatherinfoofdaybyday extends StatelessWidget {
  const weatherinfoofdaybyday({
    required this.date,
    required this.day,
    required this.tempo,
    this.divider = false,
    Key? key,
  }) : super(key: key);
  final bool divider;
  final String tempo;
  final String day;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/sun_cloud_mid_rain.png"),
              Row(
                children: [
                  Text(
                    double.parse(tempo).toStringAsFixed(1) + "\u00B0",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        day,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          divider == true
              ? Divider(
                  color: Colors.grey,
                  endIndent: 15,
                  indent: 15,
                  //height: 2,
                  thickness: 1,
                )
              : Container(
                  height: 0,
                  width: 0,
                ),
        ],
      ),
    );
  }
}
