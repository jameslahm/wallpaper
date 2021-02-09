import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper/models/Photo.dart';

const API_KEY = "563492ad6f917000010000012aa25b77fc12463cbfe29a691eaa9642";

class PhotoService {

  static String baseUrl = "https://api.pexels.com/v1/";

  static Future<List<Photo>> getTrendingWallpaper({int numOfImages}) async {
    return  await http.get("${baseUrl}curated?per_page=$numOfImages&page=1",
    headers: {
      "Authorization":API_KEY
    }).then((value){
      List<Photo> photos = new List();

      Map<String,dynamic> photosJson = jsonDecode(value.body);
      photosJson["photos"].forEach((photoJson){
        photos.add(Photo.fromMap(photoJson));
      });

      return photos;
    });
  }
}