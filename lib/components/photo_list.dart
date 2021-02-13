import 'package:flutter/material.dart';
import 'package:wallpaper/models/Photo.dart';
import 'package:wallpaper/views/image_view.dart';

class PhotoList extends StatelessWidget {
  final List<Photo> photos;

  PhotoList({@required this.photos});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 24),
        physics: ClampingScrollPhysics(),
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: photos.map((photo) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ImageView(
                  imgUrl: photo.src.portrait,
                );
              }));
            },
            child: Hero(
              tag: photo.src.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(photo.src.portrait, fit: BoxFit.cover),
                ),
              ),
            ),
          ));
        }).toList(),
      ),
    );
  }
}
