import 'package:ecommerce_app/view/screens/homepage.dart';
import 'package:ecommerce_app/view/screens/notification.dart';
import 'package:ecommerce_app/view/screens/offer.dart';
import 'package:ecommerce_app/view/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listpages = [
    const HomePage(),
    
    const NotificationScreen(),

    Settings(),

    const OfferView()
    
  ];

  List bottomAppBar = [
    {
      "title": "Home",
      "Icon" : Icons.home,
    },
    {
      "title": "Notification",
      "Icon" : Icons.notifications_active_outlined,
    },
    {
      "title": "Settings",
      "Icon" : Icons.settings,
    },
    {
      "title": "Offers",
      "Icon" : Icons.percent_outlined,
    },
    
  ];
  

  @override
  changepage(int i) {
    currentpage = i;
    update();
  }
}
