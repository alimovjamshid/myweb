import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebsite/src/animations/bottomAnimation.dart';
import 'package:mywebsite/src/utils/constants.dart';
import 'package:mywebsite/src/widgets/projectCard.dart';

class ContactDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        children: [
          Text(
            "\nMe Contacter",
            style: GoogleFonts.montserrat(
              fontSize: height * 0.06,
              fontWeight: FontWeight.w100,
              letterSpacing: 1.0,
            ),
          ),
          Text(
            "Prenons contact et construisons quelque chose ensemble :)\n\n",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetAnimator(
                child: ProjectCard(
                  cardWidth: width < 1200 ? width * 0.25 : width * 0.2,
                  cardHeight: width < 1200 ? height * 0.28 : height * 0.25,
                  projectIconData: kContactIcons[0],
                  projectTitle: "e".tr().toString(),
                  projectDescription: "p".tr().toString(),
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              WidgetAnimator(
                child: ProjectCard(
                  cardWidth: width < 1200 ? width * 0.25 : width * 0.2,
                  cardHeight: width < 1200 ? height * 0.28 : height * 0.25,
                  projectIconData: kContactIcons[1],
                  projectTitle: "n".tr().toString(),
                  projectDescription: kContactDetails[1],
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              WidgetAnimator(
                child: ProjectCard(
                  cardWidth: width < 1200 ? width * 0.25 : width * 0.2,
                  cardHeight: width < 1200 ? height * 0.28 : height * 0.25,
                  projectIconData: kContactIcons[2],
                  projectTitle: "o".tr().toString(),
                  projectDescription: kContactDetails[2],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
