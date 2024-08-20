// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:global_health_opinion/utilities/constants.dart';
import 'package:global_health_opinion/controller/app_controller.dart';
import 'package:global_health_opinion/views/telecommunication/create.dart';
import 'package:global_health_opinion/views/telecommunication/updates.dart';

class Telecommunication extends StatelessWidget {
  Telecommunication({super.key});
  final PageController _pageController = PageController();
  final AppController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
              height: 16), // Add space between the AppBar and the tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              return Row(
                children:
                    List.generate(AppController.Teletitles.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      _controller.selectedIndex.value = index;
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
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
                      child: Text(
                        AppController.Teletitles[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _controller.selectedIndex.value == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
          const SizedBox(
              height: 16), // Add space between the tabs and the PageView
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _controller.selectedIndex.value = index;
              },
              children: [
                const Updates(),
                Create(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
