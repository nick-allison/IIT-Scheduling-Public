# iitschedulingapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

# IPro 497 – Product Design Document

## Problem statement
Problem statement: IIT students can use an intuitive application, using their major, year, and class requirements to automatically generate a course schedule given their major and certain manually set preferences.

## Customer
IIT Students

### Description
An application used to help students and faculty make class scheduling easier

### Other customer(s) or stakeholder(s)
College Students, Professors, IIT (or other University)

## Application type (web app, mobile, website, native client, …)
Potentially all of the above (starting with a web app)

### Tech stack
Flutter (UI frontend) + Python(backend) + CSS(?) + Supabase(sql DB)

#### Client Tech 
Flutter + CSS
#### Server Tech
Python + Supabase(Sql)
## Top Application Capabilities (name at least 5)
- Pull live data from IIT course registration database.
- Calculate courses that can be taken at the given semester.
- Display formulated courses.
- Properly filter through all available courses given set criteria such as major, prerequisites, and time. 
- Generate schedules given a student's major, year, and class requirements.

### Other potential capabilities:
- Add a Ratemyprofessor rating next to the courses

## Top Two to Three Scenarios
[see sample scenarios](https://github.com/mschray/IPro497Sample/blob/main/Examples/ScenarioExample.md)

### Your Scenario #1
A student is running out of time to think of what classes they want to take for their upcomming semester. He see's a sign talking about an app called (name pending) and downloads it on their phone. There it asks the student to enter some information, preferences, major and all that. Finally the students list of classes is narrowed down to a handful, making it easier for them to choose their classes in time!
### Your Scenario #2
A new student has just transferred to IIT; they have a very busy schedule and only have time for classes at certain times.  Trying to manually create a course schedule that will satisfy all of their major requirements using only courses that they can fit into their schedule would be an extremely time consuming, tedious, and frustrating process.  They can instead use the IIT Scheduling app to register for the right classes effortlessly in just a few minutes.

## Team Members
Please create a table for the details below 

| Name |	Location	| Time zone offset from Chicago (Chicago is 0 offset)|
| -- | -- | -- |
| Nick Allison | Chicago | CDT |
| Mosa Abdelnabi | Chicago | CDT |
| Anthony Franco | Chicago | CDT |
| David Halmy | Chicago | CDT |
| Devin Liu | Chicago | CDT |

## Team Working Agreement (All team members)
### What do we want to accomplish/learn together?

### Tools
#### Examples (edit and add your own)
- We will use Github for version control. Team-members will push their finished code to a branch to ensure the main branch remains bug-free. 
- If we need to meet outside of class we have found a mutually agreeable time at: Discord o clock
- If we need to meet outside of class we will use the following tool/tech for meetings: Discord
- When we are not meeting together we will use the following tool/tech for communications: Discord

### Requested Approach/Behavior 
##### Examples (edit and add your own)
- We will communicate respectfully in a professional manner. Discussions only. No arguing/name calling of any kind. Respect the ideas of each team member.
- We will divide work fairly. Each member will be responsible for the work they choose to be assigned to (based on their skillset). Each member should be assigned to one or more stories on the Kanban board.

### Unacceptable behavior
- Not communicating with the rest of the team.
- Not completing assigned tasks.
- Arguing/name calling.
- The app must NOT leak all of the students' private information

### How will we productively solve disagreement
https://spinthewheel.app/editor

## Sprint Schedule

| Week | Sprint Leader |
| --------  | ------------------- |
| 1 - Problem Framing                                 | Nick Allison  |
| 2 - Problem Framing                                 | Nick Allison  |
| 3 - Problem Framing                                 | Mosa Abdelnabi|
| 4 - Problem Framing                                 | Mosa Abdelnabi|
| 5 - Think, build, test, and demo for midterm        | Anthony Franco |
| 6 - Think, build, test, and demo for midterm        | Anthony Franco |
| 7 - Think, build, test, and demo for midterm        | David Halmy |
| 8 - Think, build, test, and demo for midterm        | David Halmy|
| 9 - Think, build, test, and demo for final          | Devin Liu |
| 10 - Think, build, test, and demo for final	      | Devin Liu |
| 11 - Think, build, test, and demo for final         | Nick Allison  |
| 12 - Think, build, test, and demo for final         | Mosa Abdelnabi         |
| 13 - Think, build, test, and demo for final         | Anthony Franco          |
| 14 - Presentation dry run                           | David Halmy   |
| 15 - Presentation                                   | Devin Liu |

## UI Mockups
### Course Selection
![IITSchedulingApp - Course Selection (Light)](https://github.com/anthonyfranco0123/iitschedulingapp/assets/67798119/b2217ba0-cd2d-44be-b0ad-80eb0ce3c34e)

![IITSchedulingApp - Course Selection (Dark)](https://github.com/anthonyfranco0123/iitschedulingapp/assets/67798119/2d6f47e9-e5b6-469e-b7a2-4a03504528fb)

![IITSchedulingApp - Course Selection ~ CS Search (Light)](https://github.com/anthonyfranco0123/iitschedulingapp/assets/67798119/1d3b6b83-5a47-4ef4-a1c0-c7290def46ce)

![IITSchedulingApp - Course Selection ~ CS Search (Dark)](https://github.com/anthonyfranco0123/iitschedulingapp/assets/67798119/99dd8bf4-ffa4-4559-9c44-5a440d07cfa6)

![IITSchedulingApp - Course Selection ~ CS Search   Chosen (Light)](https://github.com/anthonyfranco0123/iitschedulingapp/assets/67798119/61f31e6c-817e-4153-a3ff-b969371f67a7)

![IITSchedulingApp - Course Selection ~ CS Search   Chosen (Dark)](https://github.com/anthonyfranco0123/iitschedulingapp/assets/67798119/6882c438-65f1-41b1-adaa-0086bdefc0cc)

### Tasks
![IITSchedulingApp - Tasks (Light)](https://github.com/anthonyfranco0123/iitschedulingapp/assets/67798119/e872cbb6-18a2-4465-a5df-2c5d027337a4)

![IITSchedulingApp - Tasks (Dark)](https://github.com/anthonyfranco0123/iitschedulingapp/assets/67798119/4bb6886c-eebe-42c4-9c91-ff2274111581)
