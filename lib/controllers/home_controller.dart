import 'package:connector/repositories/rooms_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var roomsRepository = Get.find<RoomsRepository>();

  @override
  void onInit() async {
    super.onInit();

    await getRooms();
  }

  getRooms() async {
    await roomsRepository.getAll();
  }
}
