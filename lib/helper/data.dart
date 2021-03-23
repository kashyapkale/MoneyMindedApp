import 'package:moneyminded/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();

  //Category1
  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1462206092226-f46025ffe607?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1053&q=80";
  category.add(categoryModel);

  //Category2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Share Market";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNoYXJlJTIwbWFya2V0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  //Category3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Crypto Currency";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1516245834210-c4c142787335?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80";
  category.add(categoryModel);

  //Category4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1496337589254-7e19d01cec44?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  return category;
}
