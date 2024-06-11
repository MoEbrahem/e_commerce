import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class CheckOutData {
  Crud crud;

  CheckOutData(this.crud);

  checkOutData(Map data) async {
    var response = await crud.postRequest(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
