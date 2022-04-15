--  Exercise 1 — Tasks

--     Find the title of each film
SELECT title FROM movies;
--     Find the director of each film
SELECT director FROM movies;
--     Find the title and director of each film
SELECT title, director FROM movies;
--     Find the title and year of each film
SELECT title, year FROM movies;
--     Find all the information about each film
SELECT * FROM movies;

--  Exercise 2 — Tasks

--     Find the movie with a row id of 6
SELECT title FROM movies WHERE id = 6;
--     Find the movies released in the years between 2000 and 2010
SELECT title FROM movies WHERE year BETWEEN 2000 AND 2010;
--     Find the movies not released in the years between 2000 and 2010
SELECT title FROM movies WHERE year NOT BETWEEN 2000 AND 2010;
--     Find the first 5 Pixar movies and their release year
SELECT * FROM movies WHERE year LIMIT 5;

--  Exercise 3 — Tasks

--     Find all the Toy Story movies
SELECT * FROM movies WHERE title LIKE 'TOY %';
--     Find all the movies directed by John Lasseter
SELECT * FROM movies WHERE director = 'John Lasseter';
--     Find all the movies (and director) not directed by John Lasseter
SELECT title, director FROM movies WHERE director != 'John Lasseter';
--     Find all the WALL-* movies
SELECT title FROM movies WHERE title LIKE 'WALL-%';

--  Exercise 4 — Tasks

--     List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT director FROM movies
ORDER BY director ASC;
--     List the last four Pixar movies released (ordered from most recent to least)
SELECT title FROM movies
ORDER BY year ASC
LIMIT 4;
--     List the first five Pixar movies sorted alphabetically
SELECT title FROM movies
ORDER BY title ASC
LIMIT 5;
--     List the next five Pixar movies sorted alphabetically
SELECT title FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;

--  Review 1 — Tasks

--     List all the Canadian cities and their populations
SELECT City, Population FROM north_american_cities
WHERE country = 'Canada';
--     Order all the cities in the United States by their latitude from north to south
SELECT City FROM north_american_cities
WHERE country = 'United States'
ORDER BY Latitude DESC;
--     List all the cities west of Chicago, ordered from west to east
SELECT city FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude;
--     List the two largest cities in Mexico (by population)
SELECT city FROM north_american_cities
WHERE country = 'Mexico' 
ORDER BY population DESC
LIMIT 2;
--     List the third and fourth largest cities (by population) in the United States and their population
SELECT city FROM north_american_cities
WHERE country = 'United States' 
ORDER BY population DESC
LIMIT 2 OFFSET 2;

--  Exercise 6 — Tasks

--     Find the domestic and international sales for each movie
SELECT title, domestic_sales, international_sales 
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
--     Show the sales numbers for each movie that did better internationally rather than domestically
SELECT title, domestic_sales, international_sales 
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;
--     List all the movies by their ratings in descending order
SELECT title, domestic_sales, international_sales 
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id
ORDER BY rating DESC;

--  Exercise 7 — Tasks

--     Find the list of all buildings that have employees 
SELECT DISTINCT building from employees;
--     Find the list of all buildings and their capacity
SELECT * from buildings;
--     List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT building_name, role from buildings
LEFT JOIN employees
ON buildings.building_name = employees.building;

--  Exercise 8 — Tasks

--     Find the name and role of all employees who have not been assigned to a building
SELECT name, role FROM employees
WHERE building IS NULL;
--     Find the names of the buildings that hold no employees
SELECT building_name FROM buildings
LEFT JOIN employees
ON buildings.building_name = employees.building
WHERE employees.building IS NULL;

--  Exercise 9 — Tasks

--     List all movies and their combined sales in millions of dollars
SELECT title, (domestic_sales + international_sales)/1000000 AS sales  
FROM movies
INNER JOIN boxoffice
ON movies.id = boxoffice.movie_id;
--     List all movies and their ratings in percent
SELECT title, rating * 10 AS rating_percent  
FROM movies
INNER JOIN boxoffice
ON movies.id = boxoffice.movie_id;
--     List all movies that were released on even number years
SELECT title, year 
FROM movies
LEFT JOIN boxoffice
ON movies.id = boxoffice.movie_id
WHERE year % 2 = 0;

--  Exercise 10 — Tasks

--     Find the longest time that an employee has been at the studio

--     For each role, find the average number of years employed by employees in that role

--     Find the total number of employee years worked in each building
