import 'package:flutter/material.dart';
import 'package:wallpaper/api/wallpaper.dart';
import 'package:wallpaper/components/brand.dart';
import 'package:wallpaper/components/photo_list.dart';
import 'package:wallpaper/models/Photo.dart';

class CategorieView extends StatefulWidget {
  final String categorie;

  CategorieView({@required this.categorie});

  @override
  _CategorieViewState createState() => _CategorieViewState();
}

class _CategorieViewState extends State<CategorieView> {
  List<Photo> photos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategorieWallpaper(categorie: widget.categorie).then((value) {
      setState(() {
        photos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BrandName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              PhotoList(
                photos: photos ?? [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
