#Exercise 2

#Selects all messages sent from users in "Компютърни системи"
SELECT
	Chats.name AS "Chat Name",
	Issuers.username AS Sender,
    Messages.content AS Message,
    MediaTypes.file_path AS Path,
    MediaTypes.file_format AS Format,
    MediaTypes.file_type AS Type
FROM Messages
JOIN Chats 
	ON Chats.id = Messages.chat_id
JOIN Users AS Issuers
	ON Issuers.id = Messages.issuer_id
LEFT JOIN Messages_MediaTypes
	On Messages_MediaTypes.message_id = Messages.id
LEFT JOIN MediaTypes
	ON Messages_MediaTypes.media_type_id = MediaTypes.id
WHERE chat_id = 1;

#Selects all firends of Stiliyan
SELECT 
    u.username AS Accout,
    fl.friend_id,
    friend.username
FROM Users as u
JOIN Friends_Lists AS fl
	ON fl.user_id = u.id
JOIN Users AS friend
	ON fl.friend_id = friend.id
WHERE u.id = 1;

#Selects all blocked users from Stiliyan
SELECT 
	blocker.username AS "Current User",
    blocked.username AS "Blocked Friends"
FROM Users AS blocker
JOIN Blocks_Lists AS bl
	ON bl.blocker_id = blocker.id
JOIN Users AS blocked
	ON bl.blocked_id = blocked.id
WHERE blocker.id = 1;

#Selects all viewrs of the profile PowerCell
SELECT 
	viewed.username AS "Viewed Proifle",
    viewer.username AS "Viewer"
FROM Users AS viewed
JOIN Profile_views AS pv
	ON pv.viewed_id = viewed.id
JOIN Users AS viewer
	ON pv.viewer_id = viewer.id
WHERE viewed.id = 2;

#Selects all subscribers to the chanel Star wars
SELECT
	c.name AS Channels,
    owner.username AS Owner,
    subs.username AS Subscribers
FROM Users AS owner
JOIN Channels AS c
	ON c.owner_id = owner.id
JOIN Subscribers_Chanels AS sc
	ON sc.channel_id = c.id
JOIN Users AS subs
	ON subs.id = sc.user_id
WHERE c.id = 1;

#selects all comments under every post in channel Star wars
SELECT 
	chan.name AS Channel,
    p.title AS Post,
    u.username AS Sender,
    com.content AS Comment,
    com.upload_date AS Date
FROM Channels AS chan
JOIN Posts as p
	ON p.channel_id = chan.id
JOIN Comments as com
	ON com.post_id = p.id
JOIN Users AS u	
	ON u.id = com.user_id
WHERE chan.id = 1;
 
USE X_Twitter;