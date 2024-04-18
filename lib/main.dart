import 'dart:io';

import 'package:connector/routes/app_pages.dart';
import 'package:connector/routes/app_routes.dart';
import 'package:connector/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(GetMaterialApp(
    title: "Connector",
    debugShowCheckedModeBanner: false,
    theme: AppTheme.define(),
    initialRoute: Routes.HOME,
    getPages: AppPages.routes,
  ));
}
