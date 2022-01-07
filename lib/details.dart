import 'package:flutter/material.dart';
import 'package:weather_app/api/function.dart';
import 'package:weather_app/custom_widget/weatherinfoofdaybyday.dart';

class details extends StatelessWidget {
  const details({Key? key}) : super(key: key);
  static const path = "details";
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff4B3EAE),
              Color(0xff766CC1),
              Color(0xff4B3EAE),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  //???
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Material(
                        color: Color(0xff4B3EAE).withOpacity(0.1), //???
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: [
                          Text(
                            "Today's Weather",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            getcombineddaymonth(DateTime.now()),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 165,
                  width: 315,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    // color: Color(0xff766CC1),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff766CC1),
                        Colors.white.withOpacity(0.2),
                        //Color(0xff766CC1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),

                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage("assets/moon_cloud_fast_wind.png"),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              double.parse((data["daily"][0]["temp"]["day"]
                                          .toString()))
                                      .toStringAsFixed(1) +
                                  "\u00B0",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              "Moon Cloud Fast Wind",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 207,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xffD1CDEA),
                      //color: Colors.red,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        //height: 207,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xffffffff),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Future Weather",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              Column(
                                children: List.generate(
                                  7,
                                  (index) => weatherinfoofdaybyday(
                                    tempo: data["daily"][index]["temp"]["day"]
                                        .toString(),
                                    day: getweekday(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            data["daily"][index]["dt"] * 1000)),
                                    date: getmonth(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            data["daily"][index]["dt"] * 1000)),
                                    divider: index < 6 ? true : false,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
