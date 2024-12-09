CREATE TABLE "triplets"(
    "sentence_id" INTEGER,
    "char_num" INTEGER,
    "length" INTEGER
);

INSERT INTO "triplets"
VALUES
(14,98,4),
(114,3,5),
(618,72	,9),
(630,7,3),
(932,12,5),
(2230,50,7),
(2346,44,10),
(3041,14,5);

CREATE VIEW "message" AS
SELECT substr("sentence", "char_num","length") AS "phrase"
FROM "triplets"
INNER JOIN "sentences"
ON "triplets".sentence_id = "sentences".id;
