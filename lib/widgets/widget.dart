import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photowall/model/wallpaper_model.dart';
import 'package:photowall/views/image_view.dart';

Widget brandName() {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(text: 'Photo', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20)),
        TextSpan(text: 'Wall', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.teal, fontSize: 20)),
      ],
    ),
  );
}

Widget wallpaperList(List<WallpaperModel> wallpapers, context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      children: wallpapers.map((e) {
        return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImageView(
                  imageUrl: e.src.portrait,
                )));
              },
              child: Hero(
                tag: e.src.portrait,
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(e.src.portrait, fit: BoxFit.cover,)
                  ),
                ),
              ),
            )
        );
      }).toList(),
    ),
  );
}