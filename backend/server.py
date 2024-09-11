from flask import Flask, request, jsonify
from flask_cors import CORS

from ratemyprofessor.RMP_APIs import Professor
from scheduler import Scheduler 
from database import getCourse

app = Flask(__name__)
CORS(app)

@app.route('/generate_schedule', methods=['POST'])
def generate_schedule():
    print("hi")
    course_list = request.json['courseList']
    courses = [group for group in (getCourse(c[0], c[1]) for c in course_list) if group is not None]
    
    scheduler = Scheduler()
    selected_courses = scheduler.get_schedule(courses)
    
    # Convert the selected courses into a JSON-serializable format
    selected_courses_json = [{k: v for k, v in course.items()} for course in selected_courses]
    
    print(selected_courses)
    return jsonify(selected_courses_json)

from flask import jsonify

@app.route('/get_course_details', methods=['POST'])
def get_course_details():
    course_list = request.json['courseList']
    courses = [group for group in (getCourse(c[0], c[1]) for c in course_list) if group is not None]

    keys_to_keep = ['campus', 'courseNumber', 'days', 'time', 'courseSubject', 'courseTitle', 'courseType', 'departmentCode']
    filtered_courses = []
    filtered_courses = [[{key: course[key] for key in keys_to_keep if key in course} for course in sublist] for sublist in courses]

    # print(courses)
    print(filtered_courses)
    return jsonify(filtered_courses)


@app.route('/professor_info', methods=['POST'])
def professor_info():
    data = request.json
    first_name = data.get('firstName')
    last_name = data.get('lastName')

    # Create a Professor instance and fetch data
    professor = Professor(first_name, last_name)
    professor.activate()

    # Prepare and send response
    response = {
        'rating': professor.getRating(),
        'difficulty': professor.getDifficulty(),
        # 'pwta': professor.getPwta(),
        # 'numReviews': professor.getNumreviews()
    }

    return jsonify(response)


if __name__ == '__main__':
    app.run(debug=True)
