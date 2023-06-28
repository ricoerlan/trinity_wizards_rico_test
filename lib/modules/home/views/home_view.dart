import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_wizards_rico_test/modules/home/controllers/home_controller.dart';
import 'package:trinity_wizards_rico_test/routes/app_pages.dart';

import '../../../core/color_data.dart';
import '../../contact/controllers/contact_controller.dart';

class HomeView extends GetView<ContactController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return RefreshIndicator(
        onRefresh: () async {
          homeController.retrieveOriginalDataFromJson();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.search, color: ColorData.primaryColor),
              onPressed: () {
                homeController.isSearchMode = true;
                homeController.update();
              },
            ),
            title: homeController.isSearchMode
                ? TextField(
                    controller: TextEditingController(),
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      hintText: 'Search by name...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    onChanged: (val) {
                      controller.searchContact(val.toLowerCase());
                      controller.update();
                    },
                  )
                : const Text(
                    'Contacts',
                    style: TextStyle(color: Colors.black),
                  ),
            centerTitle: true,
            backgroundColor: Colors.white,
            actions: [
              homeController.isSearchMode
                  ? IconButton(
                      onPressed: () {
                        homeController.isSearchMode = false;
                        homeController.update();
                      },
                      icon: Icon(
                        Icons.close,
                        color: ColorData.primaryColor,
                      ))
                  : IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.contactDetail);
                      },
                      icon: Icon(Icons.add, color: ColorData.primaryColor))
            ],
          ),
          body: GetBuilder<ContactController>(builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: homeController.isSearchMode
                    ? controller.filteredContacts.length
                    : controller.contacts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  final item = homeController.isSearchMode
                      ? controller.filteredContacts[index]
                      : controller.contacts[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.contactDetail, arguments: item);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorData.primaryColor,
                            radius: 30,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '${item.firstName} ${item.lastName}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      );
    });
  }
}
