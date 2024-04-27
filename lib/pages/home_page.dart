import 'package:connector/controllers/home_controller.dart';
import 'package:connector/controllers/tabs_controller.dart';
import 'package:connector/theme/app_colors.dart';
import 'package:connector/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  var controller = Get.find<HomeController>();
  var tabsController = Get.find<TabsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppTheme.colors.success, AppTheme.colors.warning])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          tabsController.currentIndex.value = 1;
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.personShelter,
                                  size: 25,
                                ),
                                Text(
                                  'Cômodos',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          tabsController.changePage(2);
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.chartColumn,
                                  size: 25,
                                ),
                                Text(
                                  'Gráficos',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 11,
                                child: Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.personShelter,
                                      size: 25,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Total de Cômodos: ${controller.roomsRepository.rooms.length}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: const Icon(Icons.remove_red_eye),
                                  style: IconButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                  ),
                                  iconSize: 40,
                                  onPressed: () {
                                    tabsController.changePage(1);
                                  },
                                  color: AppTheme.colors.primary,
                                ),
                              ),
                            ],
                          )),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
