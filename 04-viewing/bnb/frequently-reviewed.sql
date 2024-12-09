CREATE VIEW "frequently_reviewed" AS

SELECT "listings"."id", "listings"."property_type", "listings"."host_name", COUNT("reviews"."reviewer_name") AS "reviews"
FROM "listings"
INNER JOIN "reviews"
ON "listings"."id" = "reviews"."listing_id"
GROUP BY "listings"."id"
ORDER BY "reviews" DESC, "listings"."property_type"  ASC, "listings"."host_name" ASC;
