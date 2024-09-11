import os
from supabase import create_client, Client
from bs4 import BeautifulSoup
import requests

#automatically updates info for every professor in the database

url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_KEY")

supabase: Client = create_client(url, key)

#read everything from the database
data = supabase.table('ratemyprofessor').select("*").execute()

for i in data.data:

    #the id for each professor stored in the database can be used to access the professor's RMP url
    id = i['id']

    #open the professor's page
    page = requests.get("https://www.ratemyprofessors.com/professor/" + id)
    soup = BeautifulSoup(page.content, "html.parser")

    #pull relevant info
    rating = soup.find('div', {'class':'RatingValue__Numerator-qw8sqy-2 liyUjw'}).text
    if rating == 'N/A':
        rating = '-1'
    nr = soup.find('a', {'href':'#ratingsList'})
    if nr is None:
        numReviews = "0"
    else:
        numReviews = nr.text
        numReviews = numReviews[0:len(numReviews)-8]
    temp = soup.findAll('div', {'class': 'FeedbackItem__FeedbackNumber-uof32n-1 kkESWs'})
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

    #check info pulled from site against info in db and update as needed
    if i['rating'] != rating:
        supabase.table('ratemyprofessor').update({'rating': float(rating)}).eq('id', id).execute()

    if i['numreviews'] != numReviews:
        supabase.table('ratemyprofessor').update({'numreviews': int(numReviews)}).eq('id', id).execute()

    if i['pwta'] != percentagain:
        supabase.table('ratemyprofessor').update({'pwta': int(percentagain)}).eq('id', id).execute()

    if i['difficulty'] != difficulty:
        supabase.table('ratemyprofessor').update({'difficulty': float(difficulty)}).eq('id', id).execute()
