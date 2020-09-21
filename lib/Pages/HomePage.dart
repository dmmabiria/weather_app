import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map weatherData;
  getAllData() async {
    var api =
        'https://samples.openweathermap.org/data/2.5/forecast/hourly?id=524901&appid=439d4b804bc8187953eb36d2a8c26a02';
    http.Response data = await http.get(api);

    setState(() {
      weatherData = json.decode(data.body);
    });
  }

  Future fetchData() async {
    getAllData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What\'s Your Weather?'),
        backgroundColor: Color(0xffcea881),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: Container(
          height: 800.0,
          child: Stack(
            children: [
              Container(
                child: Image(
                  image: AssetImage('images/sun.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              weatherData == null
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    )
                  : Positioned(
                      bottom: 0.0,
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: 100.0,
                        width: 400.0,
                        color: Color(0xffcea881),
                        child: Column(
                          children: [
                            Text(
                                'Temperature: ' +
                                    weatherData['list'][0]['main']['temp']
                                        .toString() +
                                    '/F',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              weatherData['list'][0]['weather'][0]['main'],
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'City: ' + weatherData['city']['name'],
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
