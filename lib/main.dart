import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/color_data.dart';
import 'core/constants_data.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ConstantsData.appName,
      initialRoute: AppPages.initial,
      // initialBinding: InitialBinding(),
      color: ColorData.primaryColor,
      getPages: AppPages.routes,
    );
  }
}
