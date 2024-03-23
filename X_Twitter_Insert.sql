USE X_Twitter;

#Exercise 1

#Users Seeding 
INSERT INTO Users (username, password, full_name, email, phone_number, birth_date)
	VALUES 
("Stiliyan26", "radndomPass123", "Stiliyan Nikolov", "stiliyan.nikolov02@gmail.com", "0884963923", "2002-12-04"),
("PowerCell", "powerCellPass123", "Peter Gerdjikov", "peter.gerdjikov@gmail.com", "0885966973", "2003-06-30"),
("Kiro12", "kiroPass123", "Kiril Romanski", "kiro.romanski@gmail.com", "0886973829", "2003-03-15"),
("Filip", "tiger123", "Fiilp Andonov", "filip.tiger@gmail.com", "0885973814", "2003-06-12"),
("Vladi", "vladiBate123", "Vladislav Atanasov", "vladi.bate@gmail.com", NULL, "2003-06-10");

#Chats Seeding 
INSERT INTO Chats (name, created_at)
	VALUES 
("Компютърни системи", "2024-03-16"),
("Stiliyan-Vladi", "2024-03-12");

#Chats Users Seeding
INSERT INTO Chats_Users (chat_id, user_id)
	VALUES 
(1, 1),
(1, 2),
(1, 5),
(2, 1),
(2, 5);

INSERT INTO Messages (content, sent_date, chat_id, issuer_id)
	VALUES
("Hello Vladi, how are you today?", "2024-03-12 15:45:00", 1, 1),
("Hello Stiliyan, are we going to Computre Systems lecture?", "2024-03-13 14:30:00", 1, 2),
("Hello Peter, are you going to come?", "2024-03-13 14:35:00", 1, 5),
("Hello Vladi, yes let's go?", "2024-04-13 15:25:00", 2, 1),
("Hello Stiliyan, are we going to the gym today?", "2024-04-13 13:35:00", 2, 5);

INSERT INTO MediaTypes (file_type, file_format, file_path)
	VALUES
("image", "JPG", '/path/to/your/file.jpg'),
("image", "PNG", '/path/to/your/gym.png'),
("image", "JPEG", '/path/to/your/space.jpeg');

INSERT INTO Messages_MediaTypes (message_id, media_type_id)
	VALUES
(1, 1);

INSERT INTO Friends_Lists (user_id, friend_id)
	VALUES 
(1, 5),
(1, 2);

INSERT INTO Blocks_Lists (blocker_id, blocked_id)
	VALUES
(1, 4),
(2, 5),
(1, 3);

INSERT INTO Profile_views (viewed_id, viewer_id)
	VALUES
(2, 1),
(2, 3),
(2, 4),
(1, 5),
(1, 2),
(1, 3);

INSERT INTO Channels (name, owner_id)
	VALUES
("Star wars", 2),
("Boxing", 1);

INSERT INTO Subscribers_Chanels (channel_id, user_id)
	VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 2),
(2, 3),
(2, 5);

INSERT INTO Posts (title, upload_date, channel_id)
	VALUES
("Star wars 10 is out now!", "2023-03-12", 1),
("Star wars 10 movie was awsome!", "2023-03-13", 1),
("Creed 2 was very good!", "2023-04-12", 2);

INSERT INTO Comments (content, upload_date, user_id, post_id) 
	VALUES
("Yes i've watched it too, it was awsome!!!", "2023-03-14", 2, 2),
("I will go and watch it !!!", "2023-03-14", 3, 1),
("Boxing is my favorite sport i will go watch it", "2023-03-14", 1, 3);

INSERT INTO Likes (user_id, post_id) 
	VALUES
(3, 2),
(2, 2),
(4, 2),
(4, 3),
(2, 3),
(5, 2);







    





















