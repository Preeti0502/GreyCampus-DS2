--CREATING TABLE STUDENTS
CREATE TABLE students (student_id INT, first_name VARCHAR(50), 
					   last_name VARCHAR(50),homeroom_number INT, phone VARCHAR(15) NOT NULL UNIQUE,
					   email VARCHAR(200) NOT NULL, graduation_year INT);

--APPLYING NOT NULL CONSTRAINT ON LAST_NAME COLUMN
ALTER TABLE students ALTER COLUMN last_name SET NOT NULL;

--ADDING FIRST ROW IN THE TABLE
INSERT INTO students
VALUES(1,'Mark','Watney',5,'777-555-1234',' ',2035);

--ADDING SECOND ROW IN THE TABLE
INSERT INTO students
VALUES(2,'Ansh','Shaw',8,'6789-097-5343',' ',2034);

--ADDING MULTIPLE ROWS IN THE TABLE
INSERT INTO students(student_id, first_name, last_name ,homeroom_number, phone,
					   email, graduation_year)
VALUES(9,'AnsIh','hawP',10,'6189-097-5343', 'ans@skul.com ',2033),
      (3,'riky','GIM',20,'2346-698-3469', 'rivh@skul.com ',2030),
	  (6,'SUMAN','VISHNU',34,'7890-564-2318', 'sumanvi@stud.com ',2029),
	  (5,'SAM','downy',31,'8789-213-6754','samd@skul.com',2032),
	  (4,'ishu','jamnu',26,'7234-098-4568', 'ishu9@gil.com ',2027),
	  (7,'ROBERT','jUniOR',12,'1234-689-7896', 'dgbh@gil.com',2026),
	  (8,'TIM','HanK',27,'9876-546-1234', 'afdcf@stud.com ',2029);

--DISPLAY THE COMPLETE TABLE
SELECT * FROM students;

--ADDING COLUMN 'ADMISSION YEAR' USING OPERATION ON COLUMN 'GRADUATION YEAR'
ALTER TABLE students
ADD COLUMN admission_year INT
GENERATED ALWAYS AS (graduation_year-4) STORED;

--TO DISPLY FULL NAME OF STUDENTS IN SENTENCE CASE FORMAT.
SELECT INITCAP(CONCAT(first_name, ' ', last_name)) AS name
FROM students;

--FILL MISSING EMAIL ID OF STUDENTS
UPDATE students
SET email=first_name||'@stud.com'
WHERE EMAIL=' ';

--THE HOMEROOM NUMBER OF STUDENT 'SUMAN' WAS 24 NOT 34, REPLACE IT
UPDATE students
SET homeroom_number=24
WHERE first_name ILIKE '%Suman%';

--FIND NUMBER OF STUDENTS TAKING ADMISSION YEAR WISE
SELECT admission_year, COUNT(*) AS no_of_add FROM students
GROUP BY admission_year;

--DISPLY THE LIST BY STUDENT_ID
SELECT * FROM students
ORDER BY student_id;






						   


