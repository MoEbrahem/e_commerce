// ignore_for_file: file_names

import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);

  viewData(String id) async {
    var response = await crud.postRequest(
      AppLink.viewFavorite,
      {
        'userid': id,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  delete(int favid) async {
    var response = await crud.postRequest(
      AppLink.deleteFromFavorite,
      {
        'id': favid,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
