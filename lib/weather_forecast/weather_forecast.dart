import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/weather_forecast/network/weather_forecast_network.dart';
import 'package:flutter_projects/weather_forecast/ui/midview.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future data;
  String cityName = "Mumbai";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getWeather(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Weather Forecast")),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            _textField(),
            Container(
              margin: EdgeInsets.all(20.0),
              child: FutureBuilder(
                future: data,
                builder: (context, AsyncSnapshot snapshot) {
                  if(snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        midView(snapshot, context),
                      ],
                    );
                  }
                  else{
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
//          child: Column(
//            children: <Widget>[
//              Container(
//                margin: EdgeInsets.all(5.0),
//                padding: EdgeInsets.symmetric(horizontal: 5.0),
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(5.0),
//                  border: Border.all(
//                    color: Colors.grey,
//                  ),
//                ),
//                child: TextField(
//                  enableInteractiveSelection: false,
//                  keyboardType: TextInputType.text,
//                  decoration: InputDecoration(
//                    icon: Container(
//                      child: Icon(Icons.search),
//                    ),
//                    labelText: "Enter City",
//                    disabledBorder: InputBorder.none,
//                  ),
//
//                ),
//              )
//            ],
//          ),
        ),
      ),
    );
  }

  Widget _textField() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Enter City",
          prefixIcon: Icon(Icons.search,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )
        ),
        onSubmitted: (value) {
          setState(() {
            cityName = value;
            data = getWeather(cityName);
          });
        },
      ),
    );
  }

  Future getWeather(cityName) => Network.getWeatherForecast(cityName: cityName);

}
