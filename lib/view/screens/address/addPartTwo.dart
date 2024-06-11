// ignore_for_file: body_might_complete_normally_nullable

import 'package:ecommerce_app/controller/address/AddressDetails_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widgets/auth/CustomButtonAuth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("add details address"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<AddressDetailsController>(
          builder: (controllerpage) => HandlingDataView(
            statusrequest: controllerpage.statusrequest,
            widget: ListView(
              children: [
                CustomTextFormAuth(
                  hinttext: "City name",
                  labletext: "City",
                  iconData: Icons.location_city,
                  mycontroller: controllerpage.city,
                  valid: (val) {},
                  isNumber: false,
                ),
                CustomTextFormAuth(
                  hinttext: "Street name",
                  labletext: "Street",
                  iconData: Icons.streetview,
                  mycontroller: controllerpage.street,
                  valid: (val) {},
                  isNumber: false,
                ),
                CustomTextFormAuth(
                  hinttext: "Address name",
                  labletext: "name",
                  iconData: Icons.near_me,
                  mycontroller: controllerpage.city,
                  valid: (val) {},
                  isNumber: false,
                ),
                CustomButtonAuth(
                  text: "Add",
                  onPressed: () {
                    controllerpage.addAddress();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
