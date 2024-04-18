import 'package:connector/controllers/home_controller.dart';
import 'package:connector/controllers/rooms_controller.dart';
import 'package:get/get.dart';

class RoomsBinding implements Bindings {
  @override
  void dependencies () {
    Get.lazyPut<RoomsController>(() => RoomsController());
  }
}