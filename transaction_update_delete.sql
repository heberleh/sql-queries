/* What does the app's SQL look like? */

CREATE TABLE post (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER, -- #todo: foreign key
    content TEXT,
    date TEXT -- ISO8601 strings ("YYYY-MM-DD HH:MM:SS.SSS")
);

INSERT INTO post (user_id, content, date) VALUES (1, "As opposed to...", "2019-05-24 10:51:01.003");
INSERT INTO post (user_id, content, date) VALUES (1, "A post as text and more.", "2019-05-24 10:51:01.003");
INSERT INTO post (user_id, content, date) VALUES (2, "Text is text", "2019-05-24 10:51:01.003");
INSERT INTO post (user_id, content, date) VALUES (3, "Large text huge text", "2019-05-24 10:51:01.003");
INSERT INTO post (user_id, content, date) VALUES (3, "Large text ada ada", "2019-05-24 10:51:01.003");

SELECT * FROM post WHERE user_id = 1;

-- UPDATE transaction
BEGIN TRANSACTION;
UPDATE post SET content = "As opposed to him..."
WHERE (user_id = 1 AND id = 1);
COMMIT;
-- END UPDATE transaction

SELECT * FROM post WHERE user_id = 1;

-- DELETE transaction
BEGIN TRANSACTION;
DELETE FROM post WHERE user_id = 1 and id = 2;
COMMIT;
-- END DELETE transaction

SELECT * FROM post WHERE user_id = 1;
