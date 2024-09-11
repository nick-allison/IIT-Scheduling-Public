import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/preview.dart';

import 'lookup/lookup.dart';


class CourseSelection extends StatefulWidget {
  const CourseSelection({Key? key}) : super(key: key);

  @override
  State<CourseSelection> createState() => _CourseSelectionState();
}

class _CourseSelectionState extends State<CourseSelection> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3), // Gray background with some transparency
        borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Lookup()), // Widget for looking up course information
          Expanded(child: Preview()), // Widget for previewing course information
        ],
      ),
    );
  }
}