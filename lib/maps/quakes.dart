import 'package:flutter/material.dart';
import 'package:flutter_projects/maps/network/quakes_network.dart';
import 'package:flutter_projects/weather_forecast/model/weather_forecast_model.dart';

class Quakes extends StatefulWidget {
  @override
  _QuakesState createState() => _QuakesState();
}

class _QuakesState extends State<Quakes> {
  Future data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Network.getQuakes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Quakes")),
      ),
    );
  }
}

