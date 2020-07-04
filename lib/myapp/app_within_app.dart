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
      data: Uri.encodeFull("https://9sr4g3q37i9f0vh6k1srncmoetol5la4-a-sites-opensocial.googleusercontent.com/gadgets/ifr?url=https://api.replay.watch/Ads/gag5.xml&amp;vidUrl=https%3a%2f%2fnovelplanet.com%2fGetM3U8%3fcode%3d6e9613927c2e19100d38f784c0a07a49%26isMain%3dtrue%26quality%3d95"),
      package: 'com.mxtech.videoplayer.ad'
    );
    intent.launch();
  }

  Future<void> _openurl() async {
    String url = "https://drive.google.com/file/d/15IQNjJihCvIwdH2L5qwXVN7luuylAnRL/view";
    if (await canLaunch(url)) {
      await launch(url);
    }
    else throw 'Could not launch';

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

