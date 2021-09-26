import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List? CountryData;

  const MostAffectedPanel({Key? key, this.CountryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.network(
                    CountryData![index]['countryInfo']['flag'],
                    height: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    CountryData![index]['country'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Case:' + CountryData![index]['cases'].toString(),
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Deaths:' + CountryData![index]['deaths'].toString(),
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: 8,
        ),
      ),
    );
  }
}
