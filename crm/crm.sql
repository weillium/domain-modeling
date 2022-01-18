-- Drops existing tables, so we start fresh with each
-- run of this script
-- e.g. DROP TABLE IF EXISTS ______;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS activity_log;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS industry_map;
DROP TABLE IF EXISTS industry;
DROP TABLE IF EXISTS account_manager;

-- CREATE TABLES
CREATE TABLE contacts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    title TEXT,
    email TEXT,
    phone TEXT,
    account_id INTEGER
);

CREATE TABLE activity_log (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    time DATETIME,
    note TEXT,
    contact_id INTEGER,
    manager_id INTEGER
);

CREATE TABLE accounts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
);

CREATE TABLE industry_map {
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    account_id INTEGER,
    industry_id INTEGER
};

CREATE TABLE industries (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

CREATE TABLE account_manager (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    email TEXT
);

/*
SELECT 
    accounts.account, 
    industry.name, 
    CONCAT(
        contacts.first_name, 
        " ", 
        contacts.last_name), 
    contacts.email, 
    contacts.phone,
    CONCAT(
        activity_log.type, 
        " between ", 
        contacts.first_name, 
        " ", 
        contacts.last_name, 
        " and ", 
        account_manager.first_name, 
        " ", account_manager.last_name, 
        " on ", 
        activity_log.time, 
        ":"),
    activity_log.note,

FROM contacts 
    INNER JOIN accounts ON contacts.account_id = accounts.id
    INNER JOIN activity_log ON activity_log.contact_id = contacts.id
    INNER JOIN account_manager ON activity_log.manager_id = account_manager.id
GROUP BY accounts.account;