import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_logic/user_search_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../year_semester_drop_down/year_semester.dart';
import 'course.dart';

class QueryLogic {
  final UserSearchInput userInput;
  final YearSemester yearSemester;

  QueryLogic(this.userInput, this.yearSemester);

  Future<List<Course>> _getCachedCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedCourses = prefs.getString('cached_courses');

    return cachedCourses != null
        ? (jsonDecode(cachedCourses) as List)
        .map((courseData) => Course.fromJson(courseData))
        .toList()
        : [];
  }

  Future<void> _cacheCourses(List<Course> courses) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert List<Course> to JSON and save to shared preferences
    await prefs.setString(
      'cached_courses',
      jsonEncode(courses.map((course) => course.toJson()).toList()),
    );
  }

  Future<List<Course>> _getCachedOrSupabaseQuery() async {
    // Check if cached data is available
    List<Course> cachedCourses = await _getCachedCourses();

    // If cached data is available, return it; otherwise, fetch from Supabase
    if (cachedCourses.isNotEmpty) {
      return cachedCourses;
    } else {
      final data = await Supabase.instance.client
          .from(EnumToString.convertToString(yearSemester))
          .select('*')
          .execute();
      final courses = data.data as List;

      // Convert dynamic data to List<Course>
      List<Course> newCourses =
      courses.map((courseData) => Course.fromJson(courseData)).toList();

      // Cache the new data
      await _cacheCourses(newCourses);

      return newCourses;
    }
  }

  Future<List<Course>> getFilteredCourses() async {
    List<Course> receivedCourses = await _getCachedOrSupabaseQuery();
    List<Course> filteredCourses = [];

    for (var course in receivedCourses) {
      if (course.containsQuery(userInput.userInput)) {
        filteredCourses.add(course);
      }
    }

    return filteredCourses;
  }
}