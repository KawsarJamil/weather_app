import 'package:flutter/material.dart';

class weather_card extends StatelessWidget {
  const weather_card({
    required this.time,
    required this.tempo,
    required this.descrip,
    Key? key,
  }) : super(key: key);
  final String time;
  final String tempo;
  final String descrip;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: 250,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 25,
            child: Container(
              width: 230,
              height: 274.94,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff4B3EAE),
                    Color(0xff766CC1),
                    Color(0xff4B3EAE),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff766CC1).withOpacity(0.8),
                    spreadRadius: 10,
                    blurRadius: 25,
                    offset: Offset(0, 15),
                  ),
                ],
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/moon_cloud_fast_wind.png",
                    scale: 1.5,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Text(
                        "$tempo°",
                        style: TextStyle(
                          fontSize: 62,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        descrip,
                        style: TextStyle(
                          // fontSize: 72,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            child: Container(
              height: 34,
              //width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    time,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
