import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebsite/src/animations/entranceFader.dart';
import 'package:mywebsite/src/sections/navBar/navBarLogo.dart';
import 'package:mywebsite/src/utils/constants.dart';
import 'package:mywebsite/src/widgets/aboutMeText.dart';
import 'package:mywebsite/src/widgets/communityIconBtn.dart';
import 'package:mywebsite/src/widgets/toolsTech.dart';

class AboutDesktop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height * 0.9,
      color: Colors.grey[200],
      child: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EntranceFader(
                offset: Offset(-32,0),
                delay: Duration(seconds: 2),
                child: Container(
                  width: width * 0.25,
                  height: height * 0.45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                          "assets/a.jpg",
                          fit: BoxFit.cover,
                      )),
                ),
              ),
              Container(
                width: width * 0.6,
                height: height * 0.75,
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
                          "b".tr().toString(),
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: height * 0.06,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "k".tr().toString(),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
