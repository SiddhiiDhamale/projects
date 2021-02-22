// import 'dart:typed_data';
// import 'dart:ui' as ui;

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Save image to gallery',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   GlobalKey _globalKey = GlobalKey();

//   get ImageGallerySaver => null;

//   @override
//   void initState() {
//     super.initState();

//     _requestPermission();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Save image to gallery"),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               RepaintBoundary(
//                 key: _globalKey,
//                 child: Container(
//                   width: 200,
//                   height: 200,
//                   color: Colors.red,
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 15),
//                 child: RaisedButton(
//                   onPressed: _saveScreen,
//                   child: Text("Save Local Image"),
//                 ),
//                 width: 200,
//                 height: 44,
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 15),
//                 child: RaisedButton(
//                   onPressed: _getHttp,
//                   child: Text("Save network image"),
//                 ),
//                 width: 200,
//                 height: 44,
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 15),
//                 child: RaisedButton(
//                   onPressed: _saveVideo,
//                   child: Text("Save network video"),
//                 ),
//                 width: 200,
//                 height: 44,
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 15),
//                 child: RaisedButton(
//                   onPressed: _saveGif,
//                   child: Text("Save Gif to gallery"),
//                 ),
//                 width: 200,
//                 height: 44,
//               ),
//             ],
//           ),
//         ));
//   }

//   _requestPermission() async {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.storage,
//     ].request();

//     final info = statuses[Permission.storage].toString();
//     print(info);
//     _toastInfo(info);
//   }

//   _saveScreen() async {
//     RenderRepaintBoundary boundary =
//         _globalKey.currentContext.findRenderObject();
//     ui.Image image = await boundary.toImage();
//     ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     final result =
//         await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
//     print(result);
//     _toastInfo(result.toString());
//   }

//   _getHttp() async {
//     var response = await Dio().get(
//         "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
//         options: Options(responseType: ResponseType.bytes));
//     final result = await ImageGallerySaver.saveImage(
//         Uint8List.fromList(response.data),
//         quality: 60,
//         name: "hello");
//     print(result);
//     _toastInfo("$result");
//   }

//   _saveGif() async {
//     var appDocDir = await getTemporaryDirectory();
//     String savePath = appDocDir.path + "/temp.gif";
//     String fileUrl =
//         "https://hyjdoc.oss-cn-beijing.aliyuncs.com/hyj-doc-flutter-demo-run.gif";
//     await Dio().download(fileUrl, savePath);
//     final result = await ImageGallerySaver.saveFile(savePath);
//     print(result);
//     _toastInfo("$result");
//   }

//   _saveVideo() async {
//     var appDocDir = await getTemporaryDirectory();
//     String savePath = appDocDir.path + "/temp.mp4";
//     String fileUrl =
//         "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4";
//     await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
//       print((count / total * 100).toStringAsFixed(0) + "%");
//     });
//     final result = await ImageGallerySaver.saveFile(savePath);
//     print(result);
//     _toastInfo("$result");
//   }

//   _toastInfo(String info) {
//     Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
//   }
// }




//===============================================
 // Future _save(String imgUrl) async {
  //   // var filePath) async {
  //   // await _askPermission();
  //   // ImagePicker imagePicker;
  //   //= new ImagePicker();
  //   try {
  //     var response = await Dio().get(
  //       widget.imgView,
  //       options: Options(responseType: ResponseType.bytes),
  //     );
  //     //FolderFileSaver.save;
  //       final dir = await p.getTemporaryDirectory();

  //     final result =
  //         await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
  //     print(result);

  //     print("This is reponse data " + response.data);
  //     print(response);
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       print(e.response.data);
  //       print(e.response.request);
  //       print(e.response.headers);
  //     } else {
  //       print(e.request);
  //       print(e.message);
  //     }
  //   }
  // var image = await ImagePicker.get(source: imgUrl);
  // // (source: imageSource);

  // setState(() {
  //   _image = image;
  // });

  // final String path = await getApplicationDocumentsDirectory().path;

  //Navigator.pop();
//}

// _askPermission() async {
//  // Permissions permission;
//   //final status = await permission.request();



// }


//  Future<void> _askPermissions() async {
//     PermissionStatus permissionStatus = await _getContactPermission();
//     if (permissionStatus != PermissionStatus.granted) {
//       _handleInvalidPermissions(permissionStatus);
//     }
//   }

//   Future<PermissionStatus> _getContactPermission() async {
//     PermissionStatus permission = await PermissionHandler()
//         .checkPermissionStatus(PermissionGroup.contacts);
//     if (permission != PermissionStatus.granted &&
//         permission != PermissionStatus.disabled) {
//       Map<PermissionGroup, PermissionStatus> permissionStatus =
//           await PermissionHandler()
//               .requestPermissions([PermissionGroup.contacts]);
//       return permissionStatus[PermissionGroup.contacts] ??
//           PermissionStatus.unknown;
//     } else {
//       return permission;
//     }
//   }

//   void _handleInvalidPermissions(PermissionStatus permissionStatus) {
//     if (permissionStatus == PermissionStatus.denied) {
//       throw PlatformException(
//           code: "PERMISSION_DENIED",
//           message: "Access to location data denied",
//           details: null);
//     } else if (permissionStatus == PermissionStatus.disabled) {
//       throw PlatformException(
//           code: "PERMISSION_DISABLED",
//           message: "Location data is not available on device",
//           details: null);
//     }
//   }

  //   var mediaStorage = await Permission.photos.status;
  //   print(mediaStorage);

  //   if (Platform.isIOS) {
  //     Permission.photos.request();

  //     if (!mediaStorage.isGranted) {
  //       await Permission.photos.request();
  //     } else {
  //       Text("Needs To Access Photos To save The Image ");
  //     }
  //   }
  // }





// _askPermission() {
// }

// Future<Map<PermissionGroup, PermissionStatus>> requestPermissions(
//   static const PermissionGroup photos = PermissionGroup._(9);

//     List<PermissionGroup> permissions) async {
//   final List<int> data = Codec.encodePermissionGroups(permissions);
//   final Map<dynamic, dynamic> status =
//       await _methodChannel.invokeMethod('requestPermissions', data);

//   return Codec.decodePermissionRequestResult(Map<int, int>.from(status));
// }



// _askPermission() async {
//   // final Permission _permission;
//   // PermissionStatus _permissionStatus = PermissionStatus.undetermined;

//   if (Platform.isIOS) {
//     var PermissionGroup;
//     Map< PermissionStatus> permissions =
//         await PermissionHandler().requestPermissions([PermissionGroup.photos]);
//   } else {
//     PermissionStatus permission = await PermissionHandler()
//         .checkPermissionStatus(PermissionGroup.storage);
//   }
// }


// _save(String imgUrl) async {
  //   PickedFile _imagefile;
  //   ImagePicker imagePicker = new ImagePicker();
  //   PickedFile file = await _save(widget.imgView);
  //   if (file != null) {

  //   }
  // }


   // _saveImage() async {
  //   //  _getHttp() async {
  //   var response = await Dio().get(
  //       "https://images.pexels.com/photos/4427498/pexels-photo-4427498.jpeg?cs=srgb&dl=pexels-august-de-richelieu-4427498.jpg&fm=jpg",
  //       options: Options(responseType: ResponseType.bytes));
  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(response.data),
  //       quality: 60,
  //       name: "hello");
  //   print(result);
  //   //_toastInfo("$result");
  //   //}
  // }


//  try {
//     var imageId = await ImageDownloader.downloadImage(widget.imgView);
//     var path = await ImageDownloader.findPath(imageId);
//     files.add(File(path));
//   } catch (error) {
//     print(error);
//   }
// }

  //   //  Function file,
  //   //  {bool isReturnPathOfIOS = false
  //   Response response = await Dio().download(
  //       imgUrl,
  //       Options(
  //         responseType: ResponseType.bytes,

  //       ));
  //   //  assert(file != null);

  //   final result = await ImageGallerySaver.saveImage(
  //     Uint8List.fromList(response.data),
  //     //  'saveFileToGallery', <String, dynamic>{

  //     //    'isReturnPathOfIOS': isReturnPathOfIOS
  //     //  }  print(result);
  //   );
  //   return result;
  // }


