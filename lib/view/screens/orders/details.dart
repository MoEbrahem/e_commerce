import 'package:ecommerce_app/controller/orders/orderDetails_Controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Orders Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrderDetailsController>(
          builder: (controller) => HandlingDataView(
            statusrequest: controller.statusrequest,
            widget: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              const TableRow(
                                children: [
                                  Text(
                                    "Items",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor),
                                  ),
                                  Text(
                                    "QNT",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor),
                                  ),
                                  Text(
                                    "Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor),
                                  ),
                                ],
                              ),
                              ...List.generate(
                                controller.data.length,
                                (index) => TableRow(
                                  children: [
                                  Text(
                                    "${controller.data[index].itemsName}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].itemcount}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].itemprice}",
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "${controller.ordersModel.ordersTotalprice}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: ListTile(
                      title: const Text("Shipping Address"),
                      subtitle: Text(
                          "${controller.ordersModel.addressStreet} ${controller.ordersModel.addressCity}"),
                    ),
                  ),
                if (controller.ordersModel.ordersType == "0")
                  Container(
                    height: 400,
                    width: 300,
                    padding: const EdgeInsets.all(10),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: controller.cameraPosition!,
                      gestureRecognizers:
                        <Factory<OneSequenceGestureRecognizer>>{
                        Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                        ),
                      },
                      onMapCreated: (GoogleMapController mapcontroller) {
                        controller.completerController.complete(mapcontroller);
                      },
                      markers: controller.markers.toSet(),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
