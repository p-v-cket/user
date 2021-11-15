import 'package:flutter/material.dart';
import 'package:custom/colors.dart';

class IDcard {
  IDcard(this.name, this.address, this.number);

  String name, address, number;

  Widget positioned(double top, double left, String text, double fontSize){
    return Positioned(
      top: top,
      left: left,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget buildCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      height: 200,
      decoration: BoxDecoration(
        color: CUSTOMblue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: <Widget>[
          positioned(17,20,'(✓) 전자출입카드',14),
          positioned(86,20,this.name,20),
          positioned(140,20,this.address,16),
          positioned(170,20,this.number,16),
          positioned(170,200,'개인정보 수집동의 (✓)',12),
        ],
      ),
    );
  }
}

