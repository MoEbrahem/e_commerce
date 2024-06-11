// ignore_for_file: file_names

import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postRequest(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }
  searchData(String search) async {
    var response = await crud.postRequest(AppLink.search, {"search":search});
    return response.fold((l) => l, (r) => r);
  }
}
