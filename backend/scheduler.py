import random  # Import the random module
from pprint import pp
from database import getCourse

class Scheduler: # class to create class schedule variations
    def __init__(self) -> None:
        pass

    def _parse_time(self, time_str):
        """Parse a time period string into a tuple of integers."""
        start, end = time_str.split(' - ')
        return int(start), int(end)

    def _is_overlapping(self, course1, course2):
        """Check if two courses overlap in time and days."""
        days1 = set(course1['days'])
        days2 = set(course2['days'])

        if not days1.intersection(days2):
            return False

        start1, end1 = self._parse_time(course1['time'])
        start2, end2 = self._parse_time(course2['time'])

        return not (end1 <= start2 or start1 >= end2)

    def get_schedule(self, grouped_courses, desired_count=5):
        """Select a set number of non-overlapping courses with their associated lab/rec sections."""
        random.shuffle(grouped_courses)
        selected_courses = []
        added_courses = set()  # A set to keep track of added courses' names

        selected_groups = 0  # Counter for selected groups of related courses

        for group in grouped_courses:
            lecture = None
            lab_rec = None
            for course in group:
                if course['courseType'] in ['LEC', 'B']:
                    lecture = course
                elif course['courseType'] in ['LAB', 'REC']:
                    lab_rec = course

            if lecture is None:
                continue  # Skip groups without a lecture section

            # Check for course name duplication
            if lecture['courseTitle'] in added_courses:
                continue

            # Check for time overlap with already selected courses
            if any(self._is_overlapping(lecture, selected_course) for selected_course in selected_courses):
                continue
            if lab_rec and any(self._is_overlapping(lab_rec, selected_course) for selected_course in selected_courses):
                continue

            # Add the lecture and lab/rec sections to the selected courses list
            selected_courses.append(lecture)
            added_courses.add(lecture['courseTitle'])  # Add the course name to the set
            if lab_rec:
                selected_courses.append(lab_rec)

            selected_groups += 1  # Increment the counter for selected groups

            if selected_groups == desired_count:
                break

        return selected_courses

if __name__ == '__main__':
    course_list = [
        ('CS', '330'),
        ('CS', '425'),
        ('CS', '350'),
        ('CS', '351'),
        ('CS', '116'),
        ('CS', '430'),
        ('MATH', '251'),
        ('MATH', '152'),
        ('PHYS', '221'),
        ('CS', '201'),
        ('COM', '372'),
        ('COM', '377'),
        ('CS', '540'),
        ('CS', '480'),
        ('CS', '445'),
        ('MATH', '252')
        ]

    courses = [group for group in (getCourse(c[0], c[1]) for c in course_list) if group is not None]


    pp(courses)

    selected_courses = Scheduler().get_schedule(courses)
    for course in selected_courses:
        print(f"Selected: {course['courseType']} - {course['courseTitle']} with {course['instructor']} at {course['time']} on days {course['days']}")
