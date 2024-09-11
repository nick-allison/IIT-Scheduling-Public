import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  final DatePickerController _controller = DatePickerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding:
                const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
                decoration: const BoxDecoration(
                    color: Color(0xFF00BD90),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: DatePicker(
                  height: MediaQuery.of(context).size.height * 0.13,
                  DateTime.now(),
                  width: MediaQuery.of(context).size.height * 0.13,
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  inactiveDates: [
                    DateTime.now().add(const Duration(days: 3)),
                    DateTime.now().add(const Duration(days: 4)),
                    DateTime.now().add(const Duration(days: 7))
                  ],
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}