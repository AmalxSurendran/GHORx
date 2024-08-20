import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/controller/signin_controller.dart';
import 'package:global_health_opinion/main.dart';
import 'package:global_health_opinion/utilities/constants.dart';

// ignore: must_be_immutable
class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final SigninController controller = Get.put(SigninController());
  TextEditingController currentEmailcontroller = TextEditingController();
  TextEditingController newPasscontroller = TextEditingController();
  TextEditingController currentpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: AppUtilities().primary,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25, top: 3),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.password_rounded,
                  size: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width:
                      MediaQuery.of(context).size.width * 0.8, // Adjust width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Obx(
                    () => TextFormField(
                      controller: currentEmailcontroller,
                      cursorColor: AppUtilities().primary,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_rounded),
                        hintText: 'Current Email',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width:
                      MediaQuery.of(context).size.width * 0.8, // Adjust width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Obx(
                    () => TextFormField(
                      controller: currentpasswordcontroller,
                      obscureText: controller.currentpassobscureText.value,
                      cursorColor: AppUtilities().primary,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.newconfirmpassobscureText.value =
                                !controller.newconfirmpassobscureText.value;
                          },
                          icon: Icon(controller.newconfirmpassobscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        hintText: 'Current Password',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width:
                      MediaQuery.of(context).size.width * 0.8, // Adjust width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Obx(
                    () => TextFormField(
                      controller: newPasscontroller,
                      obscureText: controller.newpasspassobscureText.value,
                      cursorColor: AppUtilities().primary,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.newpasspassobscureText.value =
                                !controller.newpasspassobscureText.value;
                          },
                          icon: Icon(controller.newpasspassobscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        hintText: 'New Password',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () => Get.toNamed(PageRouteName.Home),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height / 20,
                    decoration: BoxDecoration(
                      color: AppUtilities().primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
