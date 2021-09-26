import 'package:flutter/material.dart';
import 'package:health_tracker/Pages/Home/FAQ_Page.dart';

class BotttomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (Context) => FaqPage()));
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Color(0xff314d70), Color(0xff002366)])),
          width: MediaQuery.of(context).size.width * .9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 15,
              ),
              Image.asset(
                "assets/images/faq.png",
                width: 100,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                'Click for \n F.A.Q  Section',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
              Padding(
                padding: const EdgeInsets.only(right: 28.0),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
