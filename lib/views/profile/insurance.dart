import 'package:flutter/material.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:global_health_opinion/utilities/widget/customfield.dart';

class Insurance extends StatelessWidget {
  const Insurance({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController reviewerInsController = TextEditingController();
    TextEditingController reviewerIdController = TextEditingController();
    TextEditingController policytypeController = TextEditingController();
    TextEditingController careernameController = TextEditingController();
    // ignore: non_constant_identifier_names
    TextEditingController PolicyNumberController = TextEditingController();
    TextEditingController occuranceamountController = TextEditingController();
    TextEditingController expirationdateController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          CustomTextFormField(
              controller: reviewerInsController,
              hintText: 'Reviewer Insurance ID',
              prefixIcon: Icons.medical_information_rounded),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: reviewerIdController,
              hintText: 'Reviewer ID',
              prefixIcon: Icons.medical_information_rounded),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: policytypeController,
              hintText: 'Policy Type',
              prefixIcon: Icons.policy_rounded),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: careernameController,
              hintText: 'Career Name',
              prefixIcon: Icons.person_2_rounded),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: PolicyNumberController,
              hintText: 'policy Number',
              prefixIcon: Icons.numbers_rounded),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: occuranceamountController,
              hintText: 'Occurance Number',
              prefixIcon: Icons.numbers_rounded),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: expirationdateController,
              hintText: 'Expiration Date',
              prefixIcon: Icons.date_range_rounded),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: double.infinity,
            height: 50,
            child: Text(
              'Save',
              style: TextStyle(
                color: AppUtilities.background,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}
