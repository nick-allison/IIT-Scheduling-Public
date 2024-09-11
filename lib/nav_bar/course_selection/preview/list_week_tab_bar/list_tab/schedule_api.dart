import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../selected_courses.dart';

List<List<String>> parseCourses(List<String> courseList) {
  return courseList.map((course) {
    var parts = course.split(' ');

    var department = parts[0];
    var courseNumber = parts[1].split('-')[0];

    return [department, courseNumber];
  }).toList();
}

Future<void> postSchedule(SelectedCourses selectedCourses) async {
  print("clicked!");
  var url = Uri.parse('http://localhost:5000/generate_schedule');
  List<List<String>> parsedCourses = parseCourses(selectedCourses.courses);

  for (var course in parsedCourses) {
    print('Parsed course: (${course[0]}, ${course[1]})');
  }
  try {
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'courseList': parsedCourses
      }), // Sending selected courses to python server
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print('Response data: $responseData');
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print("Error: $e");
  }
}

Future<dynamic> getCourseDetails(SelectedCourses selectedCourses) async {
  var url = Uri.parse('http://localhost:5000/get_course_details');
  List<List<String>> parsedCourses = parseCourses(selectedCourses.courses);
  try {
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'courseList': parsedCourses
      }), // Sending selected courses to python server
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      // print('Response data: $responseData');
      return responseData;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print("Error: $e");
  }
}

Future<dynamic> getProfessorInfo(String instructor) async {
  var url = Uri.parse('http://localhost:5000/professor_info');

  List<String> nameParts = instructor.split(', ');
  if (nameParts.length != 2) {
    print("Invalid instructor name format");
    return;
  }

  String lastName = nameParts[0].trim();
  String firstName = nameParts[1].trim();

  try {
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'firstName': firstName,
        'lastName': lastName
      }),
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to load professor data');
    }
  } catch (e) {
    print("Error: $e");
  }
}