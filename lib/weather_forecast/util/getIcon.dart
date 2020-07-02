import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getIcon({String weatherMain, Color color, double size}){
  switch(weatherMain) {
    case  "Clear" :
      {return Icon(FontAwesomeIcons.sun, color: color, size: size);}
      break;
    case "Clouds" :
      {return Icon(FontAwesomeIcons.cloud, color: color, size: size);}
      break;
    case "Rain" :
      {return Icon(FontAwesomeIcons.cloudRain, color: color, size: size);}
      break;
    case "Snow" :
      {return Icon(FontAwesomeIcons.snowman, color: color, size: size);}
      break;
    default :
      {return Icon(FontAwesomeIcons.sun, color: color, size: size);}
  }
}