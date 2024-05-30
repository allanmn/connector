import 'package:connector/controllers/home_controller.dart';
import 'package:connector/controllers/report_controller.dart';
import 'package:connector/controllers/rooms_controller.dart';
import 'package:connector/controllers/tabs_controller.dart';
import 'package:connector/repositories/rooms_repository.dart';
import 'package:get/get.dart';

class TabsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<RoomsController>(() => RoomsController());

    Get.lazyPut<ReportController>(() => ReportController());
    Get.lazyPut<RoomsRepository>(() => RoomsRepository());
  }
}
