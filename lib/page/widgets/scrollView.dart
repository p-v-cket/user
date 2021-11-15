import 'package:flutter/material.dart';
import 'package:custom/page/widgets/scrollCards.dart';
import 'package:custom/page/pointPage.dart';

class CustomScrollViewContent extends StatelessWidget {

  final cardsList =[
    Cards('스타벅스', 0, 102, 51, 'assets/logo_starbucks.png'),
    Cards('포켓네포차', 244, 117, 24, 'assets/logo_starbucks.png'),
  ];
  final pointsList =[
    Cards('스타벅스', 0, 102, 51, 'assets/logo_starbucks.png'),
    Cards('포켓네포차', 244, 117, 24, 'assets/logo_starbucks.png'),
    Cards('파리바게트', 25, 53, 119, 'assets/logo_starbucks.png'),
  ];


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 450.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 19, 0, 5),
              child: Text(
                '직원 카드',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: cardsList.map<Widget>((Cards card) {
                return card.build();
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 15, 0, 5),
              child: Text(
                '포인트 카드',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: pointsList.map<Widget>((Cards card) {
                return TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PointPage()),
                    );
                  },
                  child: card.build(),
                );
              }).toList(),
            ),


            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                height: 69,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                    border: Border.all(color: Colors.black12, width: 3),
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Icon(
                        Icons.add_circle_outline_sharp,
                        color: Colors.black12,
                      ),
                      SizedBox(
                        height: 20,
                        child: Text(
                          '카드추가',
                          style: TextStyle(fontSize: 14, color: Colors.black12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
