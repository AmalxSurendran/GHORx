import 'dart:convert';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:global_health_opinion/main.dart';
import 'package:global_health_opinion/utilities/dio_handler.dart';
import 'package:global_health_opinion/utilities/shared_preference.dart';

class SigninController extends GetxController {
  Rx<bool> loginpassobscureText = true.obs;
  Rx<bool> registerpassobscureText = true.obs;
  Rx<bool> registerconfirmpassobscureText = true.obs;
  Rx<bool> currentpassobscureText = true.obs;
  Rx<bool> newpasspassobscureText = true.obs;
  Rx<bool> newconfirmpassobscureText = true.obs;
  int? responsestatus;
  int? otp;
  String email = '';
  String data = '';
  String tokenMsg = '';
  Rx<bool> isLoading = false.obs;

  // Future<void> getReviewerProfile() async {
  //   // Retrieve the token from shared preferences
  //   String token = SharedPrefs.getString(SharedPrefs.TOKEN) as String? ?? "";

  //   // Build the request body with the retrieved token
  //   var body = {
  //     "Token": token,
  //     "Prokey": "",
  //     "Tags": [
  //       {"T": "Action", "V": "REVIEWER"},
  //       {"T": "src", "V": "WEB"}
  //     ]
  //   };

  //   // Encode the body as a JSON string
  //   String jsonBody = jsonEncode(body);

  //   // Print the encoded JSON body for debugging
  //   log('Encoded Request Body for Reviewer Profile: $jsonBody');

  //   // Send the POST request
  //   var response = await DioHandler.dioPOST(body: jsonBody);
  //   responsestatus = response['Status'];

  //   // Handle the response
  //   if (responsestatus == 1) {
  //     log('Reviewer profile data fetched successfully.');
  //     data = response['Data']; // Process your data as needed
  //   } else {
  //     log('Failed to fetch reviewer profile.');
  //     data = response['Info']; // Handle error information
  //   }

  //   // Optionally, update the loading state
  //   isLoading.value = false;
  // }

  // changepassword(
  //   String currentemail,
  //   String currentpassword,
  //   String newpassword,
  // ) async {
  //   isLoading.value = true;
  //   var body = {
  //     "Token": "",
  //     "Tags": [
  //       {"T": "Action", "V": "REVIEWER"},
  //       {"T": "src", "V": "MOBILE"},
  //       {"T": "dk1", "V": currentemail},
  //       {"T": "dk2", "V": currentpassword},
  //       {"T": "c1", "V": newpassword},
  //       {"T": "c10", "V": 3},
  //     ]
  //   };
  // }

  userOTPConfirmation(String email, String otp) async {
    isLoading.value = true;
    var body = {
      "Token": "",
      "Tags": [
        {"T": "Action", "V": "OTP"},
        {"T": "src", "V": "MOBILE"},
        {"T": "dk1", "V": email},
        {"T": "dk2", "V": otp},
      ]
    };

    // Encode body as JSON string
    String jsonBody = jsonEncode(body);

    // Print the encoded JSON body
    log('Encoded Request Body: $jsonBody');

    var response = await DioHandler.dioPOST(body: jsonBody);
    responsestatus = response['Status'];
    var responsedata = response['Data'];
    if (responsestatus == 1 && responsedata == null) {
      log('Response data is null');
      data = response['Info'];
    } else if (responsestatus == 1) {
      if (response['Data'] != null && response['Data'].isNotEmpty) {
        var lastElement = response['Data'].last;
        if (lastElement.isNotEmpty &&
            lastElement[0] != null &&
            lastElement[0].containsKey('tkn')) {
          tokenMsg = lastElement[0]['tkn'];
          SharedPrefs.setString(
              tokenMsg, SharedPrefs.TOKEN); // Store the token securely
          log('Token fetched and stored: $tokenMsg');
        } else {
          log('The last element does not contain a "tkn" key or is empty.');
        }
      } else {
        log('The response data is empty.');
      }
    }
    isLoading.value = false;
    log(response.toString());
    return responsestatus;
  }

  userSignIN(
    String email,
    String password,
  ) async {
    isLoading.value = true;
    var body = {
      "Token": "",
      "Tags": [
        {"T": "Action", "V": "SIGNIN"},
        {"T": "src", "V": "MOBILE"},
        {"T": "dk1", "V": email},
        {"T": "dk2", "V": password},
      ]
    };

    // Encode body as JSON string
    String jsonBody = jsonEncode(body);

    // Print the encoded JSON body
    log('Encoded Request Body: $jsonBody');

    var response = await DioHandler.dioPOST(body: jsonBody);
    responsestatus = response['Status'];
    if (responsestatus == 1) {
      log(response.toString());
      isLoading.value = false;
      otp = response['Data'][0][0]['Otp'];
      data = response['Info'];
    } else if (responsestatus == 0) {
      data = response['Info'];
      isLoading.value = false;
    }
    isLoading.value = false;
    return responsestatus;
  }
}

logoutCheck() async {
  SharedPrefs.clearStorage();
  var userToken = await SharedPrefs.getString(SharedPrefs.TOKEN);
  if (userToken != null) {
    Get.offAllNamed(PageRouteName.casemanage);
  } else {
    Get.offAllNamed(PageRouteName.login);
  }
}

//drawer
var selectedIndex = 0.obs;

void selectItem(int index) {
  selectedIndex.value = index;
}
