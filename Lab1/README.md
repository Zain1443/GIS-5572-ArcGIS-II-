In this folder, you will find a collection of Jupyter notebooks designed to facilitate the completion of Lab 1 tasks. 

1. Software Requirements Specification (SRS) file which discusses the issue of Brown Marmorated Stinkbug and system requiremnets of monitoring and detection of spread on a regular basis across Minnesota.
   
2. A CSV where a set of tasks were completed using 4 different methods.

2a. Arcpy.ipynb:
A Jupyter notebook leveraging ArcGIS Pro functionality to efficiently execute tasks outlined in the provided CSV.

2b. Fiona_Shapely.ipynb:
A Jupyter notebook employing Fiona and Shapely within an online Jupyter environment to address tasks specified in the CSV.

2c. Lab1SQLpart.ipynb:
A Jupyter notebook utilizing SQL through PGAdmin to fulfill tasks outlined in the CSV.

3. Data Pipeline.ipynb:
A comprehensive Jupyter notebook guiding you through the creation of a data pipeline. This pipeline involves:
Generating a polygon using arcpy geometry primitives.
Converting the polygon to WKT format.
Employing psycopg2 or sqlalchemy to import the polygon into your PostGIS database.
Using Flask to enable universal access to retrieve this polygon from PostGIS as a GeoJSON object.
Importing the polygon as a content layer into ArcGIS Online.



