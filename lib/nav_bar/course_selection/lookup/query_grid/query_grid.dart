import 'package:flutter/material.dart';
import '../query_logic/course.dart';
import 'course_info_card.dart';

class QueryGrid extends StatelessWidget {
  final List<Course> courses;
  final int firstColumnCourseListLength;
  final int secondColumnCourseListLength;
  final int thirdColumnCourseListLength;

  QueryGrid({
    Key? key,
    required this.courses,
    required this.firstColumnCourseListLength,
    required this.secondColumnCourseListLength,
    required this.thirdColumnCourseListLength,
  }) : super(key: key);

  final List<int> _columnCourseListLengths = [];

  void _calculateColumnCourseListLengths() {
    for (int i = 0; i < 3; i++) {
      _columnCourseListLengths.add(_getColumnCourseListLength(i));
    }
  }

  int _getColumnCourseListLength(int columnPosition) {
    return (courses.length / 3).ceil();
  }

  Widget _buildCourseColumn(int startIndex, int step, bool isSmallWidget) {
    const gap = 19.343;

    return Expanded(
      child: Column(
        children: <Widget>[
          for (int i = startIndex; i < courses.length; i += step)
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
                bottom: gap,
                left: gap / 2,
                right: gap / 2,
              ),
              child: CourseInfoCard(
                course: courses[i],
                isSmallWidget: isSmallWidget,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _calculateColumnCourseListLengths();

    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCourseColumn(0, 3, true),
          _buildCourseColumn(1, 3, false),
          _buildCourseColumn(2, 3, true),
        ],
      ),
    );
  }
}