// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/controller/signin_controller.dart';
import 'package:global_health_opinion/main.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:global_health_opinion/utilities/widget/customfield.dart';

class SignIn extends StatelessWidget {
  final SigninController controller = Get.put(SigninController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // ignore: no_leading_underscores_for_local_identifiers
  final _formKey = GlobalKey<FormState>();

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppUtilities().primary,
        centerTitle: true,
        title: const Text(
          'Global Health Opinion',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 1,
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: AppUtilities().primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 400, // Minimum height of the card
                  maxHeight: MediaQuery.of(context).size.height *
                      0.7, // Maximum height of the card
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 10.0,
                  color: AppUtilities.card,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.lock_open_rounded,
                          size: 100,
                        ),
                        const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Obx(() {
                            return Column(
                              children: [
                                CustomTextFormField(
                                  controller: emailController,
                                  hintText: 'Enter your Email',
                                  prefixIcon: Icons.email,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is Required';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                CustomTextFormField(
                                  controller: passwordController,
                                  hintText: 'Enter your Password',
                                  prefixIcon: Icons.lock,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is Required';
                                    }
                                    return null;
                                  },
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.loginpassobscureText.value =
                                          !controller
                                              .loginpassobscureText.value;
                                    },
                                    icon: Icon(
                                        controller.loginpassobscureText.value
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () {
                            return controller.isLoading.value
                                ? const CircularProgressIndicator.adaptive()
                                : GestureDetector(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        var responsedatastatus =
                                            await controller.userSignIN(
                                                emailController.text,
                                                passwordController.text);
                                        if (responsedatastatus == 1) {
                                          controller.email =
                                              emailController.text;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBarinfo(
                                                  controller.data));
                                          Get.toNamed(
                                              PageRouteName.otpConfirmation);
                                        } else if (responsedatastatus == 0) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBarinfo(
                                                  controller.data));
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      decoration: BoxDecoration(
                                        color: AppUtilities().primary,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: AppUtilities.buttonText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
          color: Colors.white,
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
