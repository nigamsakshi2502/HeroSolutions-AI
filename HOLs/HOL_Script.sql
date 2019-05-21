CREATE TABLE usertable(id int NOT NULL IDENTITY PRIMARY KEY, name varchar(100), Phone varchar(15), gender varchar(12), email varchar(100), faceid varchar(100));

CREATE TABLE imagevalidation(id int NOT NULL IDENTITY PRIMARY KEY, validation_type varchar(100), validation_message varchar(255),isactive int);

CREATE TABLE gesture(id int NOT NULL IDENTITY PRIMARY KEY, gesture_name varchar(100), thumbnail_url varchar(max), gesture_message varchar(255), isactive int);

CREATE TABLE auditlog(id int NOT NULL IDENTITY PRIMARY KEY, layer varchar(100), result_type varchar(50), device_type varchar(50), userimage text);

CREATE TABLE verifytime(id int NOT NULL IDENTITY PRIMARY KEY, personid varchar(100), date varchar(25), checkin varchar(25), checkout varchar(25));