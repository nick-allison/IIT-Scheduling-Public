
from bs4 import BeautifulSoup
import requests
import json
from selenium import webdriver


f = open("outputfile.txt", 'r')
outfile = open("RMP.json", 'w')

outfile.write("[\n")

for line in f:
    id = line[:len(line) - 1]
    page = requests.get("https://www.ratemyprofessors.com" + id)
    soup2 = BeautifulSoup(page.content, "html.parser")

#Use Beautiful Soup to pull relevant info and store in variables
    first_name = soup2.find('div', {'class':'NameTitle__Name-dowf0z-0 cfjPUG'}).contents[0].text
    t2 = soup2.findAll('span', {'class':'NameTitle__LastNameWrapper-dowf0z-2 glXOHH'})
    last_name = t2[0].text
    rating = soup2.find('div', {'class':'RatingValue__Numerator-qw8sqy-2 liyUjw'}).text
    if rating == 'N/A':
        rating = '-1'
    nr = soup2.find('a', {'href':'#ratingsList'})
    if nr is None:
        numReviews = "0"
    else:
        numReviews = nr.text
        numReviews = numReviews[0:len(numReviews)-8]
    temp = soup2.findAll('div', {'class': 'FeedbackItem__FeedbackNumber-uof32n-1 kkESWs'})
    percentagain = temp[0].text
    if percentagain == 'N/A':
        percentagain = '-1'
    else:
        percentagain = percentagain[:len(percentagain)-1]
    if len(temp) == 1:
        difficulty = '-1'
    else:
        difficulty = temp[1].text
        if difficulty == 'N/A':
            difficulty = '-1'


    first_name = first_name.strip(" ")
    first_name = first_name.title()

    last_name = last_name.strip(" ")
    first_name = first_name.title()

#create a dictionary with the professor's info
    dict = {"first_name":first_name,
        "last_name":last_name,
        "id":id[11:],
        "rating":float(rating),
        "numreviews":int(numReviews),
        "pwta":int(percentagain),
        "difficulty":float(difficulty)}

#serialize json
    json_object = json.dumps(dict, indent=4)

#write to json
    outfile.write("\n")
    outfile.write(json_object)
    outfile.write(",\n")

outfile.write("]")
outfile.close()
