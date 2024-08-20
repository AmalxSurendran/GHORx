import 'package:flutter/material.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:global_health_opinion/utilities/widget/customfield.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController typeController = TextEditingController();
    TextEditingController routingController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController hnameController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          CustomTextFormField(
              controller: typeController,
              hintText: 'Account Type',
              prefixIcon: Icons.account_box_rounded),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: routingController,
              hintText: 'Routing Number',
              prefixIcon: Icons.route_rounded),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: numberController,
              hintText: 'Account Number',
              prefixIcon: Icons.numbers),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: hnameController,
              hintText: 'Account Holder Name',
              prefixIcon: Icons.person_2_rounded),
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
          ),
        ],
      ),
    );
  }
}
