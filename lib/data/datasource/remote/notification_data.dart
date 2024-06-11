import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkurl.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData(String userid)async {
    var response =await crud.postRequest(
      AppLink.notification,
      {"userid": userid},
    );
    return response.fold((l) => l, (r) => r);
  }
}
