import 'package:flutter/material.dart';
import 'package:flutter_gallery/components/drawer_header.dart';
import 'package:flutter_gallery/components/images_block.dart';

import 'package:flutter_gallery/http_service.dart';
import 'package:flutter_gallery/models/image_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImagePage extends StatefulWidget {
  ImagePage({required this.idImage});
  final int idImage;
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
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
        future: httpService.getImage((widget.idImage).toInt()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          fakeDuration();
          if (_loading) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              var image = snapshot.data;
              return Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(image.url),
                      width: 300,
                      height: 300,
                    ),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "albumId: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25)),
                      TextSpan(
                          text: image.albumId.toString(),
                          style:
                              TextStyle(fontSize: 25, color: Colors.grey[400]))
                    ])),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "ID картинки: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25)),
                      TextSpan(
                          text: image.id.toString(),
                          style:
                              TextStyle(fontSize: 25, color: Colors.grey[400]))
                    ])),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Заголовок: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25)),
                      TextSpan(
                          text: image.title,
                          style:
                              TextStyle(fontSize: 25, color: Colors.grey[400]))
                    ])),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Ссылка на картинку: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25)),
                      TextSpan(
                          text: image.url,
                          style:
                              TextStyle(fontSize: 25, color: Colors.grey[400]))
                    ])),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, "/gallery")},
                      child: const Text(
                        'НАЗАД',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      drawer: DrawerPage(selectMenuItem: "Gallery"),
    );
  }
}
