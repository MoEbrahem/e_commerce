import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postRequest(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
