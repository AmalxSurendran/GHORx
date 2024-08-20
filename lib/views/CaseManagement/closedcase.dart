import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:global_health_opinion/controller/app_controller.dart';

class Closedcase extends StatelessWidget {
  const Closedcase({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController controller = Get.put(AppController());

    return Scaffold(
      body: Scaffold(
        body: Obx(() {
          return ListView(
            children: controller.Closeditem.map((item) {
              return GestureDetector(
                onTap: controller.showAlertDialog,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['Case No']!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            item['Name']!,
                            style: TextStyle(
                                fontSize: 16, color: AppUtilities().primary),
                          ),
                          Text(
                            item['Gender']!,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            item['Date']!,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            item['Country']!,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }),
      ),
    );
  }
}
