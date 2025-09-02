📊 SQL Occupations Pivot Problem

This repository contains the SQL solution for the Occupations Pivot Challenge.

📌 Problem Statement

You are given an OCCUPATIONS table with the following schema:

Column	Type	Description
Name	String	Name of the person
Occupation	String	One of the following values: Doctor, Professor, Singer, Actor
🔹 Task

Pivot the Occupation column so that each Name is sorted alphabetically and displayed underneath its corresponding occupation.

The output should consist of four columns:
Doctor, Professor, Singer, and Actor (in that exact order).

Each name must be listed alphabetically under its occupation.

If an occupation has fewer names than the maximum, fill the remaining cells with NULL.

📂 Input Format

The OCCUPATIONS table is described as follows:

Name        Occupation
----------  ----------
Jenny       Doctor
Samantha    Doctor
Ashley      Professor
Christeen   Professor
Ketty       Professor
Meera       Singer
Priya       Singer
Jane        Actor
Julia       Actor
Maria       Actor

📂 Sample Output
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria

📝 Explanation

The first column is an alphabetically ordered list of Doctor names.

The second column is an alphabetically ordered list of Professor names.

The third column is an alphabetically ordered list of Singer names.

The fourth column is an alphabetically ordered list of Actor names.

Since Professors (3) and Actors (3) have fewer rows than Doctors (2) and Singers (2), the missing cells are filled with NULL.

✅ SQL Solution
SELECT COALESCE(MAX(Doctor), 'NULL')    AS Doctor,
       COALESCE(MAX(Professor), 'NULL') AS Professor,
       COALESCE(MAX(Singer), 'NULL')    AS Singer,
       COALESCE(MAX(Actor), 'NULL')     AS Actor
FROM (
    SELECT 
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn,
        CASE WHEN Occupation = 'Doctor'    THEN Name END AS Doctor,
        CASE WHEN Occupation = 'Professor' THEN Name END AS Professor,
        CASE WHEN Occupation = 'Singer'    THEN Name END AS Singer,
        CASE WHEN Occupation = 'Actor'     THEN Name END AS Actor
    FROM OCCUPATIONS
) t
GROUP BY rn
ORDER BY rn;


✨ This is a pivot problem that tests SQL knowledge of:

ROW_NUMBER() for ordering within groups

Conditional aggregation with CASE WHEN

GROUP BY to align rows across occupations

Handling NULL values
