import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/utilities/dio_handler.dart';
import 'package:global_health_opinion/utilities/shared_preference.dart';

class ProfileController extends GetxController {
  Rx<TextEditingController> firstnameController = TextEditingController().obs;
  Rx<TextEditingController> lastnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> zipcodeController = TextEditingController().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchProfileInfo();
    super.onInit();
  }

  Future<void> fetchProfileInfo() async {
    isLoading.value = true;

    // Retrieve the token from shared preferences
    String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);

    if (token == null) {
      // Handle case where token is not available
      isLoading.value = false;
      return;
    }

    // Build the request body
    var body = {
      "Token": token,
      "Prokey": "",
      "Tags": [
        {"T": "Action", "V": "REVIEWER"},
        {"T": "src", "V": "MOBILE"}
      ]
    };

    // Encode body as JSON string
    String jsonBody = jsonEncode(body);

    // Send the POST request
    var response = await DioHandler.dioPOST(body: jsonBody);

    // Print the response for debugging
    print('Response: $response');

    // Process the response
    if (response['Status'] == 1) {
      var dataList = response['Data'];
      if (dataList != null && dataList is List && dataList.isNotEmpty) {
        var profileDataList = dataList[0];
        if (profileDataList != null &&
            profileDataList is List &&
            profileDataList.isNotEmpty) {
          var profileData = profileDataList[0];
          if (profileData is Map<String, dynamic>) {
            firstnameController.value.text = profileData['fn'] ?? '';
            lastnameController.value.text = profileData['ln'] ?? '';
            emailController.value.text = profileData['em'] ?? '';
            phoneController.value.text = profileData['cp'] ?? '';
            addressController.value.text = profileData['ad'] ?? '';
            cityController.value.text = profileData['cy'] ?? '';
            stateController.value.text = profileData['st'] ?? '';
            zipcodeController.value.text = profileData['zp'] ?? '';
          } else {
            print('Profile data is not in the expected format.');
          }
        } else {
          print('Profile data list is empty or not in expected format.');
        }
      } else {
        print('Data list is empty or not in expected format.');
      }
    } else {
      // Handle error response
      print('Error fetching profile data: ${response['Info']}');
    }

    isLoading.value = false;
  }
}
