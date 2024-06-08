CREATE TABLE Data (
    name varchar,
    geom geometry(Point, 4326)
);

INSERT INTO Data (name, geom) VALUES
    ('Ronald tutor cafe', ST_GeomFromText('POINT(-118.2899708811798 34.020116385838904)', 4326)),
    ('EEB Building', ST_GeomFromText('POINT(-118.29005722262738 34.01980801982004)', 4326)),
    ('Science Library', ST_GeomFromText('POINT(-118.28879652663844 34.01963975919474)', 4326)),
    ('School of architecture cayle garner roskhi school of art and design', ST_GeomFromText('POINT(-118.28734263265831 34.01969994150792)', 4326)),
    ('Ronald tutor center cafe', ST_GeomFromText('POINT(-118.28636789188016 34.02026037074008)', 4326)),
    ('water park near bovard, trojan statue, alumni park', ST_GeomFromText('POINT(-118.28526920182287 34.02029495070766)', 4326)),
    ('Sol price school of public policy', ST_GeomFromText('POINT(-118.28338993794371 34.019715301188775)', 4326)),
    ('Edward L Doheny Jr memorial library', ST_GeomFromText('POINT(-118.28404979183208 34.02032468200775)', 4326)),
    ('Premtiss memorial fountain', ST_GeomFromText('POINT(-118.28448231048864 34.02078399465811)', 4326)),
    ('the carolyn craig franklin library garden courtyard and fountain', ST_GeomFromText('POINT(-118.2832742206458 34.02060274320691)', 4326)),
    ('Leavy library', ST_GeomFromText('POINT(-118.28314317633854 34.02174728419189)', 4326)),
    ('Anneberg Cafe', ST_GeomFromText('POINT(-118.28725738199998 34.020928184000006)', 4326)),
    ('Home', ST_GeomFromText('POINT(-118.290598538944 34.02743632531764)', 4326));

-- Assuming a convex hull of all points is needed
SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) AS convex_hull FROM Data;

-- Nearest Neighbors of Home
SELECT name,
    ST_Astext(geom) as location,
    ST_Distance(geom, ST_GeomFromText('POINT(-118.290598538944 34.02743632531764)', 4326)) as distance
FROM Data
WHERE name<>'Home'
ORDER BY ST_Distance(geom, ST_GeomFromText('POINT(-118.290598538944 34.02743632531764)', 4326))
LIMIT 4;
