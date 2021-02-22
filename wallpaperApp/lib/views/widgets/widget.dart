import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperApp/models/wallpapermodel.dart';
import 'package:wallpaperApp/views/img_view.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black87),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue),
      ),
    ],
  );
}

Widget wallpaperList(
  {
  List<WallpaperModel> wallpapers,
  context,
})
{
  // var wallpapers;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      //By defualt it is vertical make it horizontal and display 2 images per row
      crossAxisCount: 2,
      //for vertical display of image ...provides width...
      childAspectRatio: 0.6,
      //
      crossAxisSpacing: 6.0,

      mainAxisSpacing: 6.0,

      //TODO ;Make a Note!!!!!!!!!!!!!!!! OF children:wallpaper.map(()  {})
      children:
       wallpapers.map(    (wallpaper)
       {
        return GridTile(
          child: GestureDetector(
            onDoubleTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImgView(
                          //setState((){
                          imgView: wallpaper.src.portrait
                          //  ),)
                          )));
            },

            //TODO : What is use of hero tag!!!
            child: Hero(
            
              tag:wallpaper.src.portrait,
              child: Container(
                //getter Method...
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(
                      image: NetworkImage(wallpaper.src.portrait),
                      fit: BoxFit.cover),
                ),
              ),
              
            ),
            
          ),
        );
      }).toList(),
    ),
  );
}
