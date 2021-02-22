// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

class WallpaperModel {
  String photographer;
  String photographerurl;
  int photographerid;
  SrcModel src;

  WallpaperModel(
      {this.src, this.photographer, this.photographerid, this.photographerurl});

//To get json using fromMap and return wallpapermodel
  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData["src"]),
      photographer: jsonData["photographer"],
      photographerid: jsonData["photographer_id"],
      photographerurl: jsonData["photographer_url"],
    );
  }
}

//To fetch values from src key:
class SrcModel {
  SrcModel({this.original, this.small, this.portrait});
  String original;
  String small;
  String portrait;

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      original: jsonData["original"],
      small: jsonData["small"],
      portrait: jsonData["portrait"],
    );
  }
}
