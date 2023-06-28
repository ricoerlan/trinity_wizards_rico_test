import 'package:get/get.dart';
import 'package:trinity_wizards_rico_test/modules/contact/controllers/contact_controller.dart';
import 'package:trinity_wizards_rico_test/data/shared_prefs/shared_prefs.dart';

class HomeController extends GetxController {
  bool isSearchMode = false;

  retrieveOriginalDataFromJson() async {
    await setContacts('');
    Get.find<ContactController>().getContactList();
  }
}
