DELIMITER $$
CREATE OR REPLACE PROCEDURE set_up_rfamilypix 
BEGIN
CREATE TABLE albums(
a_id int PRIMARY KEY AUTO_INCREMENT, 
a_title varchar(200) NOT NULL,
a_desc varchar(1000) NOT NULL);

CREATE TABLE users(
a_id int PRIMARY KEY AUTO_INCREMENT, 
u_name varchar(200) NOT NULL UNIQUE,
u_password varchar(200) NOT NULL,
u_firstname varchar(200) NOT NULL,
u_email varchar(200) NOT NULL,
u_lastname varchar(200),
CONSTRAINT fk_USERS_ALBUMS FOREIGN KEY users(a_id) REFERENCES albums(a_id));

CREATE TABLE pictures(
p_id int PRIMARY KEY AUTO_INCREMENT,
a_id int NOT NULL,
p_desc varchar(250) NOT NULL,
p_path varchar(200) NOT NULL,
CONSTRAINT fk_PICTURE_ALBUM FOREIGN KEY pictures(a_id) REFERENCES albums(a_id));
END;
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE tear_down_rfamilypix
BEGIN
DROP TABLE users;
DROP TABLE pictures;
DROP TABLE albums;
END;
DELIMITER ;