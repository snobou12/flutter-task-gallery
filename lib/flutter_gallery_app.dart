import 'package:flutter/material.dart';
import 'package:flutter_gallery/pages/about_me_page.dart';
import 'package:flutter_gallery/pages/gallery_page.dart';
import 'package:flutter_gallery/pages/image_page.dart';

class FlutterGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter gallery app",
      initialRoute: "/gallery",
      routes: {
        "/about": (context) => AboutMePage(),
        "/gallery": (context) => GalleryPage(),
      },
      theme: ThemeData(),
    );
  }
}
