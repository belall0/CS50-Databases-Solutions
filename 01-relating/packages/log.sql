-- *** The Lost Letter ***

/*
Find Anneke's address ID, then use it to get the package ID,
find the last drop address ID for that package,
and finally retrieve the address details.
*/
SELECT *
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id"
            FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        ) AND "contents" = 'Congratulatory letter'
    ) AND "action" = 'Drop'
);
-- *** The Devious Delivery ***

/*
find the package ID where from_address_id IS NULL,
then use it to get the drop address
*/
SELECT *
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "package_id" = (

        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" IS NULL

    ) AND action = 'Drop'
);
-- *** The Forgotten Gift ***

/*
find from_address_id to get the package ID
using the package ID, find the last pick aciton and get the driver name using his ID
*/
SELECT *
FROM "drivers"
WHERE "id" = (
    SELECT "driver_id"
    FROM "scans"
    WHERE "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id"
            FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        )
    ) AND "action" = 'Pick'
    ORDER BY "timestamp" DESC
    LIMIT 1
);
