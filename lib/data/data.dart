import 'package:photowall/model/categories_model.dart';

String apiKey = "563492ad6f91700001000001db884d97c1774021bbdae652ec467899";

List<CatergoriesModel> getCategories() {
  List<CatergoriesModel> categories = new List();
  CatergoriesModel catergoriesModel = new CatergoriesModel();

  //First Category
  catergoriesModel.imageUrl = "https://images.pexels.com/photos/730896/pexels-photo-730896.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catergoriesModel.categoryName = "Animals";
  categories.add(catergoriesModel);
  catergoriesModel = new CatergoriesModel();

  //Second Category
  catergoriesModel.imageUrl = "https://images.pexels.com/photos/166277/pexels-photo-166277.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catergoriesModel.categoryName = "Art";
  categories.add(catergoriesModel);
  catergoriesModel = new CatergoriesModel();

  //Third Category
  catergoriesModel.imageUrl = "https://images.pexels.com/photos/952670/pexels-photo-952670.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catergoriesModel.categoryName = "Dark";
  categories.add(catergoriesModel);
  catergoriesModel = new CatergoriesModel();

  //Fourth Category
  catergoriesModel.imageUrl = "https://images.pexels.com/photos/1820770/pexels-photo-1820770.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catergoriesModel.categoryName = "Motivation";
  categories.add(catergoriesModel);
  catergoriesModel = new CatergoriesModel();

  //Fifth Category
  catergoriesModel.imageUrl = "https://images.pexels.com/photos/234273/pexels-photo-234273.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catergoriesModel.categoryName = "Minimalisism";
  categories.add(catergoriesModel);
  catergoriesModel = new CatergoriesModel();

  //Sixth Category
  catergoriesModel.imageUrl = "https://images.pexels.com/photos/807598/pexels-photo-807598.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catergoriesModel.categoryName = "Nature";
  categories.add(catergoriesModel);
  catergoriesModel = new CatergoriesModel();

  //Seventh Category
  catergoriesModel.imageUrl = "https://images.pexels.com/photos/842339/pexels-photo-842339.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catergoriesModel.categoryName = "People";
  categories.add(catergoriesModel);
  catergoriesModel = new CatergoriesModel();

  return categories;
}