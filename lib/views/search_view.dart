import 'package:flutter/material.dart';
import 'package:wallpaper/components/brand.dart';
import 'package:wallpaper/components/photo_list.dart';
import 'package:wallpaper/components/search.dart';
import 'package:wallpaper/models/Photo.dart';
import 'package:wallpaper/services/photo_service.dart';

class SearchView extends StatefulWidget {
  final String initialText;

  SearchView({this.initialText});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Photo> photos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchWallpaper(searchQuery: widget.initialText).then((value) {
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SearchBar(
                onTap: (TextEditingController controller) {
                  getSearchWallpaper(searchQuery: controller.text)
                      .then((value) {
                    print("Hello $value");
                    setState(() {
                      photos = value;
                    });
                  });
                },
                initialText: widget.initialText,
              ),
              SizedBox(
                height: 8,
              ),
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
