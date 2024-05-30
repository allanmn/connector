import 'package:connector/controllers/home_controller.dart';
import 'package:connector/controllers/report_controller.dart';
import 'package:get/get.dart';

class ReportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportController>(() => ReportController());
  }
}
