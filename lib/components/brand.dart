import 'package:flutter/material.dart';

class BrandName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Wallpaper",
          style: TextStyle(color: Colors.black87,fontFamily: "Overpass"),
        ),
        Text(
          "Hub",
          style: TextStyle(color: Colors.blue,fontFamily: "Overpass"),
        )
      ],
    );
  }
}