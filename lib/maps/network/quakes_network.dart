import 'dart:convert';

import 'package:flutter_projects/maps/model/quakes_model.dart';
import 'package:http/http.dart';

class Network {
  static final String url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";
  static Future getQuakes() async {
    Response response = await get(Uri.encodeFull(url));
    print(Uri.encodeFull(url));
    if(response.statusCode == 200) {
      return QuakesModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("ganja ganja");
    }
  }
}