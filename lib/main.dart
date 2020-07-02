import 'package:flutter/material.dart';
import 'package:flutter_projects/maps/quakes.dart';
import 'package:flutter_projects/maps/simple_google_maps.dart';
import 'package:flutter_projects/parsing_json/json_parsing_maps.dart';
import 'package:flutter_projects/weather_forecast/weather_forecast.dart';
import 'ui/home.dart';
import 'ui/mortgage_app.dart';
import 'package:flutter_projects/parsing_json/json_parsing.dart';

final ThemeData appTheme = buildAppTheme();

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    scaffoldBackgroundColor: Colors.blueGrey.shade500,
//    brightness: Brightness.dark,
//    accentColor: Colors.green,
//    primaryColor: Colors.red,
//    scaffoldBackgroundColor: Colors.yellow,
//    backgroundColor: Colors.cyan,
//    textTheme: appTextTheme(base.textTheme)
  );
}
TextTheme appTextTheme(TextTheme base) {
  return base.copyWith(
    bodyText2: base.bodyText2.copyWith(
      fontSize: 30.0,
      fontFamily: "Bombtrack",
      color: Colors.black,
    )
  );
}


void main() => runApp(
  new MaterialApp(
    theme: ThemeData.dark(),
//    theme: appTheme,
    home: Quakes(),
  )
);
//void main() => runApp(Home());

