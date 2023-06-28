import 'package:get/get.dart';

import '../bindings/initial_binding.dart';
import '../modules/contact/views/contact_detail_view.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: _Paths.contactDetail,
      page: () => ContactDetailView(),
    ),
  ];
}
