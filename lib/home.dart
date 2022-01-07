import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/api/apifunc.dart';
import 'package:weather_app/api/cache.dart';
import 'package:weather_app/api/function.dart';
import 'package:weather_app/custom_widget/hourinfocard.dart';
import 'package:weather_app/details.dart';

import 'custom_widget/weather_card.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);
  static const path = "Home";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: getdata("23.810331", "90.412521"),
            initialData: cache,
            builder: (context, snapshot) {
              Map<String, dynamic> data;
              if (snapshot.hasError) {
                data = cache;
                print(snapshot.error);
              } else {
                data = snapshot.data as Map<String, dynamic>;
              }
              return SingleChildScrollView(
                child: Container(
                  color: Color(0xffF1F0FA),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Dhaka",
                        style: TextStyle(
                          letterSpacing: 0.2,
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(gettime(DateTime.now())),
                      SizedBox(
                        height: 35,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(height: 400.0),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return weather_card(
                                time: getcombineddaymonth(DateTime.now()),
                                tempo: double.parse(
                                        data["current"]["temp"].toString())
                                    .toStringAsFixed(1),
                                descrip: data["current"]["weather"][0]
                                    ["description"],
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Container(
                        // width: 375,
                        // height: 295,
                        color: Color(0xff766CC1).withOpacity(0.35),
                        child: Column(
                          children: [
                            Transform.translate(
                              offset: Offset(0, -70),
                              child: Container(
                                height: 122,
                                width: 315,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                              "assets/carbon_humidity.png"),
                                          Text(
                                            "${data["current"]["humidity"]}%",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Humidity",
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset("assets/tabler_wind.png"),
                                          Text(
                                            "${data["current"]["wind_speed"]} km/h",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Wind",
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                              "assets/ion_speedometer.png"),
                                          Text(
                                            "${data["current"]["pressure"]}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Air Pressure",
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                              "assets/ic_round-visibility.png"),
                                          Text(
                                            "${data["current"]["visibility"] / 1000} km",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Visibility",
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Today",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, details.path,
                                          arguments: data);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Next 7 Days",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(Icons.arrow_forward_ios_rounded),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,

                                children: List.generate(
                                  24,
                                  (index) => hourinfocard(
                                    tempo: double.parse(data["hourly"][index]
                                                ["temp"]
                                            .toString())
                                        .toStringAsFixed(1),
                                    time: gettime(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            data["hourly"][index]["dt"] *
                                                1000)),
                                    primary: index == 0 ? true : false,
                                  ),
                                ),

                                // for(int i =0;i<=24;i++)
                                // hourinfocard(),
                              ),
                            ),
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   scrollDirection: Axis.horizontal,
                            //   itemCount: 7,
                            //   itemBuilder: (context, index) {
                            //     return hourinfocard();
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
