import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class OfferData {
  Crud crud;
  OfferData(this.crud);

  getData() async {
    var response = await crud.postRequest(AppLink.offer, {});
    return response.fold((l) => l, (r) => r);
  }
}
