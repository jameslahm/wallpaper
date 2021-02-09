import 'package:wallpaper/models/PhotoSrc.dart';

class Photo {
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;

  PhotoSrc src;

  Photo({
    this.url,
    this.photographer,
    this.photographerId,
    this.photographerUrl,
    this.src
  });

  factory Photo.fromMap(Map<String,dynamic> photoJson){
    return Photo(
      url: photoJson["url"],
      photographer: photoJson["photographer"],
      photographerId: photoJson["photographer_id"],
      photographerUrl: photoJson["photographer_url"],
      src: PhotoSrc.fromMap(photoJson["src"])
    );
  }
}