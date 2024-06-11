// ignore_for_file: file_names

import 'dart:async';
import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  Position? position;
  Statusrequest statusrequest = Statusrequest.loading;
  Completer<GoogleMapController>? completerController;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;
  LocationPermission? permission;

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
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statusrequest = Statusrequest.none;
    update();
  }

  gotoAddDetails() {
    Get.toNamed(
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
