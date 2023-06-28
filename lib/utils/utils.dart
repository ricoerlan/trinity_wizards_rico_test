import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:trinity_wizards_rico_test/modules/contact/model/contact_model.dart';

import '../data/shared_prefs/shared_prefs.dart';

Future<List<ContactModel>> readContactDataFromJson() async {
  final sharedPrefs = await getContacts();
  if (sharedPrefs.isNotEmpty) {
    final data = contactModelFromJson((sharedPrefs));
    return data;
  } else {
    final String response = await rootBundle.loadString('assets/data.json');
    List<ContactModel> contacts = contactModelFromJson(response);
    await setContacts(json.encode(contacts));
    return contacts;
  }
}

Future<void> saveContactToJson(List<ContactModel> contacts) async {
  return await setContacts(json.encode(contacts));
}
