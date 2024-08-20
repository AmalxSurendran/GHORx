// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:intl/intl.dart';

class AppController extends GetxController {
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var eventName = ''.obs;
  var eventDescription = ''.obs;

  final scrollController = ScrollController().obs;
  var showArrow = true.obs;

  var accreditations = <TextEditingController>[].obs;
  var showAccreditations = false.obs;
  var isBoardCertified = false.obs;

  void addAccreditation() {
    accreditations.add(TextEditingController());
  }

  void removeAccreditation(int index) {
    accreditations.removeAt(index);
  }

  void toggleAccreditationsVisibility() {
    showAccreditations.value = !showAccreditations.value;
  }

  void toggleBoardCertification(bool value) {
    isBoardCertified.value = value;
  }

  @override
  void onClose() {
    for (var controller in accreditations) {
      controller.dispose();
    }
    super.onClose();
  }

  void updateArrowVisibility(int index) {
    if (index == AppController.Profiletitles.length - 1) {
      showArrow.value = false; // Hide the arrow on the last tab
    } else {
      showArrow.value = true; // Show the arrow on other tabs
    }
  }

  // @override
  // void onInit() {
  //   scrollController.value.addListener(() {
  //     if (scrollController.value.position.atEdge) {
  //       if (scrollController.value.position.pixels == 0) {
  //         showArrow.value = true; // At the start of the list
  //       } else {
  //         showArrow.value = false; // At the end of the list
  //       }
  //     } else {
  //       showArrow.value = true; // In between the list
  //     }
  //   });
  //   super.onInit();
  // }

  void addEvent(DateTime day, String name, String description) {
    if (events.containsKey(day)) {
      events[day]!.add({'name': name, 'description': description});
    } else {
      events[day] = [
        {'name': name, 'description': description}
      ];
    }
  }

  List<Map<String, String>> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  void clearSelectedDay() {
    selectedDay.value = DateTime.now();
    eventName.value = '';
    eventDescription.value = '';
  }

  var events = <DateTime, List<Map<String, String>>>{}.obs;

  String get formattedSelectedDay =>
      DateFormat('yyyy-MM-dd').format(selectedDay.value);

  var selectedIndex = 0.obs;

  var Closeditem = [
    {
      'Case No': 'Case 9',
      'Name': 'Evelyn',
      'Gender': 'Female',
      'Date': '2023-01-09',
      'Country': 'Italy'
    },
    {
      'Case No': 'Case 10',
      'Name': 'Luna',
      'Gender': 'Male',
      'Date': '2023-01-10',
      'Country': 'Spain'
    },
    {
      'Case No': 'Case 11',
      'Name': 'Theodore',
      'Gender': 'Male',
      'Date': '2023-01-11',
      'Country': 'Netherlands'
    },
    {
      'Case No': 'Case 12',
      'Name': 'Lucas',
      'Gender': 'Male',
      'Date': '2023-01-12',
      'Country': 'Belgium'
    },
  ].obs;

  var Caseitem = [
    {
      'Case No': 'Case 1',
      'Name': 'Noah',
      'Gender': 'Male',
      'Date': '2023-01-01',
      'Country': 'USA'
    },
    {
      'Case No': 'Case 2',
      'Name': 'Oliver',
      'Gender': 'Male',
      'Date': '2023-01-02',
      'Country': 'Canada'
    },
    {
      'Case No': 'Case 3',
      'Name': 'James',
      'Gender': 'Male',
      'Date': '2023-01-03',
      'Country': 'UK'
    },
    {
      'Case No': 'Case 4',
      'Name': 'Emma',
      'Gender': 'Female',
      'Date': '2023-01-04',
      'Country': 'Australia'
    },
    {
      'Case No': 'Case 5',
      'Name': 'Charlotte',
      'Gender': 'Female',
      'Date': '2023-01-05',
      'Country': 'New Zealand'
    },
    {
      'Case No': 'Case 6',
      'Name': 'Amelia',
      'Gender': 'Female',
      'Date': '2023-01-06',
      'Country': 'India'
    },
    {
      'Case No': 'Case 7',
      'Name': 'Sophia',
      'Gender': 'Female',
      'Date': '2023-01-07',
      'Country': 'Germany'
    },
    {
      'Case No': 'Case 8',
      'Name': 'Isabella',
      'Gender': 'Female',
      'Date': '2023-01-08',
      'Country': 'France'
    },
    {
      'Case No': 'Case 9',
      'Name': 'Evelyn',
      'Gender': 'Female',
      'Date': '2023-01-09',
      'Country': 'Italy'
    },
    {
      'Case No': 'Case 10',
      'Name': 'Luna',
      'Gender': 'Male',
      'Date': '2023-01-10',
      'Country': 'Spain'
    },
    {
      'Case No': 'Case 11',
      'Name': 'Theodore',
      'Gender': 'Male',
      'Date': '2023-01-11',
      'Country': 'Netherlands'
    },
    {
      'Case No': 'Case 12',
      'Name': 'Lucas',
      'Gender': 'Male',
      'Date': '2023-01-12',
      'Country': 'Belgium'
    },
    // Add more items as needed
  ].obs;

  // Method to add an item to the grid
  void addItem(String name, String price) {
    Caseitem.add({'name': name, 'price': price});
  }

  // Method to remove an item from the grid
  void removeItem(int index) {
    Caseitem.removeAt(index);
  }

  var items = [
    {
      'Case No': 'Case 9',
      'Name': 'Evelyn',
      'Gender': 'Female',
      'price': '\$150'
    },
    {'Case No': 'Case 10', 'Name': 'Luna', 'Gender': 'Male', 'price': '\$150'},
    {
      'Case No': 'Case 11',
      'Name': 'Theodore',
      'Gender': 'Male',
      'price': '\$150'
    },
    {'Case No': 'Case 12', 'Name': 'Lucas', 'Gender': 'Male', 'price': '\$150'},
  ].obs;

  static var titles = [
    "New Case",
    "Closed Case",
    "Payment",
  ].obs;

  static var Teletitles = [
    "Update",
    "Request",
    "Create",
  ].obs;

  static var Profiletitles = [
    "Info",
    "Account Details",
    "Password",
    "Insurance",
    'Accreditation & Expertise'
  ].obs;

  showAlertDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text("Alert"),
        content: const Text(
            "This function is not open yet. Please contact the admin."),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: AppUtilities().primary,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              border: Border.all(color: Colors.grey), // Add border
            ),
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //nottomnavigationbar

  // int activeNavBarItem = 0;
  // var isNavigating = false.obs;

  // void navBarController(int value) {
  //   if (value != activeNavBarItem) {
  //     activeNavBarItem = value;
  //     log("Navigating to: $value"); // Added log
  //     navBarNavigator(value);
  //     update();
  //   }
  // }

  // void navBarNavigator(int value) {
  //   log("Navigation Value: $value");
  //   switch (value) {
  //     case 0:
  //       Get.offAllNamed(PageRouteName.casemanage);
  //       break;
  //     case 1:
  //       Get.offAllNamed(PageRouteName.telecom);
  //       break;
  //     case 2:
  //       Get.offAllNamed(PageRouteName.notify);
  //       break;
  //     case 3:
  //       Get.offAllNamed(PageRouteName.profile);
  //       break;
  //     default:
  //       log("Invalid Navigation Value: $value"); // Added log
  //       break;
  //   }
  // }
}
