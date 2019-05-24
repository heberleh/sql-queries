/* Create table about the people and what they do here */
CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE partners(
    author1 INTEGER,
    author2 INTEGER,
    FOREIGN KEY(author1) REFERENCES author(id),
    FOREIGN KEY(author2) REFERENCES author(id)
);

CREATE TABLE book (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    author INTEGER,
    FOREIGN KEY(author) REFERENCES author(id)
);

INSERT INTO author (name) VALUES ("Jhon");
INSERT INTO author (name) VALUES ("Maria");
INSERT INTO author (name) VALUES ("Josh");
INSERT INTO author (name) VALUES ("Pedro");
INSERT INTO author (name) VALUES ("Jue");
INSERT INTO author (name) VALUES ("Rose");
INSERT INTO author (name) VALUES ("Rick");
INSERT INTO author (name) VALUES ("Steve");

INSERT INTO partners (author1, author2) VALUES (1, 2);
INSERT INTO partners (author1, author2) VALUES (4, 5);

INSERT INTO book (name, author) VALUES ("Hello Hello", 1);
INSERT INTO book (name, author) VALUES ("Time", 2);
INSERT INTO book (name, author) VALUES ("Chill", 1);
INSERT INTO book (name, author) VALUES ("A lot to tell", 1);
INSERT INTO book (name, author) VALUES ("Something happened", 2);
INSERT INTO book (name, author) VALUES ("Time happens", 2);
INSERT INTO book (name, author) VALUES ("Tell me more", 3);
INSERT INTO book (name, author) VALUES ("A story tale", 4);
INSERT INTO book (name, author) VALUES ("The story", 5);
INSERT INTO book (name, author) VALUES ("Assassin", 5);
INSERT INTO book (name, author) VALUES ("Dragon", 6);
INSERT INTO book (name, author) VALUES ("Dragon is not a dragon", 7);


-- Who partners who?
SELECT author1.name, author2.name
FROM partners
    JOIN author AS author1 ON author1.ID = partners.author1
    JOIN author AS author2 ON author2.ID = partners.author2;

-- Show me the books from married authors
SELECT book.name, author.name
FROM book
    JOIN partners ON (book.author = partners.author1 OR 
                      book.author = partners.author2)
    JOIN author ON book.author = author.id;

-- Count the number of books per author
SELECT author.name, COUNT(*) AS N_Books
FROM author JOIN book ON author.id = book.author
GROUP BY author.id;




