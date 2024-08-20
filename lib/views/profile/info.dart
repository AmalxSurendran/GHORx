import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/controller/profile_controller.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:global_health_opinion/utilities/widget/customfield.dart';

class Info extends StatelessWidget {
  Info({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Profile Information',
          style: TextStyle(
              color: AppUtilities().primary, fontWeight: FontWeight.bold),
        ),
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (profileController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                        controller: profileController.firstnameController.value,
                        hintText: 'First Name',
                        prefixIcon: Icons.person_2_rounded),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                        controller: profileController.lastnameController.value,
                        hintText: 'Last Name',
                        prefixIcon: Icons.person_2_rounded),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                        controller: profileController.emailController.value,
                        hintText: 'Email',
                        prefixIcon: Icons.email_rounded),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                        controller: profileController.phoneController.value,
                        hintText: 'Phone Number',
                        prefixIcon: Icons.phone),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                        controller: profileController.addressController.value,
                        hintText: 'Address',
                        prefixIcon: Icons.home),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                        controller: profileController.cityController.value,
                        hintText: 'City',
                        prefixIcon: Icons.location_city_rounded),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                        controller: profileController.stateController.value,
                        hintText: 'State',
                        prefixIcon: Icons.map_rounded),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                        controller: profileController.zipcodeController.value,
                        hintText: 'ZipCode',
                        prefixIcon: Icons.numbers_rounded),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 18,
                      decoration: BoxDecoration(
                        color: AppUtilities().primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppUtilities.buttonText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
