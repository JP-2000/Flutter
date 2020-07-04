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
  double _x = 2.0;
  double _previous_x = 1.0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("MangaApp")),
      ),
      body: Container(
        child: GestureDetector(
          onHorizontalDragStart: (DragStartDetails details) {
            print(details.globalPosition);
            _previous_x = _x;
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            print(details.delta.dx);
            setState(() {
              _x = _previous_x * details.delta.dx;
            });
          },
          onHorizontalDragEnd: (DragEndDetails details) {
            _previous_x = null;
          },
          onScaleStart: (ScaleStartDetails details) {
            print(details);
            _previousScale = _scale;
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _scale = (_previousScale * details.scale).clamp(1.0, 5.0);
            });
          },
          onScaleEnd: (ScaleEndDetails details) {
            _previousScale = 1.0;
          },
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.diagonal3(
              Vector3(
                2.0,
                2.0,
                2.0,
              ),
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: images_list.length,
              itemBuilder: (BuildContext context, int index) {
                print(images_list[index]);
                return Container(
                  child: Image(
                    image: NetworkImage(images_list[index]),
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
