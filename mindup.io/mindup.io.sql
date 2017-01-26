-- Mindup.io est une application mobile qui permet à des users
-- anonymes de communiquer avec les utilisateurs qui sont proches
-- d'eux. Ils peuvent envoyer des topics (sorte de tweet) qui
--peuvent être liké et vue. De plus, il est possible de créer
--des chatroom pour discuter avec des utilisateurs via des
--message.

CREATE TABLE `chatroom` (
  `id` NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
  `chatroom_owner` int(11) NOT NULL,
  `chatroom_title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`chatroom_owner`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE `chatroom_message` (
  `id_message` NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
  `id_user` int(11),
  `id_chatroom` int(11),
  `message` varchar(45) NOT NULL,
  FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`id_chatroom`) REFERENCES `chatroom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)

CREATE TABLE `chatroom_user` (
  `id_chatroom` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_user`, `id_chatroom`),
  FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`id_chatroom`) REFERENCES `chatroom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `topic` (
  `id` NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
  `topic_owner` int(11) NOT NULL,
  `topic_content` varchar(45) NOT NULL,
  `lat` float NOT NULL DEFAULT '0',
  `long` float NOT NULL DEFAULT '0',
  `people` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`topic_owner`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `user` (
  `id` NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
  `lat` float NOT NULL DEFAULT '0',
  `long` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);

CREATE TABLE `user_topic` (
  `id_user` NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
  `id_topic` int(11) DEFAULT NULL,
  `like` int(11) NOT NULL DEFAULT '0',
  `seen` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`, `id_topic`),
  FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`id_topic`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
