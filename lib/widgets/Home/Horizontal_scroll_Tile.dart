import 'package:flutter/material.dart';

Widget CustomHorizontalTile(
    String txt, String imgUrl, Color clr, BuildContext context) {
  final double categoryHeight = MediaQuery.of(context).size.height * 0.32 - 70;
  return Container(
    width: MediaQuery.of(context).size.width * 0.4,
    margin: EdgeInsets.only(right: 20),
    height: categoryHeight,
    decoration: BoxDecoration(
        color: clr, borderRadius: BorderRadius.all(Radius.circular(20.0))),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              imgUrl,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                txt,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
