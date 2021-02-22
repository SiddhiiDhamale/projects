import 'package:wallpaperApp/models/categories_model.dart';

String myapiKey = "563492ad6f91700001000001ce4bde39cd24477c973beedc36667ac2";

List<CategoriesModel> getCatories() {
  List<CategoriesModel> categories = new List.empty(growable: true);
  CategoriesModel categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/2218344/pexels-photo-2218344.jpeg?cs=srgb&dl=pexels-ekrulila-2218344.jpg&fm=jpg";
  categoriesModel.categoriesName = "street art";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/6270376/pexels-photo-6270376.jpeg?cs=srgb&dl=pexels-eva-elijas-6270376.jpg&fm=jpg";
  categoriesModel.categoriesName = "nature";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/879109/pexels-photo-879109.jpeg?cs=srgb&dl=pexels-hitesh-choudhary-879109.jpg&fm=jpg";
  categoriesModel.categoriesName = "coding";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/1694900/pexels-photo-1694900.jpeg?cs=srgb&dl=pexels-mwabonje-1694900.jpg&fm=jpg";
  categoriesModel.categoriesName = "music";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/1694900/pexels-photo-1694900.jpeg?cs=srgb&dl=pexels-mwabonje-1694900.jpg&fm=jpg";
  categoriesModel.categoriesName = "Music";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;
}
