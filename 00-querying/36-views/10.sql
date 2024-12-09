-- Which prints by Hokusai have a brightness greater than 50, sorted by brightness in descending order,
SELECT "english_title", "brightness"
FROM "views"
WHERE "artist" = 'Hokusai' AND "brightness" > 0.5
ORDER BY "brightness";
