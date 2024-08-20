import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/controller/bottom_nav_controller.dart.dart';
import 'package:global_health_opinion/main.dart';
import 'package:iconly/iconly.dart';

class AppUtilities {
  final BottomNavigationController controller =
      Get.put(BottomNavigationController());

  Color primary = const Color(0xFF014AAD);
  static const Color background = Color(0xFFF3F4F6);
  static const Color card = Color(0xFFEBF2FF);

  static const Color textFieldBackground = Color(0xFFFFFFFF);
  static const Color buttonText = Color(0xFFFFFFFF);
  static const Color hintText = Color(0xFF8A8A8A);
  static const Color border = Color(0xFFD1D1D1);

  // static Widget customBottomBar(
  //     AppController appController, BuildContext context) {
  //   return GetBuilder<AppController>(builder: (controller) {
  //     return BottomNavigationBar(
  //       backgroundColor: Colors.white,
  //       selectedItemColor: AppUtilities().primary,
  //       type: BottomNavigationBarType.fixed,
  //       items: const [
  //         BottomNavigationBarItem(
  //             icon: Icon(IconlyLight.document), label: 'Case Management'),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.phone), label: 'Telecommunication'),
  //         BottomNavigationBarItem(
  //             icon: Icon(IconlyLight.notification), label: 'notification'),
  //         BottomNavigationBarItem(
  //             icon: Icon(IconlyLight.user), label: 'profile'),
  //       ],
  //       elevation: 6,
  //       currentIndex: controller.activeNavBarItem,
  //       onTap: (value) {
  //         controller.navBarController(value);
  //       },
  //     );
  //   });
  // }

  //logout
  Future<dynamic> logoutalert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text('Are you sure you want to logout?',
                        style: TextStyle(
                          fontSize: 14,
                        )),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      logoutAlertButtons(
                          () => Get.offAllNamed(PageRouteName.login),
                          'Yes',
                          const Color(0xFFFF0000),
                          Colors.white),
                      const SizedBox(
                        width: 5,
                      ),
                      logoutAlertButtons(() => Navigator.pop(context), 'No',
                          AppUtilities().primary, Colors.white),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  GestureDetector logoutAlertButtons(
      void Function()? onTap, String title, Color boxColor, Color textcolor) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 35,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 14, color: textcolor),
          ),
        ),
      ),
    );
  }

//drawer
  Container drawer(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: AppUtilities().primary),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 125,
                  height: 70,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/GHO_Logo.png',
                        fit: BoxFit.cover,
                      )),
                ),
                const Divider(),
                const SizedBox(
                  height: 40,
                ),
                drawerItems(() {
                  controller.changePage(3);
                  Get.back();
                }, IconlyLight.password, 'Profile'),
                drawerItems(() {
                  logoutalert(context);
                }, Icons.logout_rounded, 'Logout'),
              ],
            ),
          ),
        ));
  }

  GestureDetector drawerItems(
      void Function()? onTap, IconData icon, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(
              icon,
              size: 26,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 17, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
