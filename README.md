-- DROP DATABASE name_of_database -- 
	
CREATE DATABASE bari_allali_db
	
USE bari_allali_db
DROP TABLE film_table

CREATE TABLE film_table 

(
    film_id INT IDENTITY(1, 1) PRIMARY KEY,
    film_name VARCHAR(20),
    film_type VARCHAR(20),
    date_of_release DATE, 
    director VARCHAR(40),
    writer VARCHAR(100),
    star VARCHAR(100),
    film_language CHAR(2),
    official_website VARCHAR(100),
    plot_summary VARCHAR(1000)
)

SP_HELP film_table

DROP TABLE film_table

ALTER TABLE film_table
ADD release_date DATETIME;


-- INSERT INTO -- INSERT DATA INTO YOUR TABLE
INSERT INTO film_table (film_name, film_type, date_of_release, director, writer, star, film_language, official_website, plot_summary)
VALUES 
('The Joker',
'Thriller', 
'2019-10-04',  
'Todd Philips', 
'Scott Silver',' Joaquin Phoenix', 
'en', 
'www.joker.movie', 
'Forever alone in a crowd, 
failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like hes part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.');


-- SELECT EVERYTHING AND DISPLAY
SELECT * FROM film_table

-- UPDATE A COLUMN FROM PARTICULAR TABLE WHERE A CONDITION IS MET
UPDATE film_table
SET plot_summary = 'Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like hes part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.'
WHERE film_name = 'The Joker'

-- ALTER A TABLE BY DROPPING A COLUMN 
ALTER TABLE film_table
DROP COLUMN release_date;


SELECT film_name, writer FROM film_table 

CREATE TABLE director
(
    director_id INT IDENTITY(1, 5),
    director_name VARCHAR(50),
    city VARCHAR(20) DEFAULT 'LONDON',
    film_id INT, 
    PRIMARY KEY(director_id),
    FOREIGN KEY(film_id) REFERENCES film_table(film_id)
)

SELECT * FROM director 

-- INSERT INTO -- DIRECTOR
INSERT INTO director (director_name, city, film_id)
VALUES 
('Scott Silver', 'New York', 1),
('Todd Philips', 'Chicago', 1), 
('bari allali', 'London', 1), 
('Ozzy Osborne', 'California', 1)

INSERT INTO director (director_name, film_id)
VALUES ('La haine', 1)
