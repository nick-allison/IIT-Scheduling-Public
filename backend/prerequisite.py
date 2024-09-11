from pprint import pp
from bs4 import BeautifulSoup, NavigableString
import requests
from database import getCourse, getTestRow

def get_course_html(cat_term_in=None, subj_code_in=None, crse_numb_in=None):
    if (not cat_term_in):
        cat_term_in = input("Enter the cat_term_in value: ")
    if (not subj_code_in):
        subj_code_in = input("Enter the subj_code_in value: ")
    if (not crse_numb_in):
        crse_numb_in = input("Enter the crse_numb_in value: ")

    # Construct the URL based on the user input
    base_url = "https://ssb.iit.edu/bnrprd/bwckctlg.p_disp_course_detail"
    params = {
        'cat_term_in': cat_term_in,
        'subj_code_in': subj_code_in,
        'crse_numb_in': crse_numb_in
    }

    response = requests.get(base_url, params=params)

    # Check if request was successful
    if response.status_code == 200:
        return response.text
    else:
        return f"Failed to retrieve content. Status code: {response.status_code}"

# print(response)

def getPrereqs(courseSubject=None, courseNumber=None):
    response = get_course_html("202410", courseSubject, courseNumber)
    prereqs_list = []
    soup = BeautifulSoup(response, 'html.parser')

    for text in soup.find_all(string=lambda s: 'Course or Test:' in s):
        # print(text)
        next_element = text.find_next()
        if next_element and next_element.name == 'a':
            a_text = next_element.text
            next_text_element = next_element.next_sibling
            if isinstance(next_text_element, NavigableString):
                combined_text_list = a_text.split() + next_text_element.strip().split()
                prereqs_list.append(combined_text_list)
                # print(combined_text_list)

    return prereqs_list

prereq_list = getPrereqs()
pp(prereq_list)

for prereq in prereq_list:
    (getCourse(prereq[0], int(prereq[1])))

