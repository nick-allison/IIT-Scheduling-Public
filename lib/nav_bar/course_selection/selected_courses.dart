import 'package:flutter/foundation.dart';

class SelectedCourses extends ChangeNotifier {
  final List<String> _courses = [];
  bool isAddedInSelectedCourses = false;

  void addCourse(String course) {
    if (course.isEmpty || _courses.contains(course)) {
      return;
    }
    _courses.add(course);
    setAddedInSelectedCourses(true);
  }

  void removeCourse(String course) {
    _courses.remove(course);
    setAddedInSelectedCourses(false);
  }

  void clearCourses() {
    _courses.clear();
    setAddedInSelectedCourses(false);
  }

  List<String> get courses {
    return _courses;
  }

  void setAddedInSelectedCourses(bool value) {
    isAddedInSelectedCourses = value;
    notifyListeners();
  }
}