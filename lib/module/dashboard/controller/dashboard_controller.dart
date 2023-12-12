import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:neel_api_demo/module/dashboard/model/dashboard_model.dart';

import '../infrastrucuter/dashboard_infra.dart';

class DashboardController extends GetxController {
  // SCREEN DATA
  Rx<DashboardDataModel?> dashboardData = Rx(null);

  // LOADER .
  RxBool isFetchingDashboardData = false.obs;

  // GET DATA
  Future<void> getDashboardData({required BuildContext context}) async {
    isFetchingDashboardData.value = true;

    Either<DashboardDataModel?, String> failOrSuccess =
        await DashboardInfra.getDashboardData();

    // SUCCESS PART
    failOrSuccess.fold(
      (success) {
        dashboardData.value = success;
        // ERROR PART
      },
      (errorMsg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
          ),
        );
      },
    );
    isFetchingDashboardData.value = false;
  }
}
