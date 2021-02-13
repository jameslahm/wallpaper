import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/views/categorie_view.dart';

class CategorieTile extends StatelessWidget {
  final String imgUrl, categorieName;

  CategorieTile({@required this.imgUrl, @required this.categorieName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategorieView(
                  categorie: categorieName,
                )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(8)),
            ),
            Container(
              height: 50,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                categorieName ?? "Yo Yo",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Overpass"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
