import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/controller/signin_controller.dart';
import 'package:global_health_opinion/main.dart';
import 'package:global_health_opinion/utilities/constants.dart';

class OtpConfirmation extends StatelessWidget {
  OtpConfirmation({super.key});
  final TextEditingController otpcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final SigninController controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25, top: 3),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: AppUtilities().primary,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width / 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'OTP has shared to your Registered email ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.width / 25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'The OTP is ${controller.otp.toString()}',
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    controller: otpcontroller,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is Required';
                      } else if (value.length != 6) {
                        return 'Please enter valid Input';
                      }
                      return null;
                    },
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      hintText: 'Enter OTP',
                      enabledBorder: InputBorder.none,
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(85)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(85)),
                      ),
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      var responsestatus = await controller.userOTPConfirmation(
                          controller.email, otpcontroller.text);
                      if (responsestatus == 1 && controller.data.isNotEmpty) {
                        Get.offAllNamed(PageRouteName.Home);
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarinfo(controller.data));
                      }
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 18,
                    decoration: BoxDecoration(
                      color: AppUtilities().primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: Obx(() => controller.isLoading.value == false
                            ? Text(
                                'Verify OTP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20,
                                ),
                              )
                            : const CircularProgressIndicator.adaptive())),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SnackBar snackBarinfo(String content) {
    return SnackBar(
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppUtilities().primary,
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              spreadRadius: 2.0,
              blurRadius: 8.0,
              offset: Offset(2, 4),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            content,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
