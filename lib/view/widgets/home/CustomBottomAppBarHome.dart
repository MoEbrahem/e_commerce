import 'package:ecommerce_app/controller/homeScreen_controller.dart';
import 'package:ecommerce_app/view/widgets/home/CustomButtonAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        
        shape: const CircularNotchedRectangle(),
        notchMargin: Get.width/35,
        child: Row(
                    
          children: [
            ...List.generate(
              controller.listpages.length + 1,
              (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : Expanded(
                      child: CustomButtonAppBar(
                          onPressed: () {
                            controller.changepage(i);
                          },
                          textbutton: controller.bottomAppBar[i]["title"],
                          iconData: controller.bottomAppBar[i]["Icon"],
                          active: controller.currentpage == i ? true : false,
                        ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
