import 'package:ecommerce_app/controller/orders/archive_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widgets/orders/CustomCardArchiveOrder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrder extends StatelessWidget {
  const ArchiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archive"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<ArchiveOrdersController>(
          builder: (controller) => HandlingDataView(
            statusrequest: controller.statusrequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardArchiveOrdersList(
                  listdata: controller.data[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

