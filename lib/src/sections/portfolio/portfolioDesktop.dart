import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebsite/src/animations/bottomAnimation.dart';
import 'package:mywebsite/src/utils/constants.dart';
import 'package:mywebsite/src/widgets/projectCard.dart';
import 'package:http/http.dart' as http;
import '../../animations/entranceFader.dart';

class PortfolioDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final TextEditingController _controllerName = new TextEditingController();
    final TextEditingController _controllerPhone = new TextEditingController();
    final TextEditingController _controllerMessage = new TextEditingController();

    Future<void> _sendBot(String text,String phone, String name) async{
      try{

        var message = "Bron : Egipet\nIsm : ${_controllerName.text}\nTelefon : ${_controllerPhone.text}\nIzoh : ${_controllerMessage.text}";

        Map<String,String> header={
          "Content-Type" : "application/json",
          "cache-control" : "no-cache"
        };

        final json = '{"chat_id":"-1001904001413","text":"$message"}';

        var responce = http.post(Uri.parse("https://api.telegram.org/bot5880434981:AAF9iuM0bwY953QOqN5MzWRNrMMrztZH9IE/sendMessage"),headers: header,body: json);
        print(responce);
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
                  _sendBot(_controllerMessage.text, _controllerPhone.text, _controllerName.text);
                },
                child: Text("u".tr().toString()),
              )
            ],
          );
        },
      );
    }

    return Container(
      width: width,
      color: Colors.grey[200],
      child: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            "assets/c.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  MaterialButton(
                    color: kPrimaryColor,
                    disabledElevation: width,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20.0))),
                    elevation: 10.0,
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
                          "x".tr().toString(),
                          style: TextStyle(fontSize: height * 0.02),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: width * 0.6,
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
                            "m".tr(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: height * 0.025
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
