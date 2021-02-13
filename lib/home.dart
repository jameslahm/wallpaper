import 'package:flutter/material.dart';
import 'package:wallpaper/components/brand.dart';
import 'package:wallpaper/components/categorie_tile.dart';
import 'package:wallpaper/components/photo_list.dart';
import 'package:wallpaper/models/Photo.dart';
import 'package:wallpaper/services/categorie_service.dart';
import 'package:wallpaper/services/photo_service.dart';
import 'package:wallpaper/components/search.dart';
import 'package:wallpaper/views/search_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategorieService _categorieService;
  List<Photo> photos;
  int numOfImages = 30;

  @override
  void initState() {
    super.initState();
    _categorieService = CategorieService();
    print("$_categorieService");

    getTrendingWallpaper(numOfImages: numOfImages).then((value) {
      setState(() {
        photos = value;
      });
    }).catchError((err) {
      print("$err");
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = _categorieService.categories;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BrandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SearchBar(onTap: (TextEditingController _controller) {
                if (_controller.text != "") {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SearchView(initialText: _controller.text);
                  }));
                }
              }),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategorieTile(
                        imgUrl: categories[index].imgUrl,
                        categorieName: categories[index].categorieName);
                  },
                ),
              ),
              PhotoList(photos: photos ?? [])
            ],
          ),
        ),
      ),
    );
  }
}
