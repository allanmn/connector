import 'package:connector/bindings/rooms_binding.dart';
import 'package:connector/bindings/tabs_binding.dart';
import 'package:connector/pages/rooms_page.dart';
import 'package:connector/pages/tabs_page.dart';
import 'package:connector/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => TabsPage(),
      binding: TabsBinding(),
    ),
  ];
}
