import 'package:get/get.dart';
import 'package:trinity_wizards_rico_test/modules/contact/controllers/contact_controller.dart';
import 'package:trinity_wizards_rico_test/modules/home/controllers/home_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ContactController(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}
