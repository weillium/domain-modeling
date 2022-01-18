-- Drops existing tables, so we start fresh with each
-- run of this script
-- e.g. DROP TABLE IF EXISTS ______;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS follows;

-- CREATE TABLES
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_name TEXT,
    first_name TEXT, 
    last_name TEXT,
    location TEXT
);

CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    image_file TEXT,
    post_time DATETIME,
    user_id INTEGER
);

CREATE TABLE likes {
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    post_id INTEGER
};

CREATE TABLE comments {
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER,
    user_id INTEGER,
    body TEXT
};

CREATE TABLE follows {
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    follower_user_id INTEGER,
    followed_user_id INTEGER
};