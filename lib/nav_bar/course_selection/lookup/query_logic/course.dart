class Course {
  final String status;
  final int departmentCode;
  final String courseCode;
  final String courseSubject;
  final int courseNumber;
  final String courseTitle;
  final String crossListCode;
  final String college;
  final String department;
  final String courseType;
  final int credits;
  final String days;
  final String time;
  final String instructor;
  final int max;
  final int enrolled;
  final int available;
  final int waitCount;
  final String campus;
  final String locations;
  final int seating;
  final String dates;

  Course({
    required this.status,
    required this.departmentCode,
    required this.courseCode,
    required this.courseSubject,
    required this.courseNumber,
    required this.courseTitle,
    required this.crossListCode,
    required this.college,
    required this.department,
    required this.courseType,
    required this.credits,
    required this.days,
    required this.time,
    required this.instructor,
    required this.max,
    required this.enrolled,
    required this.available,
    required this.waitCount,
    required this.campus,
    required this.locations,
    required this.seating,
    required this.dates,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      status: json['status'] as String? ?? '',
      departmentCode: json['departmentCode'] as int? ?? 0,
      courseCode: json['courseCode'] as String? ?? '',
      courseSubject: json['courseSubject'] as String? ?? '',
      courseNumber: json['courseNumber'] as int? ?? 0,
      courseTitle: json['courseTitle'] as String? ?? '',
      crossListCode: json['crossListCode'] as String? ?? '',
      college: json['college'] as String? ?? '',
      department: json['department'] as String? ?? '',
      courseType: json['courseType'] as String? ?? '',
      credits: (json['credits'] as num?)?.round() ?? 0,
      days: json['days'] as String? ?? '',
      time: json['time'] as String? ?? '',
      instructor: json['instructor'] as String? ?? '',
      max: int.tryParse(json['max'].toString()) ?? 0,
      enrolled: int.tryParse(json['enrolled'].toString()) ?? 0,
      available: int.tryParse(json['available'].toString()) ?? 0,
      waitCount: int.tryParse(json['waitCount'].toString()) ?? 0,
      campus: json['campus'] as String? ?? '',
      locations: json['locations'] as String? ?? '',
      seating: int.tryParse(json['seating'].toString()) ?? 0,
      dates: json['dates'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'departmentCode': departmentCode,
      'courseCode': courseCode,
      'courseSubject': courseSubject,
      'courseNumber': courseNumber,
      'courseTitle': courseTitle,
      'crossListCode': crossListCode,
      'college': college,
      'department': department,
      'courseType': courseType,
      'credits': credits,
      'days': days,
      'time': time,
      'instructor': instructor,
      'max': max,
      'enrolled': enrolled,
      'available': available,
      'waitCount': waitCount,
      'campus': campus,
      'locations': locations,
      'seating': seating,
      'dates': dates,
    };
  }

  bool containsQuery(String query) {
    return courseCode.toLowerCase().contains(query.toLowerCase()) ||
        courseTitle.toLowerCase().contains(query.toLowerCase()) ||
        crossListCode.toLowerCase().contains(query.toLowerCase()) ||
        college.toLowerCase().contains(query.toLowerCase()) ||
        department.toLowerCase().contains(query.toLowerCase()) ||
        courseType.toLowerCase().contains(query.toLowerCase()) ||
        days.toLowerCase().contains(query.toLowerCase()) ||
        time.toLowerCase().contains(query.toLowerCase()) ||
        instructor.toLowerCase().contains(query.toLowerCase()) ||
        campus.toLowerCase().contains(query.toLowerCase()) ||
        locations.toLowerCase().contains(query.toLowerCase()) ||
        dates.toLowerCase().contains(query.toLowerCase());
  }
}