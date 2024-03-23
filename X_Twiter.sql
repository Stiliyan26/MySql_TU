DROP DATABASE IF EXISTS X_Twitter;

CREATE DATABASE X_Twitter;
USE X_Twitter;

CREATE TABLE Users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(25),
    birth_date DATE NOT NULL,
    image_path VARCHAR(255),
    profile_picture LONGBLOB
);

CREATE TABLE Channels (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    owner_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (owner_id) REFERENCES Users(id)
);

CREATE TABLE Subscribers_Chanels (
	subscriber_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (subscriber_id) REFERENCES Users(id),
    channel_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (channel_id) REFERENCES Channels(id),
    PRIMARY KEY(subscriber_id, channel_id)
);

CREATE TABLE Posts (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    upload_date DATETIME NOT NULL,
    chanel_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (chanel_id) REFERENCES Channels(id)
);

CREATE TABLE Users_Interact_Posts(
	user_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id),
    post_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (post_id) REFERENCES Posts(id),
    PRIMARY KEY(user_id, post_id),
    has_liked BOOLEAN
);

CREATE TABLE Comments (
	id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    date DATETIME NOT NULL,
    owner_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (owner_id) REFERENCES Users(id),
    post_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (post_id) REFERENCES Posts(id)
);

CREATE TABLE Media_types (
	id INT AUTO_INCREMENT PRIMARY KEY,
    file_path VARCHAR(100) NOT NULL,
    media_type VARCHAR(50) NOT NULL,
    description VARCHAR(100)
);

CREATE TABLE Posts_Media_types(
	post_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (post_id) REFERENCES Posts(id),
    media_type_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (media_type_id) REFERENCES Media_types(id),
    PRIMARY KEY(post_id, media_type_id)
);

CREATE TABLE Chats (
	id INT AUTO_INCREMENT PRIMARY KEY,
    type_of_chat ENUM("one-on-one", "group") NOT NULL
);

CREATE TABLE Chats_Media_types(
	chat_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (chat_id) REFERENCES Chats(id),
    media_type_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (media_type_id) REFERENCES Media_types(id),
    PRIMARY KEY(chat_id, media_type_id)
);

CREATE TABLE Chats_Users (
	user_Id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (chat_id) REFERENCES Chats(id),
    media_type_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (media_type_id) REFERENCES Users(id),
    PRIMARY KEY(chat_id, user_id)
);

CREATE TABLE Block_lists (
	user_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id),
    blocked_user_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (blocked_user_id) REFERENCES Users(id)
);

