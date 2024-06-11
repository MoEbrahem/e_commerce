import 'package:get/get.dart';

ValidInput(String val, int min, int max, String type) {
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'In Valid email';
    }
  }
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'In Valid username';
    }
  }
  if (type == 'PhoneNumber') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'In Valid PhoneNumber';
    }
  }
  
  if (val.isEmpty) {
    return "Can't be Empty";
  }

  if (val.length < min) {
    return "Can't be less than $min";
  }
  if (val.length > max) {
    return "Can't be more than $max";
  }

}
