SELECT "city", COUNT("name") AS "num_of_schools"
FROM "Schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "num_of_schools" DESC, "city" ASC
LIMIT 10;
