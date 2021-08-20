import 'package:flutter/material.dart';
import 'package:flutter_gallery/components/drawer_header.dart';
import 'package:flutter_gallery/components/images_block.dart';

import 'package:flutter_gallery/http_service.dart';
import 'package:flutter_gallery/models/image_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool _loading = true;
  final HttpService httpService = HttpService();

  Future fakeDuration() async {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          child: Text(
            "Галерея",
            style: TextStyle(fontSize: 30),
          ),
          alignment: Alignment.centerLeft,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: httpService.getImages(),
        builder:
            (BuildContext contex, AsyncSnapshot<List<ImageModel>> snapshot) {
          fakeDuration();
          if (_loading) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              List<ImageModel>? images = snapshot.data;
              return ListView.builder(
                  itemCount: (images!.length / 6).round(),
                  itemBuilder: (_, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              ('Категория №${(index + 1).toString()}'),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          ImagesBlock(imagesBlockCount: index, images: images)
                        ],
                      ));
            }
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      drawer: DrawerPage(selectMenuItem: "Gallery"),
    );
  }
}
