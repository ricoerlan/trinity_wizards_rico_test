import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';
import 'package:trinity_wizards_rico_test/modules/contact/model/contact_model.dart';

import '../../../utils/utils.dart';

class ContactController extends GetxController {
  List<ContactModel> contacts = [];
  List<ContactModel> filteredContacts = [];
  bool isLoading = false;

  @override
  void onInit() {
    getContactList();
    super.onInit();
  }

  getContactList() async {
    isLoading = true;
    final result = await readContactDataFromJson();
    contacts = result;
    isLoading = true;
    update();
  }

  saveContact(ContactModel contact) async {
    if (contact.id != null) {
      contacts.replaceWhere(
          (currentValue) => currentValue.id == contact.id, contact);
      await saveContactToJson(contacts).whenComplete(() {
        update();
        Get.back();
      });
    } else {
      contact.id = DateTime.now().millisecondsSinceEpoch.toString();
      contacts.add(contact);
      await saveContactToJson(contacts).whenComplete(() {
        update();
        Get.back();
      });
    }
  }

  searchContact(String query) {
    final result = contacts
        .where((element) =>
            element.firstName!.toLowerCase().contains(query) ||
            element.lastName!.toLowerCase().contains(query))
        .toList();
    filteredContacts.clear();
    filteredContacts = result;
    update();
  }
}
