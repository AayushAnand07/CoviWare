import 'package:flutter/material.dart';

class CovidReport extends StatelessWidget {
  final Map? CovidData;

  const CovidReport({Key? key, this.CovidData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          StatusPanel(
            title: 'Confirmed',
            panelColor: Colors.redAccent,
            textColor: Colors.white,
            count: CovidData!['cases'].toString(),
          ),
          StatusPanel(
            title: 'Active',
            panelColor: Colors.deepOrangeAccent,
            textColor: Colors.white,
            count: CovidData!['active'].toString(),
          ),
          StatusPanel(
            title: 'Recovered',
            panelColor: Colors.green[400],
            textColor: Colors.white,
            count: CovidData!['recovered'].toString(),
          ),
          StatusPanel(
            title: 'Deaths',
            panelColor: Colors.grey[500],
            textColor: Colors.white,
            count: CovidData!['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color? panelColor;
  final Color? textColor;
  final String? title;
  final String? count;

  const StatusPanel({this.panelColor, this.textColor, this.title, this.count});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: panelColor, borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(5),
      height: 100,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title!,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: textColor),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            count!,
            style: TextStyle(fontSize: 16, color: textColor),
          )
        ],
      ),
    );
  }
}
