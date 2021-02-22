import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperApp/data/data.dart';
import 'package:wallpaperApp/models/wallpapermodel.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperApp/views/search.dart';
import 'package:wallpaperApp/views/widgets/widget.dart';

class Category extends StatefulWidget {
  final String categorieName;
  Category({this.categorieName});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController controlsearchforsearchscreen =
      new TextEditingController();
  List<WallpaperModel> wallpapers = new List.empty(growable: true);

  getSerachWallpapers(String query) async {
    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1",
        headers: {"Authorization": myapiKey});

    print(response.body.toString());
    print(response.statusCode);

    //get response in jason format:Use MAP for that get it in json variable :
    setState(() {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      jsonData["photos"].forEach((element) {
        //values of photos...
        //element is a MAP
        print(element);

        //To get the elements eg :photograph_url etc:
        //Create  a Model save value to model then save that model
        //to created a List ...

        WallpaperModel wallpaperModel = new WallpaperModel();
        wallpaperModel = WallpaperModel.fromMap(element);
        wallpapers.add(wallpaperModel);
      });
    });
  }

  @override
  void initState() {
    getSerachWallpapers(widget.categorieName);
    super.initState();
    controlsearchforsearchscreen.text = widget.categorieName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controlsearchforsearchscreen,
                        decoration: InputDecoration(
                          hintText: "search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getSerachWallpapers(controlsearchforsearchscreen.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchQuery:
                                          controlsearchforsearchscreen.text,
                                    )));
                      },
                      child: Container(child: Icon(Icons.search_off_outlined)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              wallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}









// class Category extends StatefulWidget {
//   final String categorieName;
//   Category({this.categorieName});
//   @override
//   _CategoryState createState() => _CategoryState();
// }

// class _CategoryState extends State<Category> {
//   void init() {
//     getSearch(widget.categorieName);
//     controlsearch.text = widget.categorieName;

//     super.initState();
//   }

//   List<WallpaperModel> wallpapers = new List.empty(growable: true);
//   TextEditingController controlsearch = new TextEditingController();

//   getSearch(String query) async {
//     var response = await http.get(
//         "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1",
//         headers: {"Authorization": myapiKey});

//     print(response.body.toString());
//     print(response.statusCode);

//     //get response in jason format:Use MAP for that get it in json variable :
//     setState(() {
//       Map<String, dynamic> jsonData = jsonDecode(response.body);
//       jsonData["photos"].forEach((element) {
//         //values of photos...
//         //element is a MAP
//         print(element);

//         //To get the elements eg :photograph_url etc:
//         //Create  a Model save value to model then save that model
//         //to created a List ...

//         WallpaperModel wallpaperModel = new WallpaperModel();
//         wallpaperModel = WallpaperModel.fromMap(element);
//         wallpapers.add(wallpaperModel);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //  backgroundColor: Colors.white,
//         title: brandName(),
//         elevation: 0.5,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//             child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Color(0xfff5f8fd),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 24),
//               margin: EdgeInsets.symmetric(horizontal: 24),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: controlsearch,
//                       decoration: InputDecoration(
//                         hintText: "search",
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       getSearch(controlsearch.text);

//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Search(
//                                     searchQuery: controlsearch.text,
//                                   )));
//                     },
//                     child: Container(child: Icon(Icons.search_off_outlined)),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }
