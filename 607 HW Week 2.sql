#Elina Azrilyan
#Week 2 HW
#8 Sep 2018

#Choose six recent popular movies. Ask at least five people that you know (friends, family, classmates,imaginary friends) 
#to rate each of these movie that they have seen on a scale of 1 to 5. Take the results
#(observations) and store them in a SQL database. Load the information into an R dataframe.
#Your deliverables should include your SQL scripts and your R Markdown code, posted to GitHub.
#This is by design a very open ended assignment. A variety of reasonable approaches are acceptable. You can
#(and should) blank out your SQL password if your solution requires it; otherwise, full credit requires that your
#code is “reproducible,” with the assumption that I have the same database server and R software.
#You may work in a small group.

# 1.Create Movies table
DROP TABLE IF EXISTS Movies;
CREATE TABLE Movies
(
  movieid int PRIMARY KEY,
  movietitle varchar(50) NOT NULL,
  releaseyear int,
  genre varchar(30) NOT NULL,
  rtscore int
);

INSERT INTO Movies ( movieid, movietitle, releaseyear, genre, rtscore)  VALUES ( 1, 'Doctor Strange', 2016,  'Action & Adventure', 89);
INSERT INTO Movies ( movieid, movietitle, releaseyear, genre, rtscore)  VALUES ( 2, 'Thor: Ragnarok', 2017,  'Action & Adventure', 92);
INSERT INTO Movies ( movieid, movietitle, releaseyear, genre, rtscore)  VALUES ( 3, 'Avengers Infinity War', 2018,  'Action & Adventure', 84);
INSERT INTO Movies ( movieid, movietitle, releaseyear, genre, rtscore)  VALUES ( 4, 'The Imitation Game', 2014,  'Drama', 90);
INSERT INTO Movies ( movieid, movietitle, releaseyear, genre, rtscore)  VALUES ( 5, 'TO ALL THE BOYS IVE LOVED BEFORE', 2018,  'Romance', 95);
INSERT INTO Movies ( movieid, movietitle, releaseyear, genre, rtscore)  VALUES ( 6, 'Black Panther', 2018,  'Action & Adventure', 97);

SELECT * FROM Movies;

# 1.Create Ratings table

DROP TABLE IF EXISTS Ratings;
CREATE TABLE Ratings
(
  reviewid int PRIMARY KEY,
  friendname varchar(20) NOT NULL,
  friendrating int,
  movieid int
);

INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 1, 'Anna', 4, 1);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 2, 'Anna', 3, 2);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 3, 'Anna', 3, 3);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 4, 'Anna', 5, 4);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 5, 'Anna', 5, 5);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 6, 'Anna', 3, 6);

INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 7, 'Andrey', 5, 1);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 8, 'Andrey', 5, 2);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 9, 'Andrey', 5, 3);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 10, 'Andrey', 3, 4);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 11, 'Andrey', 2, 5);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 12, 'Andrey', 5, 6);


INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 13, 'Marusya', 4, 1);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 14, 'Marusya', 4, 2);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 15, 'Marusya', 3, 3);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 16, 'Marusya', 5, 4);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 17, 'Marusya', 5, 5);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 18, 'Marusya', 2, 6);


INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 19, 'Lilya', 4, 1);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 20, 'Lilya', 4, 2);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 21, 'Lilya', 3, 3);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 22, 'Lilya', 4, 4);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 23, 'Lilya', 4, 5);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 24, 'Lilya', 2, 6);

INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 25, 'Alla', 5, 1);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 26, 'Alla', 4, 2);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 27, 'Alla', 3, 3);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 28, 'Alla', 4, 4);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 29, 'Alla', 4, 5);
INSERT INTO Ratings ( reviewid, friendname, friendrating, movieid)  VALUES ( 30, 'Alla', 3, 6);

SELECT * FROM Ratings;

#3. Write a JOIN statement that shows information from both tables.

SELECT m.movieid AS ID, m.movietitle AS Title, m.releaseyear AS 'Year', m.genre AS Genre, m.rtscore AS 'Rotten Tomatoes Score', r.friendname, r.friendrating
  FROM Movies m
    INNER JOIN Ratings r ON m.movieid = r.movieid
  ORDER BY m.movieid;