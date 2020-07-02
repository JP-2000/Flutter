import 'dart:convert';
import 'package:flutter_projects/weather_forecast/util/weather_forecast_util.dart';
import 'package:flutter_projects/weather_forecast/model/weather_forecast_model.dart';
import 'package:http/http.dart';

class Network {
  static Future getWeatherForecast({String cityName}) async {
    var url = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+"&appid="+Util.appId+"&units=metric"; // change to metric or imperial
    Response response = await get(Uri.encodeFull(url));
    print(Uri.encodeFull(url));

    if(response.statusCode == 200) {
//      print(response.body);
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("oof Error");
    }
  }
}