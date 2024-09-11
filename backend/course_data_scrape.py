import requests
import json

url = "https://wildfly-prd.iit.edu/coursestatusreport/api/report/getCSR"
headers = {
    "Host": "wildfly-prd.iit.edu"
}

#for testing purposes

request_data = {
    "selectedTerm": "202410",
    "selectedSubjectsForTerm": [
        #uncomment this and comment line 17 to print out all of the course data for term 202410
        # {"subjectCode":"AS","subjectDesc":"Air Force Aerospace Studies"},{"subjectCode":"AURB","subjectDesc":"Architecture and Urbanism"},{"subjectCode":"BIOL","subjectDesc":"Biology"},{"subjectCode":"BME","subjectDesc":"Biomedical Engineering"},{"subjectCode":"BUS","subjectDesc":"Business"},{"subjectCode":"CAE","subjectDesc":"Civil and Architectural Engr"},{"subjectCode":"CHE","subjectDesc":"Chemical Engineering"},{"subjectCode":"CHEM","subjectDesc":"Chemistry"},{"subjectCode":"COM","subjectDesc":"Communications"},{"subjectCode":"CS","subjectDesc":"Computer Science"},{"subjectCode":"CSP","subjectDesc":"Computer Science Prof Master"},{"subjectCode":"CSSP","subjectDesc":"Computer Science Self-Paced"},{"subjectCode":"DS","subjectDesc":"Data Science"},{"subjectCode":"ECE","subjectDesc":"Electrical and Computer Engr"},{"subjectCode":"ECON","subjectDesc":"Economics"},{"subjectCode":"EG","subjectDesc":"Engineering Graphics"},{"subjectCode":"EMGT","subjectDesc":"Engineering Management"},{"subjectCode":"EMS","subjectDesc":"Envtl Mgmt and Sustainability"},{"subjectCode":"ENGR","subjectDesc":"General Engineering"},{"subjectCode":"ENVE","subjectDesc":"Environmental Engineering"},{"subjectCode":"EXCH","subjectDesc":"Exchange Student"},{"subjectCode":"FDSC","subjectDesc":"Food Science (CEUs only)"},{"subjectCode":"FDSN","subjectDesc":"Food Science and Nutrition"},{"subjectCode":"GCS","subjectDesc":"Graduate Continuation Studies"},{"subjectCode":"GEM","subjectDesc":"Game Design & Experiential Mgm"},{"subjectCode":"GLS","subjectDesc":"General Learning Strategies"},{"subjectCode":"HIST","subjectDesc":"History"},{"subjectCode":"HUM","subjectDesc":"Humanities"},{"subjectCode":"IDN","subjectDesc":"Institute of Design"},{"subjectCode":"IDX","subjectDesc":"Institute of Design"},{"subjectCode":"IEP","subjectDesc":"Intensive English Program"},{"subjectCode":"INTM","subjectDesc":"Industrial Tech and Mgmt"},{"subjectCode":"INTR","subjectDesc":"Internship"},{"subjectCode":"IPMM","subjectDesc":"Intellectual Prop Mgt and Mkts"},{"subjectCode":"IPRO","subjectDesc":"Interprofessional Project"},{"subjectCode":"ITM","subjectDesc":"Information Tech and Mgmt"},{"subjectCode":"ITMD","subjectDesc":"ITM Development"},{"subjectCode":"ITMM","subjectDesc":"ITM Management"},{"subjectCode":"ITMO","subjectDesc":"ITM Operations"},{"subjectCode":"ITMS","subjectDesc":"ITM Security"},{"subjectCode":"ITMT","subjectDesc":"ITM Theory and Technology"},{"subjectCode":"LA","subjectDesc":"Landscape Architecture"},{"subjectCode":"LAW","subjectDesc":"Law"},{"subjectCode":"LCHS","subjectDesc":"Lewis College Human Science"},{"subjectCode":"LCS","subjectDesc":"Law Continuation Studies"},{"subjectCode":"MATH","subjectDesc":"Mathematics"},{"subjectCode":"MAX","subjectDesc":"Marketing Analytics"},{"subjectCode":"MBA","subjectDesc":"MBA Business"},{"subjectCode":"MILS","subjectDesc":"Military Science"},{"subjectCode":"MMAE","subjectDesc":"Mechl, Mtrls and Arspc Engrg"},{"subjectCode":"MS","subjectDesc":"Materials Science"},{"subjectCode":"MSC","subjectDesc":"Management Science"},{"subjectCode":"MSED","subjectDesc":"Mathematics and Science Educ"},{"subjectCode":"MSF","subjectDesc":"Master of Science in Finance"},{"subjectCode":"NS","subjectDesc":"Naval Science"},{"subjectCode":"PA","subjectDesc":"Public Administration"},{"subjectCode":"PD","subjectDesc":"Professional Development"},{"subjectCode":"PESL","subjectDesc":"Profcncy of Engl Second Lang"},{"subjectCode":"PHIL","subjectDesc":"Philosophy"},{"subjectCode":"PHYS","subjectDesc":"Physics"},{"subjectCode":"PS","subjectDesc":"Political Science"},{"subjectCode":"PSYC","subjectDesc":"Psychology"},{"subjectCode":"SAM","subjectDesc":" Sustainability Analytics & Ma"},{"subjectCode":"SCI","subjectDesc":"Science"},{"subjectCode":"SOC","subjectDesc":"Sociology"},{"subjectCode":"SSB","subjectDesc":"Stuart School of Business"},{"subjectCode":"SSCI","subjectDesc":"Social Sciences"},{"subjectCode":"STAT","subjectDesc":"Statistics"},{"subjectCode":"UCS","subjectDesc":"Undergrad Continuing Studies"}

        {"subjectCode": "CS", "subjectDesc": "Computer Science"}
    ]
}

response = requests.post(url, headers=headers, json=request_data)

# Check if the request was successful
if response.status_code == 200:
    # Extract the JSON content from the response
    response_json = response.json()

    # Write the JSON data to a file
    with open('data.json', 'w') as json_file:
        json.dump(response_json, json_file)
    
    print("Data saved to 'data.json'.")
else:
    print(f"Request failed with status code: {response.status_code}")