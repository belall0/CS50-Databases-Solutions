SELECT "schools"."name"
FROM "districts"
INNER JOIN "schools" ON "schools"."district_id" = "districts"."id"
WHERE "districts"."name" = 'Cambridge';
