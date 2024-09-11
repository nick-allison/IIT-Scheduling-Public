import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/query_grid.dart';

import '../query_logic/course.dart';
import '../query_logic/query_logic.dart';
import '../query_logic/user_search_input.dart';
import '../year_semester_drop_down/year_semester.dart';
import '../year_semester_drop_down/year_semester_drop_down.dart';

class QueryBox extends StatefulWidget {
  const QueryBox({Key? key}) : super(key: key);

  @override
  State<QueryBox> createState() => _QueryBoxState();
}

class _QueryBoxState extends State<QueryBox> {
  List<Course> courses = [];
  bool isMouseEnter = false;
  Timer? _debounceTimer;

  int _getColumnCourseListLength(int columnPosition) {
    if (courses.length % 3 != columnPosition) {
      return (courses.length / 3).ceil();
    } else {
      return (courses.length / 3).floor();
    }
  }

  void _onExitMouse(PointerEvent details) {
    setState(() {
      isMouseEnter = false;
    });
  }

  void _onEnterMouse(PointerEvent details) {
    setState(() {
      isMouseEnter = true;
    });
  }

  void _onTextChanged(String userInput) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (userInput.isEmpty) {
        setState(() {
          courses.clear();
        });
        return;
      }
      final userSearchInput = UserSearchInput(userInput);
      QueryLogic queryLogic = QueryLogic(
        userSearchInput,
        YearSemester.fall2023,
      );
      final newCourses = await queryLogic.getFilteredCourses();
      setState(() {
        courses = newCourses;
      });
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: _onTextChanged,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 0.5),
                                hintText: 'Search...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () async {
                              // Perform additional actions on search button press if needed
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: MouseRegion(
                        onEnter: _onEnterMouse,
                        onExit: _onExitMouse,
                        child: AnimatedContainer(
                          padding: EdgeInsets.zero,
                          width: 28,
                          height: 28,
                          duration: const Duration(milliseconds: 300),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              Icons.question_mark_rounded,
                              size: isMouseEnter ? 28 : 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(child: SizedBox(child: YearSemesterDropDown())),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.5),
        if (courses.isNotEmpty)
          Expanded(
            child: QueryGrid(
              courses: courses,
              firstColumnCourseListLength: _getColumnCourseListLength(0),
              secondColumnCourseListLength: _getColumnCourseListLength(1),
              thirdColumnCourseListLength: _getColumnCourseListLength(2),
            ),
          ),
        const SizedBox(height: 18.55),
      ],
    );
  }
}