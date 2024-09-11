import requests
import json
import supabase
from pprint import pp
import os

terms = {
    "spring2017": 201720,
    "summer2017": 201730,
    "fall2017": 201810,
    "spring2018": 201820,
    "summer2018": 201830,
    "fall2018": 201910,
    "spring2019": 201920,
    "summer2019": 201930,
    "fall2019": 202010,
    "spring2020": 202020,
    "summer2020": 202030,
    "fall2020": 202110,
    "spring2021": 202120,
    "summer2021": 202130,
    "fall2021": 202210,
    "spring2022": 202220,
    "summer2022": 202230,
    "fall2022": 202310,
    "spring2023": 202320,
    "summer2023": 202330,
    "fall2023": 202410,
    "spring2024": 202420,
    "summer2024": 202430,
    "fall2024": 202510,
    "spring2025": 202520,
    "summer2025": 202530,
    "fall2025": 202610,
    "spring2026": 202620,
    "summer2026": 202630,
    "fall2026": 202710,
    "spring2027": 202720,
    "summer2027": 202730,
    "fall2027": 202810,
    "spring2028": 202820,
    "summer2028": 202830,
    "fall2028": 202910,
    "spring2029": 202920,
    "summer2029": 202930,
    "fall2029": 203010,
    "spring2030": 203020,
    "summer2030": 203030
}


supabase_url = os.environ.get("SUPABASE_URL")
supabase_key = os.environ.get("SUPABASE_KEY")
supabase_client = supabase.Client(supabase_url, supabase_key)



def upsert_data(term_code,term_name):

    # recursive function to replace null values with "n/a"
    def replace_null_with_na(data):
        if isinstance(data, dict):
            for key, value in data.items():
                if value is None:
                    data[key] = "n/a"
                else:
                    replace_null_with_na(value)
        elif isinstance(data, list):
            for index, item in enumerate(data):
                if item is None:
                    data[index] = "n/a"
                else:
                    replace_null_with_na(item)


    # fetch the course name data from the API
    url = f"https://wildfly-prd.iit.edu/coursestatusreport/api/report/getSubjects/?term={term_code}"
    headers = {
            "Host": "wildfly-prd.iit.edu",
    }

    coursesForTerm = requests.get(url, headers=headers)



    # fetch the course details from the API
    url = "https://wildfly-prd.iit.edu/coursestatusreport/api/report/getCSR"
    headers = {
        "Host": "wildfly-prd.iit.edu"
    }

    request_data = {
        "selectedTerm": f"{term_code}",
        "selectedSubjectsForTerm":coursesForTerm.json()
    }
    response = requests.post(url, headers=headers, json=request_data)

    if response.status_code == 200:
        courses_data = response.json()

        # replace null values with "n/a"
        replace_null_with_na(courses_data)


        # remove duplicate keys
        seen = set()
        unique_courses_data = []
        for course in courses_data:
            key = (course["departmentCode"], course["days"], course["time"], course["instructor"])
            if key not in seen:
                seen.add(key)
                unique_courses_data.append(course)
        
        # upsert the data into the 'courses' table (or whatever your table name is)
        result = supabase_client.table(term_name).upsert(unique_courses_data).execute()

        print(f"Data upserted successfully")
    else:
        print(f"Request failed with status code: {response.status_code}")



if __name__ == "__main__":
    term_name = input("Please enter the term (e.g., fall2023):").lower()
    term_code = terms.get(term_name.lower())

    if term_code:
        upsert_data(term_code,term_name)
    else:
        print("Invalid term entered. Please use the format like 'fall2023'.")