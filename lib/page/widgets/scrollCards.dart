import 'package:flutter/material.dart';

class Cards{
  Cards(this.name, this.r, this.g, this.b, this.logo);

  String name, logo;
  int r, g, b;

  Widget build() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 5, 19, 5),
      child: SizedBox(
        height: 69,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(r, g, b, 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  SizedBox(width: 23),
                  Container(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      logo,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 13),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20.2),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }

}
