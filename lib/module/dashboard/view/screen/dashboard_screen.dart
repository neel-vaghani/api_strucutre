import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:neel_api_demo/module/dashboard/dependency/dashboard_dependency.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // GET DASHBOARD DATA
    kDashboardController.getDashboardData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TMDB Data",
        ),
      ),
      body: Obx(
        () => kDashboardController.isFetchingDashboardData.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Text(
                    kDashboardController.dashboardData.value?.originalTitle ??
                        '',
                  ),
                ],
              ),
      ),
    );
  }
}
