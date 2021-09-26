import 'package:flutter/material.dart';
import 'package:health_tracker/widgets/CovidWorldReport/Covid_report_grid.dart';
import 'package:health_tracker/widgets/CovidWorldReport/MostAffectedPanel.dart';
import 'package:health_tracker/widgets/CovidWorldReport/Percent_Indicator.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'SearchPanel.dart';

class CovidWorld extends StatefulWidget {
  @override
  _CovidWorldState createState() => _CovidWorldState();
}

String? stringResponse;

class _CovidWorldState extends State<CovidWorld> {
  Map? CovidData;
  List? CountryData;
  fetchCovidData() async {
    http.Response response;
    response = await http.get(Uri.parse("https://corona.lmao.ninja/v2/all"));

    setState(() {
      CovidData = json.decode(response.body);
    });
  }

  fetchCountryData() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://corona.lmao.ninja/v2/countries?sort=cases"));
    setState(() {
      CountryData = json.decode(response.body);
      print(response.body);
    });
  }

  @override
  void initState() {
    fetchCovidData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff473F98),
          title: Text(
            'Covid-19 World Report',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),

            // worwide row----------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Worldwide',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 50,
                  ),

                  //search Button------------------------------------------------------

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountryPage()));
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Your Country',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        height: 75,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff0E1229),
                            borderRadius: BorderRadius.circular(80)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // grid row--------------
            CovidData == null
                ? Center(child: CircularProgressIndicator())
                : CovidReport(
                    CovidData: CovidData,
                  ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: CountryData == null || CovidData == null
                  ? Container()
                  : PercentPanel(
                      CovidWorldData: CovidData,
                      IndiaCovidData: CountryData,
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Most Affected Countries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            CountryData == null
                ? Container()
                : MostAffectedPanel(CountryData: CountryData),
          ],
        ));
  }
}
