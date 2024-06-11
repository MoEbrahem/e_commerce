import 'package:ecommerce_app/core/class/Statusrequest.dart';
import 'package:ecommerce_app/core/constants/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageAssets.Loading, width: 250, height: 250))
        : statusrequest == Statusrequest.serverFailure
            ? Center(
                child: Lottie.asset(AppImageAssets.ServerError,
                    width: 250, height: 250))
            : statusrequest == Statusrequest.offlineFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.Offline,
                        width: 250, height: 250))
                : statusrequest == Statusrequest.failure
                    ? Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: Lottie.asset(AppImageAssets.NoData,
                              width: 250, height: 250),
                        ),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageAssets.Loading, width: 250, height: 250))
        : statusrequest == Statusrequest.serverFailure
            ? Center(
                child: Lottie.asset(AppImageAssets.ServerError,
                    width: 250, height: 250))
            : statusrequest == Statusrequest.offlineFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.Offline,
                        width: 250, height: 250))
                : widget;
  }
}

// : statusrequest == Statusrequest.checkout
//         ? Center(
//             child:
//                 Lottie.asset(AppImageAssets.chechoutsuccess, width: 250, height: 250))
        