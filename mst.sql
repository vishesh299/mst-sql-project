--  -- Question 1: Library Management System
-- A. Theory:
-- Explain how DDL, DML, and integrity constraints work together in a database application. Explain the difference between ALTER and RENAME, and describe how WHERE is used with DML queries.
-- B. Practical:
-- Create a simple Library Management System using Book and Member tables.
-- 1. Create both tables with suitable attributes.
-- 2. Apply Primary Key, Foreign Key, NOT NULL, UNIQUE, and DEFAULT constraints.
-- 3. Insert at least 5 books and 3 members.
-- 4. Display books belonging to a particular category.
-- 5. Update the availability status of a book.
-- 6. Delete a book based on its ID.
-- 7. Add a new column to the Book table using ALTER.
-- 8. Rename the Book table using RENAME.
-- 9. Display the records after performing the operations.

CREATE DATABASE LIBRARY;
USE LIBRARY;
CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE
);
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    category VARCHAR(30) NOT NULL,
    member_id INT,
    availability VARCHAR(20) DEFAULT 'Available',
    FOREIGN KEY (member_id)
    REFERENCES Member(member_id)
);
INSERT INTO Member (member_id, member_name, email, phone)
VALUES
(1, 'Rahul', 'rahul@gmail.com', '9876543210'),
(2, 'Aman', 'aman@gmail.com', '9876543211'),
(3, 'Priya', 'priya@gmail.com', '9876543');

INSERT INTO Book (book_id, title, category, member_id)
VALUES
(101, 'C Programming', 'Programming',1),
(102, 'Database Systems', 'Database',2),
(103, 'Python Basics', 'Programming',3),
(104, 'Operating Systems', 'Computer Science'),
(105, 'Data Structures', 'Programming');

SELECT * FROM member;
SELECT * FROM Book;

-- updation
UPDATE Book
SET Availability='Not-Available'
WHERE book_id=102;

-- deletion
SET SQL_SAFE_UPDATES=0;
DELETE FROM Book
WHERE category='Database';

-- Alter
ALTER TABLE Book
ADD price DECIMAL(5,2) NOT NULL DEFAULT 500;
RENAME TABLE Book TO Novel;

-- Display based on category
SELECT * FROM Novel
WHERE category='Programming';

-- show all record after performing the query
SELECT * FROM Novel;




  
  
 
 

