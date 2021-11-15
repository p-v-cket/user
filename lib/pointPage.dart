import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PointPage extends StatefulWidget {
  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  Widget _buildCard() {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(),
        items: [1, 2].map((i) {
          return Builder(
            builder: (BuildContext context) {
              if (i == 1)
                return _pointWidget();
              else
                return _stampWidget();
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMessage() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '혜택',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              '구매 금액의 5%적립\n100어아아아앙',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              '유의사항',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              '구매 금액의 5%적립\n100어아아아앙',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget _stamp(bool stamped){
    return Container(
      width: 30,
      height: 30,
      decoration: new BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: (stamped) ? Image.asset(logo) : null,
    );
  }

  Widget _stampWidget() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                color: Color.fromRGBO(r, g, b, 1),
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: stampList1.map<Widget>((bool check) {
                return _stamp(check);
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: stampList2.map<Widget>((bool check) {
                return _stamp(check);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget positionedText(double left, String text){
    return Positioned(
      top: 20,
      left: left,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
  Widget _pointWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        color: Color.fromRGBO(r, g, b, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          positionedText(20, name),
          positionedText(170, '2,350 POINT'),
          Container(
            width: 77,
            height: 77,
            child: Image.asset(
              logo,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }


  String name = '파리바게트';
  int r = 25, g = 53, b = 119;
  final stampList1 =[true,true,true,true,true];
  final stampList2 =[true,true,true,true,true];
  String logo = 'assets/logo_starbucks.png';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '포인트 카드',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.chevron_left),
        ),
      ),
      body: Column(
        children: <Widget>[
          _buildCard(),
          _buildMessage(),
        ],
      ),
    );
  }
}

