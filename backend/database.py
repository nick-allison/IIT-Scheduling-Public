from pprint import pp
from supabase import create_client, Client
import os
import dotenv

# Connects to the Supabase api

dotenv.load_dotenv()
SUPABASE_URL: str = os.environ['DB_URL']
SUPABASE_KEY: str = os.environ['DB_KEY']

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

def getCourse(courseSubject, courseNumber):
    data = supabase.table("courses").select("*").eq('courseSubject', courseSubject).eq('courseNumber', courseNumber).neq('courseTitle', 'Laboratory').neq("time", " - ").execute().data
    if (data):
        # pp(data) #del
        return data
    else:
        print("getCourse: No data found :(")
    pass

def getTestRow(testId):
    data = supabase.table("test").select("*").single().execute().data
    if (data):
        pp(data) #del
        return data
    else:
        print("getTestRow: No data found :(")
    pass

def insertLogin(username, password):
    try:
        table = supabase.table("login")
    except:
        return