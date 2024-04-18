import 'package:connector/helpers/helpers.dart';
import 'package:connector/models/room.dart';
import 'package:connector/repositories/rooms_repository.dart';
import 'package:connector/theme/app_theme.dart';
import 'package:connector/widgets/create_room.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomsController extends GetxController {
  var roomsRepository = Get.find<RoomsRepository>();

  @override
  void onInit() {
    super.onInit();
  }

  openCreateModal(Room? room) async {
    var result;
    if (room != null) {
      result = await Get.bottomSheet(
        CreateRoom(
          room: room,
        ),
        isScrollControlled: true,
        backgroundColor: Colors.white,
      );
    } else {
      result = await Get.bottomSheet(
        CreateRoom(),
        isScrollControlled: true,
        backgroundColor: Colors.white,
      );
    }

    if (room == null && result != null && result is Room) {
      roomsRepository.add(result);

      Helpers.toast(
        title: "Adicionado com sucesso",
        message: "Cômodo adicionado com sucesso.",
        color: AppTheme.colors.success,
      );
    }

    if (room != null &&
        result != null &&
        result is String &&
        result == 'excluir') {
      await roomsRepository.remove(room);
      Helpers.toast(
        title: 'Removido com sucesso',
        message: 'Cômodo removido com sucesso.',
        color: AppTheme.colors.success,
      );
    }

    if (room != null && result != null && result is Room) {
      var index = roomsRepository.rooms.indexOf(room);
      var newRoom = Room(
        id: result.id,
        name: result.name,
        legacyLinkSpeed: result.legacyLinkSpeed,
        legacyLinkStrength: result.legacyLinkStrength,
        linkSpeed: result.linkSpeed,
        linkStrength: result.linkStrength,
        interference: result.interference,
        width: result.width,
        height: result.height,
        positionX: result.positionX,
        positionY: result.positionY,
        color: result.color,
      );
      await roomsRepository.update(newRoom);
      roomsRepository.rooms.insert(index, newRoom);
      roomsRepository.rooms.remove(room);

      Helpers.toast(
        title: 'Atualizado com sucesso',
        message: 'Cômodo atualizado com sucesso.',
        color: AppTheme.colors.success,
      );
    }
  }
}
