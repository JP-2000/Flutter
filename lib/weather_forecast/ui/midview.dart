import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_projects/weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter_projects/weather_forecast/util/getIcon.dart';
import 'package:flutter_projects/weather_forecast/util/weather_forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Widget midView(AsyncSnapshot snapshot, BuildContext context) {
  var object = snapshot.data;
  List sevenDayList = object.list;

  String weatherDescription = object.list[0].weather[0].description;
  String windSpeed = "${object.list[0].speed} mi/hr";
  Icon windSpeed_icon = Icon(FontAwesomeIcons.wind, size: 20,);
  String humidity = "${object.list[0].humidity} %";
  Icon humidity_icon = Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20,);
  String maxTemp = "${object.list[0].temp.max.round()}°C";
  Icon maxTemp_icon = Icon(FontAwesomeIcons.temperatureHigh, size: 20);
  

  var formatted_date = new DateTime.fromMillisecondsSinceEpoch(object.list[0].dt * 1000);

  return Column(
    children: <Widget>[
      Container(
        child: Text(
          "${object.city.name}, ${object.city.country}",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 17.0,
          ),
        ),
      ),
      SizedBox(height: 5.0,),
      Text(
        "${Util.convertDate(formatted_date)}",
        style: TextStyle(
          fontSize: 13.0
        ),
      ),
      SizedBox(height: 20.0,),
      Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(right: 30.0),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 5.0,
              top: 5.0,
              child: getIcon(weatherMain: sevenDayList[0].weather[0].main, color: Colors.black, size: 175.0),
            ),
            getIcon(weatherMain: sevenDayList[0].weather[0].main, color: Colors.greenAccent, size: 175.0),
//            Icon(FontAwesomeIcons.cloud, size: 175.0, color: Colors.greenAccent),
          ],
        ),
      ),
      SizedBox(height: 20.0,),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${object.list[0].temp.day.round()}°C",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 35.0,
              ),
            ),
            SizedBox(width: 8.0),
            Text(weatherDescription.toUpperCase()),
          ],
        ),
      ),
      Container(
        width: 300,
        alignment: Alignment.center,
        margin: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            midViewDetails(text: windSpeed, icon: windSpeed_icon),
            midViewDetails(text: humidity, icon: humidity_icon),
            midViewDetails(text: maxTemp, icon: maxTemp_icon),
          ],
        ),
      ),
      SizedBox(height: 20.0,),
      Container(
        padding: EdgeInsets.only(right: 180.0),
        child: Text(
          "7 Day WeatherForecast: ",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      _listViewHorizontal(context: context, sevenDayList: sevenDayList),
    ],
  );
}

Widget _listViewHorizontal({BuildContext context, List sevenDayList}) {
  var formatted_date = new DateTime.fromMillisecondsSinceEpoch(sevenDayList[0].dt * 1000);
  return Container(
//    padding: EdgeInsets.only(bottom: 30.0),
    height: 170.0,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey,
                        Colors.transparent,
                        Colors.grey,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 8.0,),
                      Text("${Util.convertDate_2(DateTime.fromMillisecondsSinceEpoch(sevenDayList[index].dt * 1000))}"),
                      SizedBox(height: 8.0,),
                      CircleAvatar(
                        backgroundColor: Color(0xffD6FCEE),
                        radius: 33.0,
                        child: Stack(
                          overflow: Overflow.visible,
                          alignment: Alignment.center,
                          children: <Widget>[
                            Positioned(
                              left: 1.0,
                              top: 1.0,
                              child: getIcon(weatherMain: sevenDayList[0].weather[0].main, color: Colors.black, size: 50.0),
                            ),
                            getIcon(weatherMain: sevenDayList[0].weather[0].main, color: Colors.greenAccent, size: 50.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("${sevenDayList[index].weather[0].description[0].toUpperCase()+sevenDayList[index].weather[0].description.substring(1)}"),
                      SizedBox(height: 5.0,),
                      Text("${sevenDayList[index].temp.day}°C"),
                    ],
                  ),
                ),
              ],
            ),
          )
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 10.0),
      itemCount: sevenDayList.length,
    ),
  );
}

Widget midViewDetails({String text, Icon icon}) {
  return Container(
    child: Column(
      children: <Widget>[
        Text(text),
        SizedBox(height: 5.0,),
        icon,
      ],
    ),
  );
}
