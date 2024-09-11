import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_box/query_box.dart';


class Lookup extends StatelessWidget {
  const Lookup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a SizedBox with a width of 47.5% of the screen width
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.875,
      width: MediaQuery.of(context).size.width * 0.525,
      child: const QueryBox(),
    );
  }
}