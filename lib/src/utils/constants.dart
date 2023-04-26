import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Colors
Color kPrimaryColor = Color(0xff624a98);
Color kBackround = Color(0xff4fbba5);

// Social Media
const kSocialIcons = [
  "https://img.icons8.com/ios-filled/250/ffffff/telegram.png",
  "https://img.icons8.com/ios-glyphs/240/ffffff/whatsapp.png",
  "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
];

const kSocialLinks = [
  "https://t.me/energytravel1",
  "https://api.whatsapp.com/send?phone=998995198088",
  "https://www.instagram.com/energytravel.uz/?hl=fr",
];

// URL Launcher
void launchURL(String _url) async => await canLaunch(_url)
    ? await launch(_url)
    : throw 'Impossible de lancer $_url';

// Community
final kCommunityLogo = [
  'assets/logogeo.png',
  'assets/fcmr.png',
  'assets/dsc.png',
];

final kCommunityLinks = [
  "http://geo.sm/",
  "https://twitter.com/fluttercm",
  "https://gdg.community.dev/gdg-douala/"
];

// Tools & Tech
final kTools = [
  "Flutter",
  "Laravel",
  "Angular",
  "Firebase",
  "Android",
  "Appwrite",
  "Docker",
  "Git",
];

final kTools1 = [
  "Dart",
  "Javascript",
  "Java",
  "PHP",
  "Kotlin",
  "Python",
  "HTML",
  "CSS",
];

// services
final kServicesIcons = [
  "assets/services/app.png",
  "assets/services/ui.png",
  "assets/services/rapid.png",
  "assets/services/blog.png",
  "assets/services/open.png",
];

final kServicesTitles = [
  "Developpement D'applications et Logiciels",
  "UI mobile Designing",
  "Prototypage D'applications Rapide",
  "Rédaction de blogs techniques",
  "Open Source - GitHub",
];

final kServicesDescriptions = [
  "Je construis des applications professionnelles web avec Laravel et Angular et des applications mobiles natives et cross-platform avec Flutter",
  "Bien que je sois principalement un développeur Backend, je me soucie de l'UI/UX de mes clients que ca soit en web ou mobile. Alors, n'hésitez pas à echanger avec moi sur l'UI/UX de vos applications.",
  "Vous avez une idée de startup ? Ou peut-être voulez-vous simplement un prototype pour vos clients ? Avec Flutter, je peux vous fournir une version de base de votre application en un rien de temps et vous êtes prêt pour vos projets futurs.",
  "J'ecrirais des articles techniques sur dev.to afin de partager mes idées mes astuces et meme pour presenter certains de mes projets @borisgauty",
  "Je travaille en tant que contributeur open source sur GitHub sur de nombreux projets et de nombreux forks sur divers projets aimés et partagés par d'autres développeurs. Consultez mon profil GitHub @BorisGautier",
];

final kServicesLinks = [
  "#",
  "#",
  "#",
  "https://dev.to/borisgauty",
  "https://github.com/BorisGautier"
];

// projects
final kProjectsBanner = [
  "assets/projects/2.png",
  "assets/projects/tictactoe.jpeg",
  "assets/projects/movie.jpg",
  "assets/projects/11.jpg",
  "assets/projects/11.png",
  "assets/projects/project.png",
  "assets/projects/project.png",
  "assets/projects/project.png",
  "assets/projects/project.png",
];

final kProjectsIcons = [
  "assets/services/open.png",
  "assets/projects/flutter.png",
  "assets/projects/android.png",
  "assets/projects/flutter.png",
  "assets/projects/android.png",
  "assets/projects/flutter.png",
  "assets/projects/flutter.png",
  "assets/services/open.png",
  "assets/projects/flutter.png",
];

final kProjectsTitles = [
  "GeOsm",
  "TicTacToe",
  "MovieStream",
  "MyEvent",
  "Find Jobs",
  "aestheticDialogs",
  "GPChat",
  "Position",
  "GNews"
];

final kProjectsDescriptions = [
  "GeOsm est la première plateforme geographique mondiale de données libres",
  "Jeu de morpion en ligne avec Flutter",
  "Avec MovieStream profitez du meilleur du streaming, telechargez vos films series et animes et profitez des emissions en direct",
  "Securisez vos evenements et suivez votre processus de vente grace à MyEvent",
  "Application mobile pour publier et trouver des offres d'emplois dans notre ville ou pays",
  "Plugins flutter pour afficher de belles boites de dialogue dans vos applictions",
  "GPChat est une application de messagerie gratuite disponible sur Android et bientôt sur d'autres plateformes.",
  "Position est une solution digitale, collaborative conçue pour simplifier le quotidien et faciliter les échanges entre les artisans, commerçants et la population",
  "GNews est une application opensource de news gratuite disponible sur Android et bientôt sur d'autres plateformes."
];

final kProjectsLinks = [
  "https://github.com/GeOsmFamily",
  "https://play.google.com/store/apps/details?id=cm.tbg.tictactoe",
  "https://appdistribution.firebase.dev/i/bd22871bb06fa1cf",
  "https://play.google.com/store/apps/details?id=com.trimora.myevent",
  "https://play.google.com/store/apps/details?id=cm.tbg.jobs",
  "https://github.com/BorisGautier/aestheticDialogs",
  "https://play.google.com/store/apps/details?id=cm.tbg.gpchat&hl=fr&gl=US",
  "https://position.cm/",
  "https://github.com/BorisGautier/GNews"
];

// Contact
final kContactIcons = [
  Icons.home,
  Icons.phone,
  Icons.mail,
];

final link = [
  "https://www.google.com/maps?q=41.282339,69.250747&ll=41.282339,69.250747&z=16",
  "tel:+998995198088",
  "mailto:travel.energy@mail.ru?subject=Energy travel"
];

Future<String> cardsCreate(String number, String expire, String amount) async{

      Map<String, String> header = {
        "X-Auth": "64476364096a61fb42c24421"
      };

      final jsBody = '{"id": 1,"method": "cards.create","params": {"card": {  "number": "$number",  "expire": "$expire"  },  "amount" : 10000,  "save": true  }}';

      var responce = await http.post(Uri.parse("https://checkout.paycom.uz/api"), headers: header,body: utf8.encode(jsBody));
      print(responce.toString());
      print(responce.headers);

      var body = responce.body;

      var responceJson = json.decode(body);

      var result = responceJson['result'];

      print(responce.body.toString());

      print(result['card']['token']);

      var token = result['card']['token'];

      // cardsGetVerifyCode(token);

    // cardVerify(token)

      cardsGetVerifyCode(token);
      //
      return token;

}

cardsGetVerifyCode(String token) async {

  try {

    Map<String, String> header = {
      "X-Auth": "64476364096a61fb42c24421",
    };

    print("tokin $token");

    final json = '{"id": 1,"method": "cards.get_verify_code","params": {"token": "$token"}}';

    var responce = await http.post(Uri.parse("https://checkout.paycom.uz/api/"), headers: header,body: utf8.encode(json));

    debugPrint(""+responce.body.toString());

  }
  catch (e){
    debugPrint("aka xato");
  }
}

Future<String> cardVerify(String token, String code,String price,String title) async {

    Map<String, String> header = {
      "X-Auth": "64476364096a61fb42c24421"
    };

    final json = '{"id": 1,"method": "cards.verify","params": {"token": "$token","code": "$code"}}';
    print(json);
    var responce = await http.post(Uri.parse("https://checkout.paycom.uz/api/"), headers: header,body: utf8.encode(json));

    debugPrint("cardverify"+responce.body.toString());

    receiptsCreate(title, price, token);

  return responce.toString();
}

Future<String> cardsCheck(String token) async {

  Map<String, String> header = {
    "X-Auth": "64476364096a61fb42c24421",
  };

  final jsBody = '{"{"id": 1,"method": "cards.check","params": {"token": "$token"}}}';

  var responce = await http.post(Uri.parse("https://checkout.paycom.uz/api/"), headers: header,body: utf8.encode(jsBody));

  var body = responce.body;

  return body;

}

Future<String> receiptsCreate(String title,String price,String token) async {
  Map<String, String> header = {
    "X-Auth": "64476364096a61fb42c24421",
  };

  var pr = int.parse(price);

  pr*=100;

  final jsBody = '{"id": 1,"method": "receipts.create","params": {"amount": $pr,"account": {"order_id": "100000"},"detail": {"receipt_type": 0,  "items": [  {"discount": 0,   "title": "$pr",    "price": $price,   "count": 1,   "units": 1495086,  "code": "10703999001000000",   "vat_percent": 0,   "package_code": "1495086"   }  ]  }  }}';

  var responce = await http.post(Uri.parse("https://checkout.paycom.uz/api/"), headers: header,body: utf8.encode(jsBody));

  var responceJson = json.decode(responce.body);

  var result = responceJson['result'];

  print("receiptcreate"+responce.body.toString());

  var id = result['receipt']['_id'];

  debugPrint(responce.body.toString());

  print(" id : $id");

  receiptsPay(id, token);

  return id.toString();
}

Future<String> receiptsPay(String id, String token) async {
  Map<String, String> header = {
    "X-Auth": "64476364096a61fb42c24421:Qm7shU7M&tkYKI6DtkzHKEvoBQAwHxAVpm1V",
  };

  final json = '{"id": 1,  "method": "receipts.pay",  "params": {  "id": "$id",  "token": "$token"  }}';

  var responce = await http.post(Uri.parse("https://checkout.paycom.uz/api/"), headers: header,body: utf8.encode(json));

  if(responce.statusCode == 200){
    Fluttertoast.showToast(msg: 'aa'.tr().toString(),gravity: ToastGravity.TOP,fontSize: 18);
  }
  else{
    Fluttertoast.showToast(msg: 'ab'.tr().toString(),gravity: ToastGravity.TOP,fontSize: 18);
  }

  debugPrint("receiptpay"+responce.body.toString());

  return responce.statusCode.toString();
}




var kContactTitles = [
  "e".tr().toString(),
  "n".tr().toString(),
  "o".tr().toString(),
];

var kContactDetails = [
  "p".tr().toString(),
  "+99 8(99) 519 80 88",
  "travel.energy@mail.ru"
];

