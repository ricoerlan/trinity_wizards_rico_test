import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_wizards_rico_test/modules/contact/controllers/contact_controller.dart';
import 'package:trinity_wizards_rico_test/modules/contact/model/contact_model.dart';

import '../../../core/color_data.dart';
import '../../../widgets/text_and_formfield_widget.dart';

class ContactDetailView extends GetView<ContactController> {
  ContactDetailView({Key? key}) : super(key: key);

  ContactModel contact = Get.arguments ?? ContactModel();
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController dateOfBirthTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (contact.id != null) {
      firstNameTextController.text = contact.firstName.toString();
      lastNameTextController.text = contact.lastName.toString();
      emailTextController.text = contact.email.toString();
      dateOfBirthTextController.text = contact.dob.toString();
    }
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: ColorData.primaryColor),
          ),
        ),
        leadingWidth: 70,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              if (firstNameTextController.text.isNotEmpty &&
                  lastNameTextController.text.isNotEmpty) {
                contact.firstName = firstNameTextController.text;
                contact.lastName = lastNameTextController.text;
                contact.email = emailTextController.text;
                contact.dob = dateOfBirthTextController.text;
                controller.saveContact(contact);
              } else {
                Get.snackbar('Save data failed',
                    'First Name and Last Name cannot be empty!');
              }
            },
            child: Text(
              'Save',
              style: TextStyle(color: ColorData.primaryColor),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: CircleAvatar(
                  backgroundColor: ColorData.primaryColor,
                  radius: 60,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Main Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                TextAndFormFieldWidget(
                  label: 'First Name',
                  textFieldController: firstNameTextController,
                  isRequired: true,
                ),
                TextAndFormFieldWidget(
                  label: 'Last Name',
                  textFieldController: lastNameTextController,
                  isRequired: true,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Sub Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                TextAndFormFieldWidget(
                  label: 'Email',
                  textFieldController: emailTextController,
                ),
                TextAndFormFieldWidget(
                  label: 'DOB',
                  textFieldController: dateOfBirthTextController,
                  isDOB: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
