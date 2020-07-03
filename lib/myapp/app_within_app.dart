import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent/android_intent.dart';

class AppWithinApp extends StatefulWidget {
  @override
  _AppWithinAppState createState() => _AppWithinAppState();
}

class _AppWithinAppState extends State<AppWithinApp> {

  static String url = 'http://techslides.com/demos/sample-videos/small.mp4';

  void _openLinkInGoogleChrome() {
    final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull('https://flutter.io'),
        package: 'com.android.chrome');
    intent.launch();
  }

  void _openMxPlayer() {
    final AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      data: Uri.encodeFull("http://techslides.com/demos/sample-videos/small.mp4"),
      package: 'com.mxtech.videoplayer.ad'
    );
    intent.launch();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("AppWithinApp")),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Press"),
          onPressed: _openMxPlayer,
        )
      ),
    );
  }
}

class NextRoute extends StatefulWidget {
  @override
  _NextRouteState createState() => _NextRouteState();
}

class _NextRouteState extends State<NextRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("oo yeh"),
    );
  }
}

