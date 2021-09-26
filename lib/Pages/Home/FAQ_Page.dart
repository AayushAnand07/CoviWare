import 'package:flutter/material.dart';
import 'package:health_tracker/Models/Home-FAQ-Json/FaqSource.dart';

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'F.A.Q',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff473F98),
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: FAQSource.questionAnswers.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(
                  FAQSource.questionAnswers[index]['question'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff0E1229)),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(FAQSource.questionAnswers[index]['answer']),
                  )
                ],
              );
            }));
  }
}
