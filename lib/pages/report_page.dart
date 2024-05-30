import 'package:connector/controllers/home_controller.dart';
import 'package:connector/controllers/report_controller.dart';
import 'package:connector/controllers/tabs_controller.dart';
import 'package:connector/theme/app_colors.dart';
import 'package:connector/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ReportPage extends GetView<ReportController> {
  @override
  var controller = Get.find<ReportController>();
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
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.best5GVelocity.value != null)
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            child: FaIcon(
                                              color: Colors.green,
                                              FontAwesomeIcons.upLong,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "   Velocidade 5G:",
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        controller.best5GVelocity.value!.name,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (controller.best2GVelocity.value != null)
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            child: FaIcon(
                                              color: Colors.green,
                                              FontAwesomeIcons.upLong,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "   Velocidade 2,4G:",
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        controller.best2GVelocity.value!.name,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (controller.worst5GVelocity.value != null)
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            child: FaIcon(
                                              color: Colors.red,
                                              FontAwesomeIcons.downLong,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "   Velocidade 5G:",
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        controller.worst5GVelocity.value!.name,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (controller.worst2GVelocity.value != null)
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            child: FaIcon(
                                              color: Colors.red,
                                              FontAwesomeIcons.downLong,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "   Velocidade 2,4G:",
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        controller.worst2GVelocity.value!.name,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (controller.bestiInterference.value != null)
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            child: FaIcon(
                                              color: Colors.green,
                                              FontAwesomeIcons.upLong,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "   Menor interferência:",
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        controller
                                            .bestiInterference.value!.name,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (controller.worstiInterference.value != null)
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            child: FaIcon(
                                              color: Colors.red,
                                              FontAwesomeIcons.downLong,
                                              size: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "   Maior interferência:",
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        controller
                                            .worstiInterference.value!.name,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.changeSelectedTab('best_5g');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(20),
                              side: controller.selectedTab.value == 'best_5g'
                                  ? const BorderSide(
                                      width: 2, color: Colors.green)
                                  : const BorderSide(),
                            ),
                            child: Text(
                              "Melhores velocidades 5G",
                              style: TextStyle(
                                color: controller.selectedTab.value == 'best_5g'
                                    ? Colors.green
                                    : AppTheme.colors.dark,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.changeSelectedTab('best_2g');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(20),
                              side: controller.selectedTab.value == 'best_2g'
                                  ? const BorderSide(
                                      width: 2, color: Colors.green)
                                  : const BorderSide(),
                            ),
                            child: Text(
                              "Melhores velocidades 2.4G",
                              style: TextStyle(
                                color: controller.selectedTab.value == 'best_2g'
                                    ? Colors.green
                                    : AppTheme.colors.dark,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller
                                  .changeSelectedTab('lower_interference');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(20),
                              side: controller.selectedTab.value ==
                                      'lower_interference'
                                  ? const BorderSide(
                                      width: 2, color: Colors.green)
                                  : const BorderSide(),
                            ),
                            child: Text(
                              "Menores interferências",
                              style: TextStyle(
                                color: controller.selectedTab.value ==
                                        'lower_interference'
                                    ? Colors.green
                                    : AppTheme.colors.dark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.selectedsRooms.value != null)
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Cômodo",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "2.4g",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "5g",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Interferência",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ...controller.selectedsRooms.value!.map(
                                      (e) => Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  e.name,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "${e.legacyLinkSpeed} Mbps",
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "${e.linkSpeed} Mbps",
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "${e.interference} dbm",
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 1,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
