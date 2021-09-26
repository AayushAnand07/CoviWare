import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentPanel extends StatelessWidget {
  final Map? CovidWorldData;
  final List? IndiaCovidData;
  const PercentPanel({this.CovidWorldData, this.IndiaCovidData});

  @override
  Widget build(BuildContext context) {
    double? percent = (double.parse(IndiaCovidData![1]['cases'].toString()) /
            double.parse(CovidWorldData!['cases'].toString())) *
        100;
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffd4dcec), borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: CircularPercentIndicator(
              backgroundColor: Color(0xffd1cdec),
              radius: 100.0,
              lineWidth: 10.0,
              animation: true,
              animationDuration: 2500,
              circularStrokeCap: CircularStrokeCap.round,
              percent: double.parse(IndiaCovidData![1]['cases'].toString()) /
                  double.parse(CovidWorldData!['cases'].toString()),

              progressColor: Color(0xff473f98),

              //
              center: new Text(
                percent.toStringAsFixed(2) + '%',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'India\'s Report',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Total Cases - ' + CovidWorldData!['cases'].toString(),
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.orange[900],
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  'Total Deaths - ' + CovidWorldData!['deaths'].toString(),
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
