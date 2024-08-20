// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/controller/app_controller.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:global_health_opinion/utilities/widget/customfield.dart';

class Accreditation extends StatelessWidget {
  const Accreditation({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController accreditationController = Get.put(AppController());
    TextEditingController specialityController = TextEditingController();
    TextEditingController subspecialityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppUtilities().primary,
        title: const Text(
          'Add Accreditation',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              accreditationController.toggleAccreditationsVisibility();
            },
            icon: Obx(() {
              return Icon(
                accreditationController.showAccreditations.value
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: AppUtilities.background,
              );
            }),
          ),
          Obx(() {
            return accreditationController.showAccreditations.value
                ? IconButton(
                    onPressed: () {
                      accreditationController.addAccreditation();
                    },
                    icon: const Icon(Icons.add),
                    color: AppUtilities.background,
                  )
                : const SizedBox.shrink();
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              Obx(() {
                return accreditationController.showAccreditations.value
                    ? Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                accreditationController.accreditations.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  TextFormField(
                                    controller: accreditationController
                                        .accreditations[index],
                                    decoration: InputDecoration(
                                      hintText: 'Accreditation ${index + 1}',
                                      prefixIcon: const Icon(Icons.add),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          accreditationController
                                              .removeAccreditation(index);
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      )
                    : const SizedBox.shrink();
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Board Certification:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(() {
                    return Row(
                      children: [
                        Radio<bool>(
                          value: true,
                          groupValue:
                              accreditationController.isBoardCertified.value,
                          onChanged: (bool? value) {
                            if (value != null) {
                              accreditationController
                                  .toggleBoardCertification(value);
                            }
                          },
                        ),
                        const Text('Yes'),
                        Radio<bool>(
                          value: false,
                          groupValue:
                              accreditationController.isBoardCertified.value,
                          onChanged: (bool? value) {
                            if (value != null) {
                              accreditationController
                                  .toggleBoardCertification(value);
                            }
                          },
                        ),
                        const Text('No'),
                      ],
                    );
                  }),
                ],
              ),
              CustomTextFormField(
                  controller: specialityController,
                  hintText: 'Speciality',
                  prefixIcon: Icons.medical_information),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  controller: subspecialityController,
                  hintText: 'Sub-Speciality',
                  prefixIcon: Icons.medical_information),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Save action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppUtilities().primary,
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: AppUtilities.background,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
