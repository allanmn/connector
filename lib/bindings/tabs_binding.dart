import 'package:connector/controllers/home_controller.dart';
import 'package:connector/controllers/tabs_controller.dart';
import 'package:get/get.dart';

class TabsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
