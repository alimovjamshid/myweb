import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebsite/src/utils/constants.dart';
import 'package:mywebsite/src/widgets/projectCard.dart';

import '../../animations/entranceFader.dart';

class PortfolioMobileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      color: Colors.grey[200],
      child: Column(
        children: [
          SizedBox(
            height: height * 0.025,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EntranceFader(
                offset: Offset(-32,0),
                delay: Duration(seconds: 2),
                child: Container(
                  width: width * 0.85,
                  height: height * 0.25,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        "assets/c.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: width * 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "d".tr().toString(),
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: height * 0.06,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "m".tr().toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: height * 0.025
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
