import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/controller/app_controller.dart';
import 'package:global_health_opinion/utilities/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class Create extends StatelessWidget {
  Create({super.key});

  final AppController _scheduleController = Get.put(AppController());

  void _showAddScheduleDialog(BuildContext context) {
    Get.defaultDialog(
      title: ('Add Schedule for ${_scheduleController.formattedSelectedDay}'),
      titleStyle: TextStyle(
        color: AppUtilities().primary,
      ),
      content: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _scheduleController.eventName.value = value,
              decoration: InputDecoration(
                hintText: 'Event Name',
                prefixIcon: const Icon(Icons.event),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              onChanged: (value) =>
                  _scheduleController.eventDescription.value = value,
              decoration: InputDecoration(
                hintText: 'Event Description',
                prefixIcon: const Icon(Icons.event_note_rounded),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppUtilities().primary,
                  ),
                  onPressed: () {
                    // Add the event to the controller
                    _scheduleController.addEvent(
                      _scheduleController.selectedDay.value,
                      _scheduleController.eventName.value,
                      _scheduleController.eventDescription.value,
                    );
                    Get.back();
                  },
                  child: const Text(
                    'Add Schedule',
                    style: TextStyle(color: AppUtilities.background),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _scheduleController.clearSelectedDay();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppUtilities().primary,
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppUtilities.background),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUtilities.background, // Set the background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => TableCalendar(
              firstDay: DateTime.utc(2020, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _scheduleController.focusedDay.value,
              selectedDayPredicate: (day) {
                return isSameDay(_scheduleController.selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                _scheduleController.selectedDay.value = selectedDay;
                _scheduleController.focusedDay.value = focusedDay;
                _showAddScheduleDialog(context);
              },
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                decoration: BoxDecoration(
                  color:
                      AppUtilities().primary, // Background color for the header
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
        ),
      ),
    );
  }
}
