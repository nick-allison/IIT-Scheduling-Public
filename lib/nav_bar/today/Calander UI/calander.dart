import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // Mock data for tasks
  Map<DateTime, List<String>> tasks = {
    DateTime(2023, 11, 1): ['Task 1', 'Task 2'],
    DateTime(2023, 11, 5): ['Task 3'],
    // Add more tasks as needed
  };

  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime(2023, 11, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: DateTime(DateTime.now().year, 11 + 1, 0).day,
              itemBuilder: (context, index) {
                DateTime day = DateTime(2023, 11, index + 1);
                bool hasTasks = tasks.containsKey(day);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = day;
                    });
                  },
                  child: Container(
                    color: day.month == 11 ? Colors.white : Colors.grey[300],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${day.day}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: hasTasks ? Colors.blue : Colors.black,
                            ),
                          ),
                          if (hasTasks)
                            const Icon(
                              Icons.event,
                              color: Colors.blue,
                              size: 12.0,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${selectedDate.toLocal()}'.split(' ')[0],
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                if (tasks.containsKey(selectedDate))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: tasks[selectedDate]
                        !.map((task) => Text('- $task'))
                        .toList(),
                  )
                else
                  const Text('No tasks for this day'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}