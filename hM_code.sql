CREATE DATABASE hotel_manager; 
SHOW DATABASES; 
USE hotel_manager;

CREATE TABLE company ( company_name VARCHAR(150) NOT NULL,
				worth INT NOT NULL,
                num_hotels INT NOT NULL,
                PRIMARY KEY (company_name));
      
CREATE TABLE hotel ( branch_id VARCHAR(150) NOT NULL,
				company_name VARCHAR(150) NOT NULL,
				val INT NOT NULL,
                amt_rooms INT NOT NULL,
                location VARCHAR(150) NOT NULL,
                rating INT NOT NULL,
                PRIMARY KEY (branch_id),
                FOREIGN KEY(company_name) REFERENCES company(company_name));
                
CREATE TABLE room ( room_id INT NOT NULL,
				room_type VARCHAR(150) NOT NULL,
				branch_id VARCHAR(150) NOT NULL,
                cost_p_night INT NOT NULL,
                PRIMARY KEY (room_id),
                FOREIGN KEY(branch_id) REFERENCES hotel(branch_id));
                
CREATE TABLE staff ( staff_id INT NOT NULL,
				branch_id VARCHAR(150) NOT NULL,
                staff_phone INT NOT NULL,
                staff_name VARCHAR(150) NOT NULL,
                salary INT NOT NULL,
                PRIMARY KEY (staff_id),
                FOREIGN KEY(branch_id) REFERENCES hotel(branch_id));
                
CREATE TABLE reservation ( booking_id INT NOT NULL,
				room_id INT NOT NULL,
                duraton INT NOT NULL,
                branch_id VARCHAR(150) NOT NULL,
                PRIMARY KEY (booking_id),
                FOREIGN KEY(branch_id) REFERENCES hotel(branch_id));
                
CREATE TABLE guest ( guest_id INT NOT NULL,
				booking_id INT NOT NULL,
                guest_name VARCHAR(150) NOT NULL,
                email VARCHAR(150) NOT NULL,
                guest_phone INT NOT NULL,
                PRIMARY KEY (guest_id), 
                FOREIGN KEY(booking_id) REFERENCES reservation(booking_id));
                
INSERT INTO company VALUES ("Premier Inn",10,20);
INSERT INTO company VALUES ("Merrick",1,75);
INSERT INTO company VALUES ("Shelbourne",1,100);
INSERT INTO company VALUES ("Radisson",45,70);
INSERT INTO company VALUES ("Maldron",12,35);

INSERT INTO hotel VALUES ("PI1","Premier Inn",20000,200, "Swords", 3);
INSERT INTO hotel VALUES ("MER","Merrick",75000,150, "Galway",4);
INSERT INTO hotel VALUES ("SH","Shelbourne",1000000,450, "Dublin",5);
INSERT INTO hotel VALUES ("RA1","Radisson",70000, 500, "Berlin",4);
INSERT INTO hotel VALUES ("MA1","Maldron",20000, 150, "Citywest",3);
INSERT INTO hotel VALUES ("PI2","Premier Inn",22000, 150, "London",3);
INSERT INTO hotel VALUES ("RA2","Radisson",24000, 200, "Munich",3);

INSERT INTO room VALUES (11, "single", "PI1", 22);
INSERT INTO room VALUES (412, "double", "MA1",90);
INSERT INTO room VALUES (112, "double", "RA1", 95);
INSERT INTO room VALUES (304, "double", "SH", 140);
INSERT INTO room VALUES (97, "triple", "MER", 100);

INSERT INTO staff VALUES (1, "PI1", 8351111, "Juan", 20000);
INSERT INTO staff VALUES (2, "MA1", 8352222, "Mary", 22000);
INSERT INTO staff VALUES (3, "SH", 8353333, "David", 35000);
INSERT INTO staff VALUES (4, "RA1", 8354444, "Angus", 60000);
INSERT INTO staff VALUES (5, "MER", 8355555, "Sam", 100000);

INSERT INTO reservation VALUES (11, 97, 2, "PI1");
INSERT INTO reservation VALUES (22, 304, 4, "MA1");
INSERT INTO reservation VALUES (33, 11, 5, "SH");
INSERT INTO reservation VALUES (44, 112, 1, "RA1");
INSERT INTO reservation VALUES (55, 412, 7, "MER");

INSERT INTO guest VALUES (101, 11, "John", "j@gmail.com", 8341111);
INSERT INTO guest VALUES (120, 22, "Pat", "pat@gmail.com", 8342222);
INSERT INTO guest VALUES (130, 33, "Sean", "seany@gmail.com", 8343333);
INSERT INTO guest VALUES (140, 44, "Harry", "h97@gmail.com", 8344444);
INSERT INTO guest VALUES (150, 55, "Declan", "deco@gmail.com", 8345555);

SELECT * FROM company; 
SELECT * FROM hotel;
SELECT * FROM staff; 
SELECT * FROM guest; 
SELECT * FROM reservation; 
SELECT * FROM room; 


DROP DATABASE hotel_manager; 