--Create a fake app that stores data and allows user to post updates and delete data.

CREATE TABLE facebook_clone (id INTEGER PRIMARY KEY AUTOINCREMENT, fullname TEXT, age INTEGER, job TEXT,  relationship TEXT, status TEXT);
INSERT INTO facebook_clone(fullname, age, job, relationship, status) VALUES ("John Doe", 16, "Student", "Single", "Weekend can't come quick enough!");
INSERT INTO facebook_clone(fullname, age, job, relationship, status) VALUES ("Dani Longo", 26, "Unemployed", "In a Relationship", "Learning SQL this week!");
INSERT INTO facebook_clone(fullname, age, job, relationship, status) VALUES ("James Cerniglia", 24, "Developer", "In a Relationship", "Got a HUGE raise!!");
INSERT INTO facebook_clone(fullname, age, job, relationship, status) VALUES ("Anthony Longo", 28, "Teacher", "Single", "My students are amazing, teaching is so rewarding.");
INSERT INTO facebook_clone(fullname, age, job, relationship, status) VALUES ("Debbie Longo", 60, "Lunch Aid", "It's complicated", "I just hit a high score on the leaderboard In Codys peloton class!");
INSERT INTO facebook_clone(fullname, age, job, relationship, status) VALUES ("Lillian Smith", 25, "Dietary assistent", "Single", "My son just started his first day at Chess Camp! He loves it!");
INSERT INTO facebook_clone(fullname, age, job, relationship, status) VALUES ("Jen Schneidmuller", 26, "Art Teacher", "Engaged", "My Wedding is finally happening this year!");
INSERT INTO facebook_clone(fullname, age, job, relationship, status) VALUES ("Hinda Kass", 70, "Medical Transcriptionist", "Single", "Feeling nervous! My Cholesterol is high, send prayers my way!");
INSERT INTO facebook_clone(fullname, age, job, relationship, status) VALUES ("Kim Jones", 50, "Secretary", "Married", "What should I have for dinner tonight? Send suggestions my way.");
INSERT INTO facebook_clone(fullname, age, job, relationship, status) VALUES ("Annie Iccari", 56, "Babysitter", "Married", "Now that it's warm it's time to start sprucing up the garden again.  Here we go!");


--Make a table to store the data.
--Add a few example rows in the table.
--Display all initial data.
--Emulate what happens when you edit and delete data in the app.
--Display all data again after changes.

SELECT * FROM facebook_clone;

UPDATE facebook_clone SET age = 25, status = "IT'S MY BIRTHDAY!" 
WHERE id= 3;

UPDATE facebook_clone SET relationship = "Married" 
WHERE id = 7;

UPDATE facebook_clone SET status = "IM FINALLY MARRIED! TOOK LONG ENOUGH! HAHA" 
WHERE id = 7;

UPDATE facebook_clone SET job = "Data Analyst" 
WHERE id = 2;

UPDATE facebook_clone SET status = "My hard work paid off! I got a job that I fully taught to do on my own! So proud of me lol" 
WHERE id = 2;

UPDATE facebook_clone SET status = "I'm done with social media.. Goodbye facebook clone!" 
WHERE id = 4;

DELETE FROM facebook_clone WHERE id =  4;

UPDATE facebook_clone SET status = "I hear there are a lot of hackers on this app! I don't want to risk them getting my information so I'm deleting my account! You can never be too safe!" 
WHERE id = 10;

DELETE FROM facebook_clone WHERE id =  10;

SELECT * FROM facebook_clone;
