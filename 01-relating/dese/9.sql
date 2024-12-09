SELECT "districts"."name"
FROM "districts"
INNER JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
ORDER BY "expenditures"."pupils"
LIMIT 1;
