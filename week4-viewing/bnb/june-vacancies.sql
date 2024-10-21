CREATE VIEW "june_vacancies" AS
SELECT "listings"."id", "listings"."property_type", "listings"."host_name", COUNT("availabilities"."available") AS "days_vacant"
FROM "listings"
INNER JOIN "availabilities"
ON "listings"."id" = "availabilities"."listing_id"
WHERE "available" = 'TRUE'  AND strftime('%m', "date") = "06"
GROUP BY "listings"."id";
