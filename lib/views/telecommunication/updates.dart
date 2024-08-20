// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/controller/app_controller.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Updates extends StatelessWidget {
  const Updates({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController _scheduleController = Get.put(AppController());

    return Scaffold(
      backgroundColor: AppUtilities.background, // Set the background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => TableCalendar(
                  firstDay: DateTime.utc(2020, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _scheduleController.focusedDay.value,
                  calendarFormat: CalendarFormat.month,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    decoration: BoxDecoration(
                      color: AppUtilities()
                          .primary, // Background color for the header
                    ),
                    titleTextStyle: const TextStyle(
                      color: Colors.white, // Text color for the header title
                    ),
                    leftChevronIcon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    rightChevronIcon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: AppUtilities().primary),
                    weekdayStyle: TextStyle(color: AppUtilities().primary),
                  ),
                  calendarStyle: CalendarStyle(
                    weekendTextStyle: const TextStyle(color: Colors.red),
                    outsideDaysVisible: false,
                    defaultTextStyle: TextStyle(color: AppUtilities().primary),
                    todayDecoration: BoxDecoration(
                      color: AppUtilities().primary,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: AppUtilities().primary,
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    outsideTextStyle: const TextStyle(color: Colors.grey),
                    disabledTextStyle: const TextStyle(color: Colors.grey),
                  ),
                  availableGestures: AvailableGestures.all,
                  eventLoader: (day) {
                    return _scheduleController.getEventsForDay(day);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                color: AppUtilities().primary,
                width: double.infinity,
                height: 50,
                child: const Center(
                  child: Text(
                    'Events',
                    style:
                        TextStyle(fontSize: 20, color: AppUtilities.background),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () {
                    final events = _scheduleController.events;
                    return ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final date = events.keys.elementAt(index);
                        final eventList = events[date];
                        return ExpansionTile(
                          title: Text(DateFormat('yyyy-MM-dd').format(date)),
                          children: eventList!.map((event) {
                            return ListTile(
                              title: Text(event['name']!),
                              subtitle: Text(event['description']!),
                            );
                          }).toList(),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
