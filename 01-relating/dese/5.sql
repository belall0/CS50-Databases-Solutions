SELECT "city", COUNT("name") AS "num_of_schools"
FROM "Schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "num_of_schools" <= 3
ORDER BY "num_of_schools" DESC, "city" ASC;
