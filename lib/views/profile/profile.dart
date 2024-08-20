// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:global_health_opinion/controller/app_controller.dart';
import 'package:global_health_opinion/views/profile/account_details.dart';
import 'package:global_health_opinion/views/profile/accreditation.dart';
import 'package:global_health_opinion/views/profile/info.dart';
import 'package:global_health_opinion/views/profile/insurance.dart';
import 'package:global_health_opinion/views/profile/password.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final PageController _pageController = PageController();
  final AppController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
                height: 16), // Add space between the AppBar and the tabs
            Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() {
                    return Row(
                      children: List.generate(
                          AppController.Profiletitles.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            _controller.selectedIndex.value = index;
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            _controller.updateArrowVisibility(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8.0), // Add margin between tabs
                            decoration: BoxDecoration(
                              color: _controller.selectedIndex.value == index
                                  ? AppUtilities().primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  AppController.Profiletitles[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        _controller.selectedIndex.value == index
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }),
                ),
                Obx(() {
                  return _controller.showArrow.value
                      ? Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 30,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0),
                                  Colors.white
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppUtilities().primary,
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                }),
              ],
            ),
            const SizedBox(
                height: 16), // Add space between the tabs and the PageView
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  _controller.selectedIndex.value = index;
                  _controller.updateArrowVisibility(index);
                },
                children: [
                  Info(),
                  const AccountDetails(),
                  const Password(),
                  const Insurance(),
                  const Accreditation(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
