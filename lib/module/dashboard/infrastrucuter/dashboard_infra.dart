import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:neel_api_demo/core/constant/api_string_constant.dart';
import 'package:neel_api_demo/core/dioService/dio_instant.dart';
import 'package:neel_api_demo/module/dashboard/model/dashboard_model.dart';

abstract class DashboardInfra {
  // GET MOVIE DATA
  static Future<Either<DashboardDataModel?, String>> getDashboardData() async {
    try {
      final res = await APIDio.instance.get(
        ApiStringConst.GET_DEMO_DATA,
        queryParameters: {
          'api_key': ApiStringConst.API_KEY,
        },
      );
      final response = dashboardDataModelFromJson(jsonEncode(res.data));
      return Left(response);
    } on DioError catch (e) {
      return right(e.type.name);
    }
  }
}
