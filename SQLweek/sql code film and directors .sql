/**/
CREATE DATABASE bari_allali_db;
USE bari_allali_db

drop table film_table;

Create table film_table
(
    film_name VARCHAR(100),
    film_id INT Primary Key IDENTITY,
    dirtor_id FOREIGN
    film_type VARCHAR(100),
    date_of_release DATETIME, 
    director CHAR(100), 
    writer CHAR(100), 
    Star DECIMAL(2,1),
    film_language CHAR(100),
    offical_website VARCHAR(100),
    plot_summary VARCHAR(100)
);

-- Alter TABLE film_table ADD release_date DATETIME;--

INSERT INTO film_table
(
    film_name, film_type, date_of_release, director, writer, Star, film_language, offical_website, plot_summary, release_date
)
VALUES
(
    'SQL', 'Drama', '2020-06-23 12:12:12:456', 'Humza Malak', 'Tony the Tiger', 4.5, 'french', 'www.sql.com', 'A DevOps group take the periolus treck opf learning how to dfdo SQL, making friendships along the way', '2020-06-23'
);

INSERT INTO film_table
(
    film_name, film_type, date_of_release, director, writer, Star, film_language, offical_website, plot_summary, release_date
)
VALUES
(
    'Hold deez Lz', 'Action', '2020-06-23 07:07:12:456', 'Malak', 'Tony', 4.5, 'french', 'www.L.com', 'Hate Incarnate', '2020-06-24'
);



--SP_HELP film_table;

Select * From film_table;

/*Alter Table film_table 
ADD film_id INT IDENTITY PRIMARY KEY;*/

Drop table  director;

Create table director(
    director_id INT PRIMARY KEY IDENTITY,
    director_name VARCHAR(50),
    city VARCHAR(20) DEFAULT 'London',
    film_id INT,
    FOREIGN KEY(film_id) 
        REFERENCES film_table (film_id) 
        ON DELETE CASCADE
);



Select * From director;

INSERT Into director
(
    director_name, film_id
)
VALUES
(
    'Hans Zimmer', 3
);

INSERT Into director
(
    director_name, film_id
)
VALUES
(
    'c', 1
);

INSERT Into director
(
    director_name, film_id
)
VALUES
(
    'dddd', 2
);


UPDATE director SET director_name ='humza' WHERE film_id=1;

ALTER TABLE director
ADD CONSTRAINT film_id;
FOREIGN KEY (film_id) 
REFERENCES film_table (film_id) ON DELETE CASCADE;

DELETE FROM director WHERE film_id = 1

DELETE FROM film_table WHERE film_id = 1