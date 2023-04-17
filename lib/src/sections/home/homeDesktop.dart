// ignore_for_file: deprecated_member_use

import 'package:http/http.dart' as http;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mywebsite/src/animations/bottomAnimation.dart';
import 'package:mywebsite/src/animations/entranceFader.dart';
import 'package:mywebsite/src/utils/constants.dart';
import 'package:mywebsite/src/widgets/socialMediaIcon.dart';

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final TextEditingController _controllerName = new TextEditingController();
    final TextEditingController _controllerPhone = new TextEditingController();
    final TextEditingController _controllerMessage = new TextEditingController();

    Future<void> _sendEmail(String text,String phone, String name) async{
      try{
        var userEmail = "testingprogram101@gmail.com";
        var email = "jamshidalimov3464@gmail.com";
        var message = Message();
        message.subject = name;
        message.text = "$phone\n\n" + text;
        message.from = Address(email.toString());
        message.recipients.add(email);

        var smtpServer = gmailSaslXoauth2(email, "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");
        send(message, smtpServer);
        print("Succes");
      }
      catch(e){
        print("xato");
      }
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            // backgroundColor: Colors.white,
            title: Text("v".tr().toString()),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _controllerName,
                    decoration: InputDecoration(
                      labelText: 'r'.tr().toString(),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _controllerPhone,
                    decoration: InputDecoration(
                      labelText: 's'.tr().toString(),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _controllerMessage,
                    decoration: InputDecoration(
                      labelText: 't'.tr().toString(),
                      border: const OutlineInputBorder(),
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                  debugPrint(_controllerName.text.toString());
                },
                child: Text("w".tr().toString()),
              ),
              MaterialButton(
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                  debugPrint(_controllerName.text.toString());
                  _sendEmail(_controllerMessage.text, _controllerPhone.text, _controllerName.text);
                },
                child: Text("u".tr().toString()),
              )
            ],
          );
        },
      );
    }

    return Container(
      height: height * 0.9,
      width: width,
      child: Stack(
        children: [
          Container(
              child: ImageSlideshow(
            disableUserScrolling: true,
            width: width,
            height: height * 0.9,
            initialPage: 0,
            indicatorColor: Colors.blue,
            indicatorBackgroundColor: Colors.grey,
            indicatorRadius: 5,
            children: [
              Image.asset(
                "assets/a.jpg",
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/b.jpg",
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/c.jpg",
                fit: BoxFit.cover,
              ),
              // Image.asset("assets/d.jpg",
              //   fit: BoxFit.cover,),
              // Image.asset("assets/e.jpg",
              //   fit: BoxFit.cover,),
            ],
            autoPlayInterval: 10000,
            isLoop: true,
          )),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EntranceFader(
                      offset: Offset(0.0, -32.0),
                      delay: Duration(seconds: 2),
                      duration: Duration(milliseconds: 800),
                      child: Image.asset(
                        "assets/4.png",
                        height: height * 0.4,
                      ),
                    ),
                    EntranceFader(
                      offset: Offset(0.0, -32.0),
                      delay: Duration(seconds: 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: height * 0.035,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Column(
                            children: [
                              Text(
                                "e".tr().toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: height * 0.02,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.025,
                              ),
                              Text(
                                "f".tr().toString(),
                                style: TextStyle(
                                    fontSize: height * 0.025,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: width * 0.015,
                          ),
                          Icon(
                            Icons.call,
                            size: height * 0.035,
                          ),
                          SizedBox(
                            width: height * 0.01,
                          ),
                          Column(
                            children: [
                              Text(
                                "g".tr().toString(),
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                height: height * 0.025,
                              ),
                              Text(
                                "+99899 519 80 88",
                                style: TextStyle(
                                    fontSize: height * 0.025,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: width * 0.015,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    EntranceFader(
                      offset: Offset(-32.0, 0.0),
                      child: Container(
                        width: width * 0.15,
                        child: MaterialButton(
                          color: kPrimaryColor,
                          disabledElevation: width,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          elevation: 100.0,
                          hoverElevation: 50,
                          animationDuration: Duration(milliseconds: 1000),
                          hoverColor: Colors.deepPurple,
                          height: height * 0.1,
                          enableFeedback: false,
                          onPressed: () => {_showMyDialog()},
                          autofocus: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications_active_sharp,
                                size: height * 0.035,
                              ),
                              SizedBox(
                                width: height * 0.01,
                              ),
                              Text(
                                "a".tr().toString(),
                                style: TextStyle(fontSize: height * 0.02),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    EntranceFader(
                      offset: Offset(-10, 0),
                      delay: Duration(seconds: 1),
                      duration: Duration(milliseconds: 800),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: kPrimaryColor,
                          ),
                          TyperAnimatedTextKit(
                              isRepeatingAnimation: true,
                              speed: Duration(milliseconds: 80),
                              textStyle: GoogleFonts.montserrat(
                                  fontSize: height * 0.1,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w300),
                              text: [
                                "b".tr().toString(),
                                "c".tr().toString(),
                                "d".tr().toString(),
                              ]),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, height * 0.05, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (int i = 0; i < kSocialIcons.length; i++)
                        WidgetAnimator(
                          child: SocialMediaIconBtn(
                            icon: kSocialIcons[i],
                            socialLink: kSocialLinks[i],
                            height: height * 0.035,
                            horizontalPadding: width * 0.005,
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: height * 0.1, top: height * 0.075),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => {context.locale = Locale('en', 'UZ')},
                    icon: Image.asset(
                      "assets/uz.png",
                      height: height * 0.04,
                      width: width * 0.04,
                    )),
                IconButton(
                    onPressed: () => {context.locale = Locale('en', 'RU')},
                    icon: Image.asset(
                      "assets/ru.png",
                      height: height * 0.04,
                      width: width * 0.04,
                    )),
                IconButton(
                    onPressed: () => {context.locale = Locale('en', 'US')},
                    icon: Image.asset(
                      "assets/us.png",
                      height: height * 0.04,
                      width: width * 0.04,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
