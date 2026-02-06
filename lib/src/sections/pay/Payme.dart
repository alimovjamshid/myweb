
import 'package:flutter/cupertino.dart';
import 'package:mywebsite/src/sections/pay/PaymeDekstop.dart';
import 'package:mywebsite/src/sections/pay/PaymeMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Payme extends StatelessWidget {
  const Payme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: PaymeMobile(),
      tablet: PaymeDekstop(),
      desktop: PaymeDekstop(),
    );
  }
}
