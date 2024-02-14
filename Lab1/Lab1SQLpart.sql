
-- Create a Point Feature Class:
CREATE TABLE feature_class_point (
    id SERIAL PRIMARY KEY,
    geom GEOMETRY(Point, 4326)
);

-- Create a Line Feature Class:
CREATE TABLE feature_class_line (
    id SERIAL PRIMARY KEY,
    geom GEOMETRY(LineString, 4326)
);

-- Create a Polygon Feature Class:
CREATE TABLE feature_class_polygon (
    id SERIAL PRIMARY KEY,
    geom GEOMETRY(Polygon, 4326)
);


-----  Insert 2 Points into the Table   -----
-- Add the new column "Place name" to feature_class_point
ALTER TABLE feature_class_point
ADD COLUMN place_name VARCHAR;

-- Insert data with corresponding place names
INSERT INTO feature_class_point (geom, place_name) VALUES
(ST_GeomFromText('POINT(-93.22456694058349 44.97656707355932)', 4326), 'Huntington Bank Stadium'),
(ST_GeomFromText('POINT(-93.25750208433475 44.97369530667097)', 4326), 'US Bank Stadium');

-- To VIEW the Table
SELECT * 
FROM feature_class_point;

-- Delete rows if required
DELETE FROM feature_class_point
WHERE ctid IN (SELECT ctid FROM feature_class_point ORDER BY ctid LIMIT 4);



---------- Add line between two points to feature_class_line -----------
INSERT INTO feature_class_line (geom)
VALUES
  (ST_MakeLine(
    (SELECT geom FROM feature_class_point WHERE place_name = 'Huntington Bank Stadium'),
    (SELECT geom FROM feature_class_point WHERE place_name = 'US Bank Stadium')
  ));

-- To View
SELECT * 
FROM feature_class_line;


--------- Add polygon to feature_class_polygon -------------
INSERT INTO feature_class_polygon (geom)
VALUES
  (ST_GeomFromText('POLYGON((-93.22456694058349 44.97656707355932, 
				   -93.25750208433475 44.97369530667097, -93.21775917100368 44.884844671870496, 
				   -93.09021376922068 44.95341865709891, -93.22456694058349 44.97656707355932))', 4326));
-- To View
SELECT * 
FROM feature_class_polygon;


--------- SUMMARIZE CONTENTS OF ----------------
-- Point
SELECT Count(*) AS point_count
FROM feature_class_point;

-- Line
SELECT Count(*) AS line_count
FROM feature_class_line;

-- Polygon
SELECT Count(*) AS polygon_count
FROM feature_class_polygon;


------------ EXPORT to SHAPEFILE ------------------
-- Access the database via ArcPro and follow conventional method





--------------------- PART 2: Pipeline Infrastructure -------------------------------------
-- Create a Polygon Feature Class:
CREATE TABLE Zain_Table (
    id SERIAL PRIMARY KEY,
    geom GEOMETRY(MultiPolygon, 4326)
);

SELECT *
FROM Zain_Table;


-- Delete Extra Rows
DELETE FROM Zain_Table
WHERE id IN (
    SELECT id
    FROM Zain_Table
    ORDER BY id
    LIMIT 3
);

