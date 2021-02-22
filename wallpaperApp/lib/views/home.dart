import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaperApp/data/data.dart';
import 'package:wallpaperApp/models/categories_model.dart';
import 'package:wallpaperApp/models/wallpapermodel.dart';
import 'package:wallpaperApp/views/category.dart';
// import 'package:wallpaperApp/views/img_view.dart';
import 'package:wallpaperApp/views/search.dart';
import 'package:wallpaperApp/views/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controlsearch = new TextEditingController();
  List<CategoriesModel> categories = new List.empty(growable: true);
  List<WallpaperModel> wallpapers = new List.empty(growable: true);

  // get wallpapers => null;

//Use http to get api to get trending wallpapers...

  getTrendingWallpapers() async {
    var response = await http.get(
        "https://api.pexels.com/v1/curated?per_page=600 ",
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
    getTrendingWallpapers();
    categories = getCatories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.white,
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
                        controller: controlsearch,
                        decoration: InputDecoration(
                          hintText: "search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchQuery: controlsearch.text,
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
              Container(
                height: 80,
                //
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategorieTile(
                      title: categories[index].categoriesName,
                      imgUrl: categories[index].imgUrl,
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              //Call wallpaperList Widget to display widget!!
              wallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}

class CategorieTile extends StatelessWidget {
  final String imgUrl, title;
  CategorieTile({@required this.imgUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Category(
                      categorieName: title.toLowerCase(),
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(right: 4),
          child: Stack(
            children: [
              //
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  child: Image.network(imgUrl,
                      height: 50, width: 100, fit: BoxFit.fitWidth),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white24,
                ),
                alignment: Alignment.center,
                height: 50,
                width: 100,
                child: Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 19)),
              ),
            ],
          )),
    );
  }
}
