SELECT "name", "per_pupil_expenditure", "graduated"
FROM "schools"
INNER JOIN "expenditures" ON "expenditures"."district_id" = "schools"."district_id"
INNER JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id"
ORDER BY "expenditures"."per_pupil_expenditure" DESC, "schools"."name" ASC
