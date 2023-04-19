// ignore: avoid_web_libraries_in_flutter
import 'package:easy_localization/easy_localization.dart';
import 'package:mywebsite/src/animations/entranceFader.dart';
import 'package:mywebsite/src/sections/about/about.dart';
import 'package:mywebsite/src/sections/contact/contact.dart';
import 'package:mywebsite/src/sections/home/home.dart';
import 'package:mywebsite/src/sections/navBar/navBarLogo.dart';
import 'package:mywebsite/src/sections/portfolio/portfolio.dart';
import 'package:mywebsite/src/sections/services/services.dart';
import 'package:mywebsite/src/utils/constants.dart';
import 'package:mywebsite/src/widgets/arrowOnTop.dart';
import 'package:mywebsite/src/widgets/footer.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainPage extends StatefulWidget  {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 25.0);
  ItemScrollController _itemScrollController = ItemScrollController();
  ItemPositionsListener _itemPositionListener = ItemPositionsListener.create();

  List<String> _sectionsName = [
    "h".tr().toString(),
    "b".tr().toString(),
    "c".tr().toString(),
    "d".tr().toString(),
    "j".tr().toString()
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.build,
    Icons.phone,
  ];

  void _scroll(int i) {
    _itemScrollController.scrollTo(index: i, duration: Duration(seconds: 1));
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return HomePage();
    } else if (i == 1) {
      return About();
    } else if (i == 2) {
      return Services();
    } else if (i == 3) {
      return Portfolio();
    } else if (i == 4) {
      return Contact();
    } else if (i == 5) {
      return SizedBox(
        height: 40.0,
      );
    }
    else if (i == 6) {
      return ArrowOnTop(
        onPressed: () => _scroll(0),
      );
    } else if (i == 7) {
      return Footer();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: MediaQuery.of(context).size.width > 760
          ? PreferredSize(
              child: _appBarTabDesktop(),
              preferredSize: const Size.fromHeight(50),
            )
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
      drawer: MediaQuery.of(context).size.width < 760 ? _appBarMobile() : null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RawScrollbar(
          controller: _scrollController,
          thumbColor: kPrimaryColor,
          thickness: 5.0,
          child: ScrollablePositionedList.builder(
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionListener,
            itemCount: 8,
            itemBuilder: (context, index) {
              return sectionWidget(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _appBarActions(String childText, int index,) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: Offset(0, -20),
            delay: Duration(seconds: 3),
            duration: Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                hoverColor: kPrimaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(color: Colors.black,),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                hoverColor: kPrimaryColor,
                onPressed: () => _scroll(index),
                child: ListTile(
                  title: Text(childText),
                )),
          );
  }

  Widget _appBarTabDesktop() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: MediaQuery.of(context).size.width < 740
          ? EntranceFader(
              duration: Duration(seconds: 1),
              offset: Offset(0, -20),
              delay: Duration(seconds: 3),
              child: NavBarLogo())
          : EntranceFader(
              offset: Offset(0, -20),
              duration: Duration(seconds: 1),
              delay: Duration(seconds: 3),
              // child: NavBarLogo(
              //   height: MediaQuery.of(context).size.height * 0.035,
              // ),
            ),
      actions: [
        _appBarActions("h".tr().toString(),0 ,),
        _appBarActions("b".tr().toString(),1 ,),
        _appBarActions("c".tr().toString(),2 ,),
        _appBarActions("d".tr().toString(),3 ,),
        _appBarActions("j".tr().toString(),4 ,),
        // for (int i = 0; i < _sectionsName.length; i++)
        //   _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
        // EntranceFader(
        //   offset: Offset(0, -20),
        //   delay: Duration(seconds: 3),
        //   duration: Duration(seconds: 1),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: MaterialButton(
        //       hoverColor: kPrimaryColor.withAlpha(150),
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(5.0),
        //           side: BorderSide(color: kPrimaryColor)),
        //       onPressed: () {
        //         html.window.open(
        //             'https://drive.google.com/file/d/1eupAzdc9zi1xfjDdUSEyD8RRwUYJTOeo/view?usp=sharing',
        //             "pdf");
        //       },
        //       child: Text(
        //         "Mon CV",
        //         style: GoogleFonts.montserrat(
        //           fontWeight: FontWeight.w200,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],

    );
  }

  Widget _appBarMobile() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // child: NavBarLogo(
              //   height: 28,
              // ),
            ),
            _appBarActions("h".tr().toString(),0 , ),
            _appBarActions("b".tr().toString(),1 , ),
            _appBarActions("c".tr().toString(),2 , ),
            _appBarActions("d".tr().toString(),3 , ),
            _appBarActions("j".tr().toString(),4 , ),
            // for (int i = 0; i < _sectionsName.length; i++)
            //   _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: MaterialButton(
            //     hoverColor: kPrimaryColor.withAlpha(150),
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //         side: BorderSide(color: kPrimaryColor)),
            //     onPressed: () {
            //       launchURL(
            //           "https://drive.google.com/file/d/1HR3zyN0GORDQVkjezxlZ3_l0P6Z6w95k/view?usp=sharing");
            //     },
            //     child: ListTile(
            //       leading: Icon(
            //         Icons.book,
            //         color: Colors.red,
            //       ),
            //       title: Text(
            //         "Mon CV",
            //         style: GoogleFonts.montserrat(
            //           fontWeight: FontWeight.w200,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
