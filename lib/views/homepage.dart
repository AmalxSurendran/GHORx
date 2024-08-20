import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/controller/bottom_nav_controller.dart.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:global_health_opinion/views/CaseManagement/casemanagement.dart';
import 'package:global_health_opinion/views/notification.dart';
import 'package:global_health_opinion/views/profile/profile.dart';
import 'package:global_health_opinion/views/telecommunication/telecommunication.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
  final BottomNavigationController controller =
      Get.put(BottomNavigationController());
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: _scafoldKey,
        appBar: AppBar(
          backgroundColor: AppUtilities().primary,
          title: const Text(
            'Global Health Opinion',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 1,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                _scafoldKey.currentState?.openDrawer();
              },
              child: const SizedBox(
                  width: 35,
                  height: 35,
                  child: Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  )),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.changePage(2);
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ],
        ),
        drawer: AppUtilities().drawer(context),
        body: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.changePage(index);
          },
          children: [
            CaseManagement(),
            Telecommunication(),
            const Notificationn(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: AppUtilities().primary,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.document), label: 'Case Management'),
            BottomNavigationBarItem(
                icon: Icon(Icons.phone), label: 'Telecommunication'),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.notification), label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.user), label: 'Profile'),
          ],
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.pageController.jumpToPage(index);
            controller.changePage(index);
          },
          elevation: 6,
        ),
      );
    });
  }
}
