import 'package:shared_preferences/shared_preferences.dart';

Future<void> setContacts(String contacts) async {
  final prefs = await SharedPreferences.getInstance();
  if (contacts.isNotEmpty) {
    prefs.setString("Contacts", contacts);
  } else {
    prefs.remove("Contacts");
  }
}

Future<String> getContacts() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("Contacts") ?? '';
}
