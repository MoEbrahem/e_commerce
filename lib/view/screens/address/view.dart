import 'package:ecommerce_app/controller/address/view_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/data/model/addressModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addAddress);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Address"),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) {
          return HandlingDataView(
            statusrequest: controller.statusrequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardAddress(
                  addressModel: controller.data[index],
                  onDelete: () {
                    controller.deleteAddress(
                        controller.data[index].addressId.toString());
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress(
      {super.key, required this.addressModel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline),
          ),
          title: Text(
            "${addressModel.addressName}",
          ),
          subtitle: Text(
            "${addressModel.addressStreet} ${addressModel.addressCity}",
          ),
        ),
      ),
    );
  }
}
