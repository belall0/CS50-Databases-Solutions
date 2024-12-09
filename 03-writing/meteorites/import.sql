-- to run this script, type in the terminal: sqlite3 meteorites.db < import.sql

-- create a table called "meteorites_temp" to store the data from the CSV file
.import --csv --skip 1 meteorites.csv meteorites_temp

-- replace empty strings with NULL values
UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '';

-- round the values of "mass", "lat", and "long" to 2 decimal places
UPDATE "meteorites_temp"
SET
"mass" = ROUND("mass", 2),
"lat" = ROUND("lat", 2),
"long" = ROUND("long", 2);

-- create a table called "meteorites" to store the cleaned data
CREATE TABLE "meteorites"(
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,

    PRIMARY KEY("id")
);


-- insert the cleaned data into the "meteorites" table
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
WHERE "nametype" != 'Relict'
ORDER BY "year" ASC, "name" ASC;
