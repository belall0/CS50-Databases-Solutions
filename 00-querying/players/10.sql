-- get last names of players who both bat and throw left-handed. The results are sorted by the players' first names in ascending order. The last names are displayed under the column name "name".
SELECT "last_name" AS "name"
FROM "players"
WHERE "bats" = 'L' AND "throws" = 'L'
ORDER BY "first_name";
