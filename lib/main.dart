import 'package:flutter/material.dart';
import 'package:flutter_projects/manga_app/manga_app.dart';
import 'package:flutter_projects/maps/quakes.dart';
import 'package:flutter_projects/maps/simple_google_maps.dart';
import 'package:flutter_projects/myapp/app_within_app.dart';
import 'package:flutter_projects/myapp/webview.dart';
import 'package:flutter_projects/parsing_json/json_parsing_maps.dart';
import 'package:flutter_projects/weather_forecast/weather_forecast.dart';
import 'myapp/simple_video_player.dart';
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
    home: MangaApp(),
  )
);

//void main() => runApp(Home());

// Video player plugin
/*
//Video_player

//import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';
//
//void main() {
//  runApp(Home());
//}
//
//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Video Example',
//      home: VideoExample(),
//    );
//  }
//}
//
//class VideoExample extends StatefulWidget {
//  @override
//  VideoState createState() => VideoState();
//}
//
//class VideoState extends State<VideoExample> {
//  VideoPlayerController playerController;
//  VoidCallback listener;
//
//  @override
//  void initState() {
//    super.initState();
//    listener = () {
//      setState(() {});
//    };
//  }
//
//  void createVideo() {
//    if (playerController == null) {
//      playerController = VideoPlayerController.asset(
//        "videos/sample.mp4")
//        ..addListener(listener)
//        ..setVolume(1.0)
//        ..initialize()
//        ..play();
//    } else {
//      if (playerController.value.isPlaying) {
//        playerController.pause();
//      } else {
//        playerController.initialize();
//        playerController.play();
//      }
//    }
//  }
//
//  @override
//  void deactivate() {
//    playerController.setVolume(0.0);
//    playerController.removeListener(listener);
//    super.deactivate();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Video Example'),
//      ),
//      body: Center(
//          child: AspectRatio(
//              aspectRatio: 16 / 9,
//              child: Container(
//                child: (playerController != null
//                    ? VideoPlayer(
//                  playerController,
//                )
//                    : Container()),
//              ))),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          createVideo();
//          playerController.play();
//        },
//        child: Icon(Icons.play_arrow),
//      ),
//    );
//  }
//}
*/