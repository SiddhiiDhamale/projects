// import 'package:contacts_service_example/contacts_list_page.dart';
// import 'package:contacts_service_example/contacts_picker_page.dart';

// import 'dart:io';
// import 'dart:typed_data';

// import 'package:dio/dio.dart';
// import 'dart:typed_data';

// import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
// import 'package:http/http.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_downloader/image_downloader.dart';

class ImgView extends StatefulWidget {
  final String imgView;
  // final Permission permission;

  ImgView({@required this.imgView});

  @override
  _ImgViewState createState() => _ImgViewState();
}

class _ImgViewState extends State<ImgView> {
  var filePath;
  var p;

  Function path = () {
    final dir = getTemporaryDirectory();
    print(dir);
    return dir;
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgView,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                child: Image.network(
                  widget.imgView,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _saveImage();
                      Navigator.pop(context);
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,

                          //TODO:   .withOpacity()
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.white60, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff1C1B1B).withOpacity(0.8),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white60, width: .6),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                Color(0x36FFFFFF),
                                Color(0x0FFFFFFF),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Save Image",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "Set The Image As Wallpaper",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  _saveImage() async {
    setState(() {
      print("I am widget.image" + widget.imgView);
    });

// //await _askPermission().getPermission().then((statusPermission) async {
//     // if (statusPermission == 0) {
//     String result;
//     // Future dir;
//     //  setState(() async {
//     //   dir =await  p.getTemporaryDirectory();
//     // });
//     final dir = await p.getTemporaryDirectory();/
// String dir= "/storage/emulated/0/wallpaperApp/";
//    String pathImage = dir + ('example_image.png');

//     try {
//       await Dio().download(widget.imgView, pathImage,
//         //  onReceiveProgress: (rec, total) {
//         // setState(() {
//         //   String progress = "0";
//         //   progress = ((rec / total) * 100).toStringAsFixed(0) + "%";
//         //   print(progress);
//         // });
//     //  }
//       );
//       // if you want to get original of Image
//       // don't give a value of width or height
//       // cause default is return width = 0, height = 0
//       // which will make it to get the original image
//       // just write like this
    //  String  result = await ImageGallerySaver.saveImage(
    //    Uint8List.fromList()
    //  );
//     } catch (e) {
//       result = e;
//     }
    // print(result);
//   }

    // _askPermission() {
    //   return true;

//   static Future _saveImage(
//     String imgUrl,
//   ) async {
    String albumName = 'Media';
// //void _saveNetworkImage() async {
    String path = widget.imgView + ".jpg";
    //'https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg';

    // widget.imgView;
//     // 'https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg';
//ImageGallerySaver.saveImage(imgUrl);
    GallerySaver.saveImage(path, albumName: albumName).then((bool success) {
//      {
//     //  setState(() {
      print('Image is saved');
//     //  });
      // }
    });
  }
}

 