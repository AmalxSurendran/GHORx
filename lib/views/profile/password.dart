import 'package:flutter/material.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:global_health_opinion/utilities/widget/customfield.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController currentController = TextEditingController();
    TextEditingController newController = TextEditingController();
    TextEditingController confirmController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          CustomTextFormField(
              controller: currentController,
              hintText: 'Current Password',
              prefixIcon: Icons.password_rounded),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: newController,
              hintText: 'New Password',
              prefixIcon: Icons.password_rounded),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              controller: confirmController,
              hintText: 'Confirm Pasword',
              prefixIcon: Icons.password_rounded),
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
