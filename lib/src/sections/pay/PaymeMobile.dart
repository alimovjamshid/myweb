import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class PaymeMobile extends StatelessWidget {

  var phonekFormatter = new MaskTextInputFormatter(
      mask: '+## (###) ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  var numberFormatter = new MaskTextInputFormatter(
      mask: '####-####-####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  var codeFormatter = new MaskTextInputFormatter(
      mask: '##/##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final TextEditingController _controllerPhone = new TextEditingController();
    final TextEditingController _controllerNumber = new TextEditingController();
    final TextEditingController _controllerCode = new TextEditingController();
    final TextEditingController _controllerData = new TextEditingController();
    final TextEditingController _controllerPrice = new TextEditingController();

    String token = "";

    Future<void> _sendBot(String summa, String phone) async {
      try {
        var message =
            "To'lov qilindi : \nTelefon : $phone\nSumma : $summa";

        Map<String, String> header = {
          "Content-Type": "application/json",
          "cache-control": "no-cache"
        };

        final json = '{"chat_id":"-1001904001413","text":"$message"}';

        var responce = await http.post(
            Uri.parse(
                "https://api.telegram.org/bot5880434981:AAF9iuM0bwY953QOqN5MzWRNrMMrztZH9IE/sendMessage"),
            headers: header,
            body: json);
        print(responce.body);
      } catch (e) {
        print("xato");
      }
    }

    return  Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          SizedBox(
            height: height * 0.015,
          ),
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.asset("assets/pay.jpg",width: width * 0.25)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "pay".tr().toString(),
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            "energrytravel.uz",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: height * 0.025
                            ),
                          )
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Image.asset("assets/4.png",height: height * 0.3,fit: BoxFit.scaleDown,color: Colors.transparent,),
                      )
                    ],
                  ),

                ],
              )
          ),
          SizedBox(
            width: width * 0.95,
            child: TextField(
              controller: _controllerPhone,
              style: TextStyle(color: Colors.black),
              inputFormatters: [phonekFormatter],
              // controller: _controllerCode,
              decoration: InputDecoration(
                labelText: 's'.tr().toString(),
                hintText: "+99 (899) 123-45-67",
                hintStyle: TextStyle(color: Colors.black38),
                border: OutlineInputBorder(

                ),
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: const OutlineInputBorder(
                  borderSide:  BorderSide(
                      color: Colors.black
                  ),
                ),
                // hintMaxLines: 20,
              ),
              // maxLength: 6,
              // inputFormatters: [LengthLimitingTextInputFormatter(16)],
              obscureText: false,
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: height *  0.03,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.7,
                  child: TextField(
                    controller: _controllerNumber,
                    style: TextStyle(color: Colors.black),
                    inputFormatters: [numberFormatter],
                    // controller: _controllerCode,
                    decoration: InputDecoration(
                      labelText: 'z'.tr().toString(),
                      hintText: "0000-0000-0000-0000",
                      hintStyle: TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(

                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(
                            color: Colors.black
                        ),
                      ),
                      // hintMaxLines: 20,
                    ),
                    // maxLength: 6,
                    // inputFormatters: [LengthLimitingTextInputFormatter(16)],
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                SizedBox(
                  width: width * 0.2,
                  child: TextField(
                    controller: _controllerData,
                    style: TextStyle(color: Colors.black),
                    inputFormatters: [codeFormatter],
                    // controller: _controllerCode,
                    decoration: InputDecoration(
                      labelText: 'y'.tr().toString(),
                      hintText: "06/29",
                      hintStyle: TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(

                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(
                            color: Colors.black
                        ),
                      ),
                      // hintMaxLines: 20,
                    ),
                    // maxLength: 6,
                    // inputFormatters: [LengthLimitingTextInputFormatter(16)],
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.4,
                child: TextField(
                  controller: _controllerPrice,
                  style: TextStyle(color: Colors.black),
                  // controller: _controllerCode,
                  decoration: InputDecoration(
                    labelText: 'Summa'.tr().toString(),
                    hintText: "1000        so'm",
                    hintStyle: TextStyle(color: Colors.black38),
                    border: OutlineInputBorder(

                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:  BorderSide(
                          color: Colors.black
                      ),
                    ),
                    // hintMaxLines: 20,
                  ),
                  // maxLength: 6,
                  // inputFormatters: [LengthLimitingTextInputFormatter(16)],
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              MaterialButton(
                color: kPrimaryColor,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
                disabledElevation: width,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                elevation: 10.0,
                hoverElevation: 50,
                animationDuration: Duration(milliseconds: 1000),
                hoverColor: Colors.deepPurple,
                height: height * 0.1,
                onPressed: ()   async {

                  if(_controllerData.text.length ==5 && _controllerNumber.text.length == 19 && _controllerPhone.text.length == 19 && _controllerPrice.text.isNotEmpty){

                    await cardsCreate(_controllerNumber.text.toString(), _controllerData.text.toString(), "amount").then((v)=>token=v);

                    debugPrint(token);

                    if(token != "null"){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("v".tr().toString()),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _controllerCode,
                                      decoration: InputDecoration(
                                        labelText: 'Code'.tr().toString(),
                                        border: const OutlineInputBorder(),
                                        hintMaxLines: 8,
                                      ),
                                      maxLength: 6,
                                      // inputFormatters: [LengthLimitingTextInputFormatter(16)],
                                      obscureText: false,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                MaterialButton(
                                  color: kPrimaryColor,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // debugPrint(_controllerName.text.toString());
                                  },
                                  child: Text("w".tr().toString()),
                                ),
                                MaterialButton(
                                  color: kPrimaryColor,
                                  onPressed: () {
                                    Navigator.of(context).pop();

                                    cardVerify(
                                        "$token",
                                        _controllerCode.text.toString(),
                                        "1000",
                                        "Dubai travel");

                                    _sendBot(_controllerPrice.text.toString(),
                                        _controllerPhone.text.toString(),);
                                  },
                                  child: Text("u".tr().toString()),
                                )
                              ],
                            );
                          });
                    }
                    else{
                      Fluttertoast.showToast(msg: "Error",timeInSecForIosWeb: 5,gravity: ToastGravity.TOP);
                    }
                  }
                  else{
                    Fluttertoast.showToast(msg: "Error",timeInSecForIosWeb: 5,gravity: ToastGravity.TOP);
                  }
                },
                autofocus: true,
                child: Text(
                  "pay".tr().toString(),
                  style: TextStyle(fontSize: height * 0.02),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
