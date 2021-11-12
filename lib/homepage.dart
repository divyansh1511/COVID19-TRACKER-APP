import 'dart:convert';

import 'package:apiproject/CountryCases.dart';
import 'package:apiproject/Infopannel.dart';
import 'package:apiproject/worldcases.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map worlddata = Map();

  FetchWorlddata() async {
    http.Response response = await http.get(
      Uri.parse("https://corona.lmao.ninja/v3/covid-19/all"),
    );
    setState(() {
      worlddata = json.decode(response.body);
    });
  }

  late Map Indiadata = Map();

  FetchCountryData() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://disease.sh/v3/covid-19/countries/India?yesterday=India&twoDaysAgo=India&strict=India&allowNull=India"),
    );
    setState(() {
      Indiadata = json.decode(response.body);
    });
  }

  late Map USAdata = Map();
  FetchUSAData() async {
    http.Response response = await http.get(
      Uri.parse("https://disease.sh/v3/covid-19/countries/USA?strict=true"),
    );
    setState(() {
      USAdata = json.decode(response.body);
    });
  }

  late Map Brazildata = Map();
  FetchBrazilData() async {
    http.Response response = await http.get(
      Uri.parse("https://disease.sh/v3/covid-19/countries/Brazil?strict=true"),
    );
    setState(() {
      Brazildata = json.decode(response.body);
    });
  }

  Map UKdata = Map();
  FetchUKData() async {
    http.Response response = await http.get(
      Uri.parse("https://disease.sh/v3/covid-19/countries/UK?strict=true"),
    );
    setState(() {
      UKdata = json.decode(response.body);
    });
  }

  @override
  void initState() {
    FetchWorlddata();
    FetchCountryData();
    FetchUSAData();
    FetchBrazilData();
    FetchUKData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text('Covid-19 Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.amber,
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Center(
                child: Text(
                  'Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                'WorldWide',
                style: TextStyle(
                  fontSize: 26.0,
                ),
              ),
            ),
            Container(
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                children: [
                  WorldCasePanel(
                    title: 'CONFIRMED',
                    panelColor: Color.fromRGBO(255, 122, 122, 0.5),
                    textColor: Colors.red,
                    count: worlddata['cases'].toString(),
                  ),
                  WorldCasePanel(
                    title: 'ACTIVE',
                    panelColor: Colors.lightBlueAccent,
                    textColor: Color.fromRGBO(25, 0, 255, 0.8),
                    count: worlddata['active'].toString(),
                  ),
                  WorldCasePanel(
                    title: 'RECOVERED',
                    panelColor: Colors.green.shade100,
                    textColor: Colors.green,
                    count: worlddata['recovered'].toString(),
                  ),
                  WorldCasePanel(
                    title: 'DEATHS',
                    panelColor: Colors.grey,
                    textColor: Colors.black,
                    count: worlddata['deaths'].toString(),
                  ),
                ],
              ),
            ),
            Text(
              'Most Affected Countries',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                child: CountryCases(
                  title: 'USA',
                  Count: USAdata['cases'].toString(),
                  url: USAdata['countryInfo']['flag'].toString(),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                child: CountryCases(
                  title: 'India',
                  Count: Indiadata['cases'].toString(),
                  url: Indiadata['countryInfo']['flag'].toString(),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                child: CountryCases(
                  title: 'Brazil',
                  Count: Brazildata['cases'].toString(),
                  url: Brazildata['countryInfo']['flag'].toString(),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                child: CountryCases(
                  title: 'UK',
                  Count: UKdata['cases'].toString(),
                  url: UKdata['countryInfo']['flag'].toString(),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            InfoPanel(),
          ],
        ),
      ),
    );
  }
}
