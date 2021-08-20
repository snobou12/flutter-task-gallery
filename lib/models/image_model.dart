class ImageModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  ImageModel(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
        albumId: json["albumId"] as int,
        id: json["id"] as int,
        thumbnailUrl: json["thumbnailUrl"] as String,
        title: json["title"] as String,
        url: json["url"] as String);
  }
}
