import 'dart:io';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/api/wallpaper.dart';
import 'package:wallpaper/components/brand.dart';
import 'package:wallpaper/size_config.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({@required this.imgUrl});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BrandName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl,
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child: CachedNetworkImage(
                imageUrl: widget.imgUrl,
                placeholder: (context, url) => Container(
                  color: Color(0xfff5f8fd),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    _saveImg().then((_) {
                      _showToast();
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff1c1b1b).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16)),
                        width: SizeConfig.screenWidth / 2,
                        height: 40,
                      ),
                      Container(
                        width: SizeConfig.screenWidth / 2,
                        height: 40,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Set Wallpaper",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Image will sabed in gallery",
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white70),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _saveImg() async {
    await _askPermission();
    http.Response response = await http.get(widget.imgUrl);
    await ImageGallerySaver.saveImage(response.bodyBytes);
    Navigator.pop(context);
  }

  void _showToast() {
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.greenAccent, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            height: 12.0,
          ),
          Text("Set Successfully")
        ],
      ),
    );

    FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(child: toast, toastDuration: Duration(seconds: 5));
  }

  Future<void> _askPermission() async {
    await [Permission.storage].request();
  }
}
