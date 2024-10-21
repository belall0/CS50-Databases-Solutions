UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- DELETE FROM "user_logs"
-- WHERE "new_password" ='982c0381c279d139fd221fce974916e7';

-- INSERT INTO "user_logs" ("type","old_username","new_username","old_password","new_password")
-- VALUES ("update", "admin","admin", "cb4772eeda0ae562119b6c4be2e0889a","44bf025d27eea66336e5c1133c3827f7")

UPDATE "user_logs"
SET "new_password" = (
    SELECT "new_password"
    FROM "user_logs"
    WHERE "new_username" = 'emily33'
)
WHERE "old_username" = 'admin';
