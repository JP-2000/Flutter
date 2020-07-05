import 'dart:math';

import 'package:vector_math/vector_math_64.dart';
import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MangaApp extends StatefulWidget {
  @override
  _MangaAppState createState() => _MangaAppState();
}

class _MangaAppState extends State<MangaApp> {
  double _scale = 1.0;
  double _previousScale;
  double _x = 0;
  double _y = 1;
  double _z = 0;
  double _w = 1;
  double _previous_x;
  double _previous_y;
  double temp;
  double d_width;


  List images_list = [
    "https://s8.mkklcdnv8.com/mangakakalot/h2/hyer5231574354229/chapter_282/1.jpg",
    "https://s8.mkklcdnv8.com/mangakakalot/h2/hyer5231574354229/chapter_282/2.jpg",
    "https://s8.mkklcdnv8.com/mangakakalot/h2/hyer5231574354229/chapter_282/3.jpg",
    "https://s8.mkklcdnv8.com/mangakakalot/h2/hyer5231574354229/chapter_282/4.jpg"
  ];

  File image = new File("https://s8.mkklcdnv8.com/mangakakalot/h2/hyer5231574354229/chapter_282/4.jpg");


//  Image newimage = new Image.network('https://i.stack.imgur.com/lkd0a.png');
//  Completer<ui.Image> completer = new Completer<ui.Image>();
//  image.newimage
//      .resolve(new ImageConfiguration())
//      .addListener((ImageInfo info, bool _) => completer.complete(info.image));

  double temp_x;
  double temp_y;
  double _scale_2 = 1.0;
  double _previous_scale_2;


  bool start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("MangaApp")),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: Container(
          child: GestureDetector(
//          onPanStart: (DragStartDetails details) {
//            start = true;
////            temp_x = details.globalPosition.dx;
//          },
//          onPanUpdate: (DragUpdateDetails details) {
//            setState(() {
//              if (start == true) {
//                temp_x = details.delta.dx;
//                start = false;
//              }
//              double x = details.delta.dx;
//              double y = details.delta.dy;
////              _w = (_w + details.delta.dx / 100).clamp(0.0, 3.0);
//              _x = _x + details.delta.dx / 1 ;
//              _y = _y + details.delta.dy / 1 ;
//              print("$temp_x  $x");
//            });
//
//          },
            onScaleStart: (ScaleStartDetails details) {
              _previousScale = _scale;
              _previous_scale_2 = _scale_2;
              temp = details.focalPoint.dx;
            },
            onScaleUpdate: (ScaleUpdateDetails details) {

              setState(() {
                _scale = (_previousScale * details.scale).clamp(1.0, 5.0);
                if (_scale == _previousScale){
                  _x = (_x + (details.focalPoint.dx - temp) / 5);
                }
              });
              print(_x);
            },
            onScaleEnd: (ScaleEndDetails details) {
              _previousScale = null;

            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * pow(_scale, 2),
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.diagonal3(
                      Vector3(
                        _scale,
                        _scale,
                        _scale,
                      ),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: images_list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Image(
                            image: NetworkImage(images_list[index]),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      )

    );
  }
}
