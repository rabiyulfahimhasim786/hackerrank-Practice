📊 SQL Occupations Problem

This repository contains SQL solutions for the Occupations Query Challenge.

📌 Problem Statement

You are given an OCCUPATIONS table with the following schema:

Column	Type	Description
Name	String	Name of the person
Occupation	String	One of the following values: Doctor, Professor, Singer, Actor
🔹 Task 1

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession in parentheses.

Example Format:

AnActorName(A)
ADoctorName(D)
AProfessorName(P)
ASingerName(S)

🔹 Task 2

Query the number of occurrences of each occupation in OCCUPATIONS.

Sort results by ascending order of count.

If two occupations have the same count, order them alphabetically.

Output format:

There are a total of [occupation_count] [occupation]s.


where:

[occupation_count] = number of occurrences of that occupation

[occupation] = lowercase occupation name

📂 Sample Input

An OCCUPATIONS table with the following data:

Name	Occupation
Samantha	Doctor
Julia	Actor
Maria	Actor
Meera	Singer
Ashely	Professor
Ketty	Professor
Christeen	Professor
Jane	Actor
Jenny	Doctor
Priya	Singer
📂 Sample Output
Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.

📝 SQL Solutions
✅ Query 1 – Names with Occupation Initial
SELECT Name || '(' || SUBSTR(Occupation, 1, 1) || ')'
FROM OCCUPATIONS
ORDER BY Name;

✅ Query 2 – Count of Each Occupation
SELECT 'There are a total of ' 
       || COUNT(*) 
       || ' ' 
       || LOWER(Occupation) 
       || 's.'
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;

🚀 How to Run

Open your SQL environment (e.g., DB2, MySQL, or PostgreSQL).

Create the OCCUPATIONS table and insert sample data.

Run the queries provided above.

✨ This is a common SQL interview/HackerRank problem that helps practice GROUP BY, ORDER BY, and string formatting.
