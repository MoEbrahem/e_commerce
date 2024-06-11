import 'package:ecommerce_app/controller/orders/archive_controller.dart';
import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/constants/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

// show the dialog
void showRatingDialog(BuildContext context, String orderid) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),

      // your app's logo?
      image: Image.asset(
        AppImageAssets.ImageAssetsLogo,
        width: 200,
        height: 200,
      ),
      submitButtonText: 'Submit',
      submitButtonTextStyle: const TextStyle(color: AppColor.primaryColor),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ArchiveOrdersController archiveOrdersController = Get.find();
        archiveOrdersController.submitRating(
            orderid, response.comment, response.rating.toString());
        // print('rating: ${response.rating}, comment: ${response.comment}');
      },
    ),
  );
}
