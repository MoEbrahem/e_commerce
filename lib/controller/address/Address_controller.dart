// ignore_for_file: file_names

import 'dart:async';
import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  late Position position;
  CameraPosition 
    kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10,
  );
  Statusrequest statusrequest = Statusrequest.loading;
  late Completer<GoogleMapController> completerController;
  List<Marker> markers = [];
  double? lat;
  double? long;
  late LocationPermission permission;
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

   

  
  Future<void> goToTheLake() async {
    final GoogleMapController controller = await completerController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: latLng,
      ),
    );
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  getCurrentLocation() async {
    permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition();
    kGooglePlex =  CameraPosition(
    target: LatLng(position.latitude, position.longitude),
    zoom: 10,
  );
    addMarkers(LatLng(position.latitude, position.longitude));
    statusrequest = Statusrequest.none;
    update();
  }

  gotoAddDetails() {
    Get.offNamed(
      AppRoute.addressDetails,
      arguments: {
        "lat": lat.toString(),
        "long": long.toString(),
      },
    );
  }

  @override
  void onInit() async {
    await getCurrentLocation();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }

  
}
