import 'dart:convert';

import 'package:http/http.dart';

import 'models/image_model.dart';

class HttpService {
  final url = "https://jsonplaceholder.typicode.com/photos?_start=0&_limit=24";
  Future<List<ImageModel>> getImages() async {
    Response res = await get(Uri.parse(url));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<ImageModel> images =
          body.map((dynamic item) => ImageModel.fromJson(item)).toList();

      return images;
    } else {
      throw "Can't get images.";
    }
  }

  Future<ImageModel> getImage(int idImage) async {
    final urlImage =
        Uri.parse("https://jsonplaceholder.typicode.com/photos/${idImage}");
    Response res = await get(urlImage);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      var image = ImageModel.fromJson(body);

      return image;
    } else {
      throw "Can't get image.";
    }
  }
}
