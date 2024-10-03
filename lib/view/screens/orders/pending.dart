import 'package:ecommerce_app/controller/orders/pending_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widgets/orders/CustomCardOrder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<PendingOrdersController>(
          builder: (controller) => HandlingDataView(
            statusrequest: controller.statusrequest,
            widget:controller.data.isNotEmpty ? ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardOrdersList(
                  listdata: controller.data[index],
                );
              },
            ): const Center(
              child: Text("There is no Pending Orders Now"),
            ),
          ),
        ),
      ),
    );
  }
}

