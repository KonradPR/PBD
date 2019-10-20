USE Library
--zad1
SELECT title,title_no FROM title

SELECT title FROM title WHERE title_no=10

SELECT member_no, fine_assessed FROM loanhist WHERE fine_assessed BETWEEN 8 AND 9

SELECT title_no, author FROM title WHERE author='Charles Dickens' OR author='Jane Austen'

SELECT title_no, title FROM title WHERE title LIKE '%adventures%'

SELECT  member_no, fine_assessed, fine_paid FROM loanhist WHERE fine_assessed>(fine_paid+ISNULL(fine_waived,0))

SELECT DISTINCT  city,state FROM adult

--zad2

SELECT title FROM title ORDER BY title ASC

SELECT  member_no, isbn, fine_assessed, fine_assessed*2 as 'double fine' FROM loanhist WHERE fine_assessed>0

SELECT firstname+' '+middleinitial+' '+lastname as 'email_name' FROM member WHERE lastname='Anderson'

SELECT LOWER(firstname+middleinitial+SUBSTRING(lastname,1,2)) as 'list proponowanych loginów email' FROM member WHERE lastname='Anderson'

SELECT 'The title is: '+title+', title number '+STR(title_no,2) as 'titles'  FROM title

