import 'package:news_app/models/category.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> myCategories = List<CategoryModel>();
  CategoryModel categoryModel;

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "World";
  categoryModel.imageAssetUrl =
      "https://image.freepik.com/free-photo/business-people-reading-newspaper_53876-14764.jpg";
  myCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageAssetUrl =
      "https://cinitaslifestyle.com/wp-content/uploads/2019/09/business-3224643_1920.jpg";
  myCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageAssetUrl =
      "https://mapworldgroup.com/wp-content/uploads/2019/10/Entertainment.jpg";
  myCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageAssetUrl = "https://eskipaper.com/images/spices-1.jpg";
  myCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageAssetUrl = "https://wallpaperaccess.com/full/1325087.jpg";
  myCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageAssetUrl = "https://vistapointe.net/images/boxing-3.jpg";
  myCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1555066931-4365d14bab8c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80";
  myCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Politics";
  categoryModel.imageAssetUrl = "https://vistapointe.net/images/politics-2.jpg";
  myCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Food";
  categoryModel.imageAssetUrl = "https://vistapointe.net/images/food-4.jpg";
  myCategories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Travel";
  categoryModel.imageAssetUrl = "https://vistapointe.net/images/travel-7.jpg";
  myCategories.add(categoryModel);

  return myCategories;
}
