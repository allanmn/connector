import 'package:connector/models/room.dart';
import 'package:connector/repositories/rooms_repository.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  var roomsRepository = Get.find<RoomsRepository>();

  final best5GVelocity = Rxn<Room>();
  final worst5GVelocity = Rxn<Room>();
  final best2GVelocity = Rxn<Room>();
  final worst2GVelocity = Rxn<Room>();
  final bestiInterference = Rxn<Room>();
  final worstiInterference = Rxn<Room>();

  var selectedTab = Rx<String>("best_5g");

  var selectedsRooms = Rxn<List<Room>>();

  @override
  void onInit() async {
    super.onInit();

    await getRooms();
    await getData();
    await setSelectedRooms();
  }

  getRooms() async {
    await roomsRepository.getAll();
  }

  changeSelectedTab(String selected) {
    selectedTab.value = selected;
    setSelectedRooms();
  }

  setSelectedRooms() {
    selectedsRooms.value = List<Room>.from(roomsRepository.rooms);
    switch (selectedTab.value) {
      case "best_5g":
        selectedsRooms.value?.sort(
          (a, b) => a.linkSpeed.compareTo(b.linkSpeed),
        );
        break;
      case "best_2g":
        selectedsRooms.value?.sort(
          (a, b) => a.legacyLinkSpeed.compareTo(b.legacyLinkSpeed),
        );
        break;
      case "lower_interference":
        selectedsRooms.value?.sort(
          (a, b) => a.interference.compareTo(b.interference),
        );
        break;
    }
  }

  getData() async {
    Room? best5 = null;
    Room? best2 = null;
    Room? worst5 = null;
    Room? worst2 = null;
    Room? bestI = null;
    Room? worstI = null;

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

      if (bestI == null || bestI.interference > element.interference) {
        bestI = element;
      }

      if (worstI == null || worstI.interference < element.interference) {
        worstI = element;
      }
    }

    best2GVelocity.value = best2;
    best5GVelocity.value = best5;
    worst2GVelocity.value = worst2;
    worst5GVelocity.value = worst5;
    bestiInterference.value = bestI;
    worstiInterference.value = worstI;
  }
}
