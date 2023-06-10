SELECT *
FROM Artist ar

SELECT *
FROM Album al

--Part 1: Row Number, Rank and Dense Rank

--1. Create a joined table from the Artist and Album tables and order it by Name and Title

SELECT *
FROM Artist ar
JOIN Album al
ON ar.ArtistId = al.ArtistId 
ORDER BY ar.name, al.title


--2. Using the table created above make a table that contains Name, Title and
--a distinct TableID number for every record in the table

SELECT ar.Name, al.Title, 
ROW_NUMBER () OVER() AS TableId
FROM Artist ar
JOIN Album al
ON ar.ArtistId = al.ArtistId 

--OR 

WITH cte AS
(SELECT ar.Name, al.Title
FROM Artist ar
JOIN Album al
ON ar.ArtistId = al.ArtistId
ORDER BY name, title)
SELECT ROW_NUMBER() OVER() AS TableID, Name, Title
FROM cte


--3. Add a column called album rank that ranks each album, windowed by Name 
--creating an album rank for each band

SELECT ar.Name, al.Title, 
ROW_NUMBER () OVER() AS TableId,
RANK() OVER(PARTITION BY ar.Name ORDER BY al.Title) AS AlbumRank
FROM Artist ar
JOIN Album al
ON ar.ArtistId = al.ArtistId 
ORDER BY ar.Name, al.Title

--or

WITH cte AS
(SELECT ar.Name, al.Title
FROM Artist ar
JOIN Album al
ON ar.ArtistId = al.ArtistId
ORDER BY name, title)
SELECT ROW_NUMBER() OVER() AS TableID, Name, al.Title,
RANK() OVER(PARTITION BY ar.Name ORDER BY al.Title) AS AlbumRank
FROM cte



-----Part 2: Lag

--1. Create a table that contains the TrackID, Name, AlbumId and Milliseconds
--from AlbumId = 13 ordered by TrackID



WITH cte AS
(SELECT TrackID, AlbumID, Milliseconds,
LAG(Milliseconds) OVER(ORDER BY AlbumID) as lagged_time
FROM Artist ar
JOIN Album al
ON ar.ArtistId = al.ArtistId
ORDER BY AlbumID)
SELECT *, Milliseconds - lagged_time as comparison_to_previous_song_time
FROM cte
WHERE AlbumID = 13 



--2. Create a column of Milliseconds lagged by 1 row




--3. Create a table that subtracts Milliseconds from LagMilliseconds 
--from the table above to compare the length of consecutive songs on the album














