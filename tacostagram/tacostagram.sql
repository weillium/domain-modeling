-- Drops existing tables, so we start fresh with each
-- run of this script
-- e.g. DROP TABLE IF EXISTS ______;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS like_state;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS follows;
DROP TABLE IF EXISTS feed;


-- CREATE TABLES
CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    screen_name TEXT,
    first_name TEXT, 
    last_name TEXT,
    location TEXT
);

CREATE TABLE post (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    photo IMAGE,
    post_time DATETIME,
    like_count INTEGER,
    user_id INTEGER
);

CREATE TABLE like_state {
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    post_id INTEGER
};

CREATE TABLE comments {
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER,
    user_id INTEGER,
    comment TEXT
};

CREATE TABLE follows {
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    follow_id INTEGER
};

CREATE TABLE feed {
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER,
};