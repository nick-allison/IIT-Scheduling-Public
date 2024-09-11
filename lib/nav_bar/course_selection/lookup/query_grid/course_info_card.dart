import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../selected_courses.dart';
import '../../selected_courses_color.dart';
import '../query_logic/course.dart';
import 'evaluations/rate_my_professor.dart';
import 'evaluations/rate_my_professor_logic.dart';
import 'grid_svg_icon_logic.dart';

class CourseInfoCard extends StatefulWidget {
  final Course course;
  final bool isSmallWidget;

  const CourseInfoCard({
    Key? key,
    required this.course,
    required this.isSmallWidget,
  }) : super(key: key);

  @override
  State<CourseInfoCard> createState() => _CourseInfoCardState();
}

class _CourseInfoCardState extends State<CourseInfoCard> {
  // Initialize RateMyProfessor with default values
  RateMyProfessor rateMyProfessor = RateMyProfessor(
    firstName: '',
    lastName: '',
    rating: 0,
    numReviews: 0,
    pwta: 0,
    difficulty: 0,
  );

  @override
  initState() {
    super.initState();
    // Fetch RateMyProfessor data when the widget is created
    fetchRateMyProfessorData();
  }

  Future<void> fetchRateMyProfessorData() async {
    // Split instructor's name
    String instructorName = widget.course.instructor;
    List<String> nameParts = instructorName.split(', ');

    // Assuming the name is in the format "Last, First"
    String lastName = nameParts.isNotEmpty ? nameParts[0] : '';
    String firstName = nameParts.length > 1 ? nameParts[1] : '';

    // Create RateMyProfessorLogic instance with first and last names
    final logic = RateMyProfessorLogic(firstName, lastName);

    // Fetch RateMyProfessor data
    final rmpData = await logic.getRMPData();

    // Update the state with fetched RateMyProfessor data
    setState(() {
      rateMyProfessor = rmpData;
    });
  }

  @override
  Widget build(BuildContext context) {
    SelectedCourses selectedCoursesProvider =
        Provider.of<SelectedCourses>(context);

    String selectedCourse =
        '${widget.course.courseCode} ${widget.course.courseTitle} - ${widget.course.instructor} ~ ${widget.course.days} ${widget.course.time} in ${widget.course.locations}';

    bool isAddedInSelectedCourses =
        selectedCoursesProvider.courses.contains(selectedCourse);

    return Container(
      height: widget.isSmallWidget ? 132 : 170,
      width: widget.isSmallWidget ? 205 : 258,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.course.courseCode,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: widget.isSmallWidget ? 18 : 28,
                  ),
                ),
                isAddedInSelectedCourses
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.012,
                        height: MediaQuery.of(context).size.width * 0.012,
                        decoration: BoxDecoration(
                          color: SelectedCourseColor
                              .values[selectedCoursesProvider.courses
                                  .indexOf(selectedCourse)]
                              .selectedColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          selectedCoursesProvider.addCourse(selectedCourse);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.add,
                              size: widget.isSmallWidget ? 18 : 28,
                            ),
                            const SizedBox(
                              height: 2.75,
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Instructor: ${widget.course.instructor}',
                    style: TextStyle(fontSize: widget.isSmallWidget ? 10 : 12)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Days: ${widget.course.days}',
                    style: TextStyle(fontSize: widget.isSmallWidget ? 10 : 12)),
                Text('Time: ${widget.course.time}',
                    style: TextStyle(fontSize: widget.isSmallWidget ? 10 : 12)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Location: ${widget.course.locations}',
                    style: TextStyle(fontSize: widget.isSmallWidget ? 10 : 12)),
                Text('Campus: ${widget.course.campus}',
                    style: TextStyle(fontSize: widget.isSmallWidget ? 10 : 12)),
              ],
            ),
            SizedBox(
              height: widget.isSmallWidget ? 1 : 2,
            ),
            Divider(
              indent: 40,
              endIndent: 40,
              thickness: widget.isSmallWidget ? 0.6 : 0.8,
            ),
            SizedBox(
              height: widget.isSmallWidget ? 0 : 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Text(
                              'Enrolled: ${widget.course.enrolled}/${widget.course.max}',
                              style: TextStyle(
                                  fontSize: widget.isSmallWidget ? 10 : 12)),
                          const SizedBox(width: 2),
                          // You need to update the logic for getStatusIcon according to your requirements
                          GridSvgIconLogic().getStatusIcon(
                              widget.course.enrolled,
                              widget.course.max,
                              2,
                              false,
                              widget.isSmallWidget),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Text('Prerequisites >',
                            style: TextStyle(
                                fontSize: widget.isSmallWidget ? 10 : 12)),
                      ],
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Text(
                              'RMP: ${rateMyProfessor.rating}/5 (${rateMyProfessor.numReviews})',
                              style: TextStyle(
                                  fontSize: widget.isSmallWidget ? 10 : 12)),
                          const SizedBox(width: 2),
                          GridSvgIconLogic().getStatusIcon(
                              rateMyProfessor.rating,
                              5,
                              2,
                              true,
                              widget.isSmallWidget),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Text('Description >',
                            style: TextStyle(
                                fontSize: widget.isSmallWidget ? 10 : 12)),
                      ],
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
              ],
            ),
            // Add more Text widgets for other course details as needed
          ],
        ),
      ),
    );
  }
}
