📌 Question

Write a SQL query to identify the type of each record in the TRIANGLES table using its three side lengths (A, B, and C).
The query should output one of the following statements for each row:

Equilateral: It's a triangle with sides of equal length.

Isosceles: It's a triangle with two sides of equal length.

Scalene: It's a triangle with sides of differing lengths.

Not A Triangle: The given values of A, B, and C do not form a valid triangle.

A triangle is valid if the sum of any two sides is greater than the third side.

📌 Answer
SELECT CASE
    -- Not a valid triangle (triangle inequality rule fails)
    WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
    
    -- All three sides equal
    WHEN A = B AND B = C THEN 'Equilateral'
    
    -- Any two sides equal
    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
    
    -- All sides different
    ELSE 'Scalene'
END AS TriangleType
FROM TRIANGLES;

📌 Example

Input (TRIANGLES table):

A	B	C
20	20	23
10	10	10
3	4	5
1	1	3

Output:

Isosceles
Equilateral
Scalene
Not A Triangle


Would you like me to also explain step by step how each
