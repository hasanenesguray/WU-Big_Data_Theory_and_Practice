-- SQL script to create and populate the Library System Database

-- Drop tables if they already exist
DROP TABLE IF EXISTS Borrowers;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;

-- Create Books Table
CREATE TABLE Books (
  book_id INT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(100),
  genre VARCHAR(50),
  publish_year INT
);

-- Create Borrowers Table
CREATE TABLE Borrowers (
  borrower_id INT,
  book_id INT,
  borrow_date DATE,
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Create Authors Table
CREATE TABLE Authors (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(100),
  birth_year INT,
  nationality VARCHAR(50)
);

-- Insert data into Books Table
INSERT INTO Books VALUES (1, 'The Ocean''s Mystery', 'A.J. Green', 'Fiction', 2015);
INSERT INTO Books VALUES (2, 'History of Earth', 'B.K. White', 'Non-Fiction', 2019);
INSERT INTO Books VALUES (3, 'Stars Above', 'L.M. Blue', 'Fiction', 2018);
INSERT INTO Books VALUES (4, 'Programming for Beginners', 'Z.A. Azure', 'Tech', 2022);
INSERT INTO Books VALUES (5, 'The Mayor''s Life', 'A.J. Green', 'Biography', 2016);
INSERT INTO Books VALUES (6, 'Deep Dive into Python', 'Z.A. Azure', 'Tech', 2021);
INSERT INTO Books VALUES (7, 'Desert Tales', 'L.M. Blue', 'Fiction', 2020);
INSERT INTO Books VALUES (8, 'Nature''s Wonders', 'P.R. Red', 'Non-Fiction', 2019);
INSERT INTO Books VALUES (9, 'Secrets of the Universe', 'T.U. Teal', 'Science', 2017);
INSERT INTO Books VALUES (10, 'Mathematical Puzzles', 'T.U. Teal', 'Science', 2022);

-- Insert data into Borrowers Table
INSERT INTO Borrowers VALUES (501, 1, '2023-07-11');
INSERT INTO Borrowers VALUES (502, 2, '2023-07-25');
INSERT INTO Borrowers VALUES (503, 8, '2023-08-02');
INSERT INTO Borrowers VALUES (504, 4, '2023-09-25');
-- For borrower_id 505, assuming the borrow_date is NULL since it's not provided
INSERT INTO Borrowers VALUES (505, 5, NULL);
INSERT INTO Borrowers VALUES (506, 1, '2023-08-15');
INSERT INTO Borrowers VALUES (506, 6, '2023-08-20');
INSERT INTO Borrowers VALUES (507, 7, '2023-08-25');
INSERT INTO Borrowers VALUES (508, 8, '2023-09-01');
INSERT INTO Borrowers VALUES (509, 9, '2023-09-10');

-- Insert data into Authors Table
INSERT INTO Authors VALUES (101, 'A.J. Green', 1980, 'UK');
INSERT INTO Authors VALUES (102, 'B.K. White', 1975, 'USA');
INSERT INTO Authors VALUES (103, 'L.M. Blue', 1990, 'Canada');
INSERT INTO Authors VALUES (104, 'Z.A. Azure', 1985, 'Australia');
INSERT INTO Authors VALUES (105, 'P.R. Red', 1982, 'UK');
INSERT INTO Authors VALUES (106, 'T.U. Teal', 1978, 'USA');

-- Optional: Create indexes for better query performance (depending on the DBMS and its usage)

-- Index on books by author
CREATE INDEX idx_books_author ON Books(author);

-- Index on borrowers by book_id
CREATE INDEX idx_borrowers_book_id ON Borrowers(book_id);

-- Index on authors by name
CREATE INDEX idx_authors_name ON Authors(author_name);

-- Make sure to commit the changes if the DBMS does not do it automatically
COMMIT;