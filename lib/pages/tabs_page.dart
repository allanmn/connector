import 'package:connector/controllers/tabs_controller.dart';
import 'package:connector/pages/home_page.dart';
import 'package:connector/pages/rooms_page.dart';
import 'package:connector/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsPage extends GetView<TabsController> {
  @override
  var controller = Get.find<TabsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            backgroundColor: AppTheme.colors.light,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedItemColor: AppTheme.colors.primary,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house), label: 'Início'),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.personShelter),
                  label: 'Cômodos'),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.chartColumn),
                label: 'Gráficos',
              ),
            ],
            onTap: (index) => controller.changePage(index),
          )),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.currentIndex.value,
                children: [
                  HomePage(),
                  RoomsPage(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
