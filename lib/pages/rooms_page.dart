import 'package:connector/controllers/rooms_controller.dart';
import 'package:connector/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RoomsPage extends GetView<RoomsController> {
  @override
  var controller = Get.find<RoomsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.light,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Cômodos',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.openCreateModal(null);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.colors.primary,
                      ),
                      child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                'Criar novo',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Stack(
                  children: [
                    Visibility(
                      visible: controller.roomsRepository.rooms.isEmpty,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Nenhum cômodo cadastrado :('),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: controller.roomsRepository.rooms.isNotEmpty,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller.roomsRepository.rooms.length,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            var room = controller.roomsRepository.rooms[index];
                            return Column(
                              children: [
                                Card(
                                  elevation: 0,
                                  color: AppTheme.colors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 11,
                                            child: Text(
                                              'Cômodo: ${room.name}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: IconButton(
                                              onPressed: () {
                                                controller
                                                    .openCreateModal(room);
                                              },
                                              icon: const FaIcon(
                                                FontAwesomeIcons.sliders,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
