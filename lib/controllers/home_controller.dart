import 'package:connector/models/room.dart';
import 'package:connector/repositories/rooms_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var roomsRepository = Get.find<RoomsRepository>();

  final best5GVelocity = Rxn<Room>();
  final worst5GVelocity = Rxn<Room>();
  final best2GVelocity = Rxn<Room>();
  final worst2GVelocity = Rxn<Room>();

  @override
  void onInit() async {
    super.onInit();

    await getRooms();
    await getData();
  }

  getRooms() async {
    await roomsRepository.getAll();
  }

  getData() async {
    Room? best5 = null;
    Room? best2 = null;
    Room? worst5 = null;
    Room? worst2 = null;

    for (var element in roomsRepository.rooms) {
      if (best2 == null || best2.legacyLinkSpeed < element.legacyLinkSpeed) {
        best2 = element;
      }

      if (best5 == null || best5.linkSpeed < element.linkSpeed) {
        best5 = element;
      }

      if (worst2 == null || worst2.legacyLinkSpeed > element.legacyLinkSpeed) {
        worst2 = element;
      }

      if (worst5 == null || worst5.linkSpeed > element.linkSpeed) {
        worst5 = element;
      }
    }

    best2GVelocity.value = best2;
    best5GVelocity.value = best5;
    worst2GVelocity.value = worst2;
    worst5GVelocity.value = worst5;
  }
}
