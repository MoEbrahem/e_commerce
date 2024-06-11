import 'package:ecommerce_app/controller/address/Address_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<AddAddressController>(
            builder: (controllerpage) => HandlingDataView(
                  statusrequest: controllerpage.statusrequest,
                  widget: Column(
                    children: [
                      if (controllerpage.kGooglePlex != null)
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              GoogleMap(                                
                                padding: const EdgeInsets.all(10),
                                mapType: MapType.normal,
                                initialCameraPosition:
                                    controllerpage.kGooglePlex!,
                                onMapCreated:
                                    (GoogleMapController mapcontroller) {
                                  controllerpage.completerController!
                                      .complete(mapcontroller);
                                },
                                markers: controllerpage.markers.toSet(),
                                onTap: (latlong) {
                                  controllerpage.addMarkers(latlong);
                                },
                              ),
                              Positioned(
                                bottom: 10,
                                child: MaterialButton(
                                  onPressed: () {
                                    controllerpage.gotoAddDetails();
                                  },
                                  minWidth: 200,
                                  color: AppColor.primaryColor,
                                  textColor: Colors.white,
                                  child: const Text(
                                    "Continue",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                )),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
