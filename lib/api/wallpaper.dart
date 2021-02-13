import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper/models/Photo.dart';

const API_KEY = "563492ad6f917000010000012aa25b77fc12463cbfe29a691eaa9642";
const API_BASE_URL = "https://api.pexels.com/v1/";

Future<List<Photo>> getCategorieWallpaper({String categorie}) async {
  return await http.get(
      "${API_BASE_URL}search?query=$categorie&per_page=30&page=1",
      headers: {"Authorization": API_KEY}).then((value) {
    return parsePhotos(value.body);
  });
}

List<Photo> parsePhotos(String body) {
  List<Photo> photos = new List();
  Map<String, dynamic> photosJson = jsonDecode(body);
  photosJson["photos"].forEach((photoJson) {
    photos.add(Photo.fromMap(photoJson));
  });

  return photos;
}

Future<List<Photo>> getTrendingWallpaper({int numOfImages}) async {
  return await http.get("${API_BASE_URL}curated?per_page=$numOfImages&page=1",
      headers: {"Authorization": API_KEY}).then((value) {
    List<Photo> photos = parsePhotos(value.body);
    return photos;
  });
}

Future<List<Photo>> getSearchWallpaper({String searchQuery}) async {
  return await http.get(
      "${API_BASE_URL}search?query=$searchQuery&per_page=30&page=1",
      headers: {"Authorization": API_KEY}).then((value) {
    return parsePhotos(value.body);
  });
}
