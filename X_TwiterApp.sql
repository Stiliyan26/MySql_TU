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

CREATE TABLE Chats (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    created_at DATE NOT NULL
);

CREATE TABLE Chats_Users (
	chat_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (chat_id) REFERENCES Chats(id),
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id),
    PRIMARY KEY(chat_id, user_id)
); 

CREATE TABLE Messages (
	id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255),
    sent_date DATETIME NOT NULL,
    chat_id INT NOT NULL,
    issuer_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (chat_id) REFERENCES Chats(id),
    CONSTRAINT FOREIGN KEY (issuer_id) REFERENCES Users(id)
);

CREATE TABLE MediaTypes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    file_type ENUM ("image", "video"),
    file_format ENUM("JPG", "JPEG", "PNG", "GIF", "WEBP", "MP4", "MPEG4", "MOV"),
    file_path VARCHAR(255) NOT NULL
);

CREATE TABLE Messages_MediaTypes (
	message_id INT NOT NULL,
    media_type_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (message_id) REFERENCES Messages(id),
    CONSTRAINT FOREIGN KEY (media_type_id) REFERENCES MediaTypes(id),
    PRIMARY KEY(message_id, media_type_id)
);

CREATE TABLE Friends_Lists (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    friend_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id),
    CONSTRAINT FOREIGN KEY (friend_id) REFERENCES Users(id),
    UNIQUE(user_id, friend_id),
    UNIQUE(friend_id, user_id),
    CONSTRAINT check_no_self_friendship CHECK (user_id <> friend_id ) 
);

CREATE TABLE Blocks_Lists (
	id INT AUTO_INCREMENT PRIMARY KEY,
    blocker_id INT NOT NULL,
    blocked_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (blocker_id) REFERENCES Users(id),
    CONSTRAINT FOREIGN KEY (blocked_id) REFERENCES Users(id),
    CONSTRAINT check_no_self_blocking CHECK (blocker_id <> blocked_id)
);

CREATE TABLE Profile_views (
	id INT AUTO_INCREMENT PRIMARY KEY,
    viewed_id INT NOT NULL,
    viewer_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (viewed_id) REFERENCES Users(id),
    CONSTRAINT FOREIGN KEY (viewer_id) REFERENCES Users(id)
);

CREATE TABLE Channels (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE,
    owner_id INT NOT NULL,
	CONSTRAINT FOREIGN KEY (owner_id) REFERENCES Users(id)
);

CREATE TABLE Subscribers_Chanels (
	channel_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (channel_id) REFERENCES Channels(id),
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id),
    PRIMARY KEY (channel_id, user_id)
);

CREATE TABLE Posts (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    upload_date DATETIME NOT NULL,
    channel_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (channel_id) REFERENCES Channels(id)
);

CREATE TABLE Comments (
	id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    upload_date DATETIME NOT NULL,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id),
    CONSTRAINT FOREIGN KEY (post_id) REFERENCES Posts(id)
);

CREATE TABLE Comments_Media_Types (
	comment_id INT NOT NULL,
    media_type_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (comment_id) REFERENCES Comments(id),
    CONSTRAINT FOREIGN KEY (media_type_id) REFERENCES MediaTypes(id),
    PRIMARY KEY(comment_id, media_type_id)
);

CREATE TABLE Likes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (post_id) REFERENCES Posts(id),
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id),
    UNIQUE(user_id, post_id)
);

CREATE TABLE Posts_Media_Types (
	post_id INT NOT NULL,
    media_type_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (post_id) REFERENCES Posts(id),
    CONSTRAINT FOREIGN KEY (media_type_id) REFERENCES MediaTypes(id),
    PRIMARY KEY(post_id, media_type_id)
);


