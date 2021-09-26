import 'package:flutter/material.dart';
import 'package:health_tracker/widgets/Home/bottom_home_bar.dart';
import 'package:health_tracker/widgets/Home/horizontal_Scroll.dart';

import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Covid 19',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff473F98),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            // padding: EdgeInsets.only(left: 20),
            height: MediaQuery.of(context).size.height * 0.26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              color: Color(0xff473F98),
            ),
            width: MediaQuery.of(context).size.width,

            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  // SvgPicture.asset('assets/icons/covid-19.svg'),
                  Row(
                    children: <Widget>[
                      Text(
                        'Are you feeling Sick?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Image.asset(
                          'assets/images/covid.png',
                          height: 40,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'If you are feeling sick dont take this lightly and contact the nearest medical support for better treatment and assistance',
                    style: TextStyle(
                      color: Colors.white60,
                      fontFamily: 'Roboto',
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          launch(
                              'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red),
                            height: 50,
                            width: 150,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Myth Burster',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ))),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .12,
                      ),
                      GestureDetector(
                        onTap: () {
                          launch('https://covid19responsefund.org/en/');
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red),
                            height: 50,
                            width: 150,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Donate',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(
              'Symptoms',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          CategoriesScroller(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          BotttomBar(),
        ],
      ),
    );
  }
}
