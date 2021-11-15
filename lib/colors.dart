import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const CUSTOMblue = Color.fromRGBO(54, 80, 219, 1);

const MaterialColor CUSTOMblueM = const MaterialColor(
  0xffffffff,
  <int, Color>{
    50: Color(0x0ff3650DB),
    100: Color(0x1f3650DB),
    200: Color(0x2f3650DB),
    300: Color(0x3f3650DB),
    400: Color(0x4f3650DB),
    500: Color(0x5f3650DB),
    600: Color(0x6f3650DB),
    700: Color(0x7f3650DB),
    800: Color(0x8f3650DB),
    900: Color(0x9f3650DB),
  },
);

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.apartment_outlined,
          size: MediaQuery.of(context).size.width * 0.785,
          color: CUSTOMblue,
        ),
      ),
    );
  }
}
